import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'dart:async';

class VoiceInputScreen extends StatefulWidget {
  const VoiceInputScreen({super.key});

  @override
  State<VoiceInputScreen> createState() => _VoiceInputScreenState();
}

class _VoiceInputScreenState extends State<VoiceInputScreen>
    with SingleTickerProviderStateMixin {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _spokenText = '';
  double _soundLevel = 0.0;

  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  Timer? _idleTimer;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    _setupAnimation();
    _startListening();
  }

  void _setupAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.15).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  Future<void> _startListening() async {
    SystemSound.play(SystemSoundType.click);

    bool available = await _speech.initialize(
      onStatus: (status) {
        if (status == 'done' || status == 'notListening') {
          _stopAndReturn();
        }
      },
      onError: (error) => Navigator.pop(context),
    );

    if (!available) return;

    setState(() => _isListening = true);

    bool hasSpoken = false;

    _speech.listen(
      onResult: (val) {
        if (val.recognizedWords.isNotEmpty) {
          if (!hasSpoken) {
            hasSpoken = true;
            _idleTimer?.cancel();
          }

          setState(() => _spokenText = val.recognizedWords);
        }

        if (val.finalResult) {
          _stopAndReturn(); // ✅ stop immediately when speech ends
        }
      },
      listenFor: const Duration(seconds: 60),
      pauseFor: const Duration(seconds: 6),
      localeId: 'en_US',
      onSoundLevelChange: (level) => setState(() => _soundLevel = level),
      listenOptions: stt.SpeechListenOptions(
        partialResults: true,
        listenMode: stt.ListenMode.confirmation,
        cancelOnError: true,
        autoPunctuation: true,
      ),
    );

    // Only trigger idle timer for silence timeout
    _resetIdleTimer();
  }


  void _resetIdleTimer() {
    _idleTimer?.cancel();
    _idleTimer = Timer(const Duration(seconds: 6), () {
      if (mounted) _stopAndReturn();
    });
  }

  void _stopAndReturn() {
    _idleTimer?.cancel();
    _speech.stop();
    if (Navigator.canPop(context)) {
      Navigator.pop(context, _spokenText.trim());
    }
  }

  @override
  void dispose() {
    _idleTimer?.cancel();
    _speech.stop();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: _stopAndReturn,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Listening...",
                style: TextStyle(color: Colors.white70, fontSize: 22),
              ),
              const SizedBox(height: 30),

              ScaleTransition(
                scale: _scaleAnimation,
                child: Container(
                  padding: EdgeInsets.all(40 + (_soundLevel * 0.6)),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white10,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x4DFFFFFF),
                        blurRadius: 30,
                        spreadRadius: 8 + (_soundLevel / 2),
                      ),
                    ],
                  ),
                  child: const Icon(Icons.mic, size: 60, color: Colors.white),
                ),
              ),

              const SizedBox(height: 30),

              Text(
                _spokenText.isEmpty ? "Say something..." : "\"$_spokenText\"",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white54,
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Tap on mic to cancel",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
