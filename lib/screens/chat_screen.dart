import 'package:chatt_aiii/screens/voice_input_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:gpt_markdown/gpt_markdown.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:flutter_tts/flutter_tts.dart';

const String GEMINI_API_KEY = 'YOUR_API_KEY';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<_Message> _messages = [];

  late GenerativeModel _model;
  late ChatSession _chat;

  bool _isTyping = false;
  late stt.SpeechToText _speech;
  late FlutterTts _flutterTts;

  @override
  void initState() {
    super.initState();

    _speech = stt.SpeechToText();
    _flutterTts = FlutterTts();
    _flutterTts.setLanguage('en-US');
    _flutterTts.setPitch(1.0);

    _model = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: GEMINI_API_KEY,
      systemInstruction: Content.text('''
You are VoiceVerse AI, a helpful and intelligent assistant developed by Ahsan Zaman.
If someone asks who you are, say "I was developed by Ahsan Zaman using Gemini by Google".
'''),
    );

    _chat = _model.startChat();

    _messages.add(
      _Message(
        text: "Hi! I’m VoiceVerse AI, your smart assistant developed by Ahsan Zaman. Ask me anything!",
        isUser: false,
      ),
    );
  }

  Future<void> getChatResponse(String input, {bool fromVoice = false}) async {
    setState(() {
      _messages.insert(0, _Message(text: input, isUser: true));
      _isTyping = true;
    });

    try {
      final response = await _chat.sendMessage(Content.text(input));
      final responseText = response.text;

      if (responseText != null) {
        setState(() {
          _messages.insert(0, _Message(text: responseText, isUser: false));
        });

        if (fromVoice) {
          await _flutterTts.speak(responseText);
        }
      }
    } catch (e) {
      setState(() {
        _messages.insert(
          0,
          _Message(text: '❌ Error: ${e.toString()}', isUser: false),
        );
      });
    }

    setState(() => _isTyping = false);

    await Future.delayed(const Duration(milliseconds: 100));
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  Widget _buildMessage(_Message message) {
    final isUser = message.isUser;
    final bgColor = isUser ? const Color(0xFF2F2F2F) : const Color(0xFF1A1A1A);
    final alignment = isUser ? Alignment.centerRight : Alignment.centerLeft;

    return Align(
      alignment: alignment,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(14),
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.85),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(18),
            topRight: const Radius.circular(18),
            bottomLeft: Radius.circular(isUser ? 18 : 4),
            bottomRight: Radius.circular(isUser ? 4 : 18),
          ),
        ),
        child: GptMarkdown(
          message.text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: isUser ? FontWeight.w600 : FontWeight.normal,
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  Widget _buildTypingIndicator() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SpinKitThreeInOut(
              color: Colors.white,
              size: 20.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: "Ask anything...",
                hintStyle: const TextStyle(color: Colors.grey),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.graphic_eq, color: Colors.grey),
                  onPressed: () async {
                    final spokenText = await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const VoiceInputScreen()),
                    );
                    if (spokenText != null && spokenText.toString().trim().isNotEmpty) {
                      getChatResponse(spokenText.toString().trim(), fromVoice: true);
                    }
                  },
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Material(
            color: Colors.white,
            shape: const CircleBorder(),
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: () {
                final text = _controller.text.trim();
                if (text.isNotEmpty) {
                  getChatResponse(text); // default: fromVoice = false
                  _controller.clear();
                }
              },
              child: const Padding(
                padding: EdgeInsets.all(12),
                child: Icon(Icons.send, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          title: Column(
            children: [
              const Text(
                'VoiceVerse AI',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x9966FF66),
                          blurRadius: 6,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 6),
                  const Text(
                    "Online",
                    style: TextStyle(color: Colors.green, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Image.asset(
                'assets/half_logo.png',
                height: 50,
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Image.asset(
                    'assets/chat_BG.png',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black54,
                          Colors.transparent,
                          Colors.black54,
                          Colors.transparent,
                        ],
                        stops: [0.0, 0.2, 0.8, 1.0],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    reverse: true,
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    itemCount: _messages.length + (_isTyping ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (_isTyping && index == 0) {
                        return _buildTypingIndicator();
                      }
                      final messageIndex = _isTyping ? index - 1 : index;
                      return _buildMessage(_messages[messageIndex]);
                    },
                  ),
                ),
                _buildInputBar(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Message {
  final String text;
  final bool isUser;
  _Message({required this.text, required this.isUser});
}
