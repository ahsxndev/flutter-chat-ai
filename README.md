<div align="center">

# 🗣️ VoiceVerse AI

### A sleek, real-time voice assistant app built with Flutter

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![AI](https://img.shields.io/badge/Gemini-8E75B2?style=for-the-badge&logo=google&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green.svg?style=for-the-badge)

**VoiceVerse AI** is a sleek, real-time voice assistant app built with **Flutter**, enabling users to interact via **voice or text**. Whether you're speaking or typing, the app processes your input using Gemini and delivers responses that are both displayed and spoken when applicable.

<img src="https://raw.githubusercontent.com/ahsxndev/flutter-chat-ai/main/assets/screenshot.png" width="100%"/>


[![Open Source Love svg1](https://badges.frapsoft.com/os/v1/open-source.svg?v=103)](#)
[![GitHub Forks](https://img.shields.io/github/forks/ahsxndev/flutter-chat-ai.svg?style=social&label=Fork&maxAge=2592000)](https://github.com/ahsxndev/flutter-chat-ai/fork)
[![GitHub Issues](https://img.shields.io/github/issues/ahsxndev/flutter-chat-ai.svg?style=flat&label=Issues&maxAge=2592000)](https://github.com/ahsxndev/flutter-chat-ai/issues)
[![contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat&label=Contributions&colorA=red&colorB=black)](#)

Features beautiful UI elements, formatted markdown replies, and clean modular architecture — making it an ideal AI companion for modern mobile users.

</div>

---

## 📱 Features

- 🔄 **Dual Input Support**
  - 🎙️ **Voice Input** → Transcribes spoken words into text, displays them, and provides **text + spoken** AI responses.
  - 💬 **Text Input** → Sends typed messages and displays **text-only** AI responses.

- 🧠 **AI Response with TTS**  
  Hear smart replies using `flutter_tts` when using voice input.

- 🪄 **Formatted AI Responses**  
  Display output with rich formatting (code blocks, lists, links) using `gpt_markdown`.

- 💬 **Typing Indicator**  
  Animated loading indicator with `flutter_spinkit` for real-time AI response feel.

- 📝 **Speech-to-Text Conversion**  
  Uses `speech_to_text` to transcribe voice in real time with high accuracy.

- 🚀 **Splash Screen Setup**  
  Smooth branded launch experience with `flutter_native_splash`.

- 💡 **Material 3 Theming**  
  Clean and responsive UI built with the latest Material Design guidelines.

- 🧩 **Modular Codebase**  
  Scalable and organized folder structure with reusable widgets.

---

## 🛠️ Tech Stack

| Technology                  | Purpose                                   |
|----------------------------|-------------------------------------------|
| **Flutter**                | Cross-platform UI development             |
| **Dart**                   | Programming language                      |
| **speech_to_text**         | Real-time voice input                     |
| **flutter_tts**            | Text-to-speech for AI replies             |
| **flutter_spinkit**        | Animated typing/loading indicators        |
| **flutter_native_splash**  | Native splash screen setup                |
| **gpt_markdown**           | Rich-text rendering for AI responses      |
| **Material 3**             | UI theming and widgets                    |

---

## 📁 Folder Structure

```plaintext
lib/
├── screens/
│   ├── chat_screen.dart            # AI chat screen with typing and responses
│   ├── starter_screen.dart         # Welcome/start new chat screen
│   └── voice_input_screen.dart     # Mic interface for voice input
├── main.dart                       # App entry point
```

---

## 🚀 Getting Started

### Prerequisites
```bash
Flutter SDK    >=3.0.0
Dart SDK       >=2.17.0
Android Studio or VS Code
Microphone permissions for voice input
```

### Installation

To run this project locally:

1. **Clone the Repository**
   ```bash
   git clone https://github.com/ahsxndev/flutter-chat-ai.git
   cd flutter-chat-ai
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure API Keys**
   ```bash
   # Add your Gemini API key to the configuration
   # Update the API configuration in your app
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

---

## 🤝 Contributing

Have ideas or improvements? Contributions, issues, and feature requests are welcome!

1. **Fork** the repository
2. **Create** your feature branch (`git checkout -b feature/amazing-feature`)
3. **Commit** your changes (`git commit -m 'Add amazing feature'`)
4. **Push** to the branch (`git push origin feature/amazing-feature`)
5. **Open** a Pull Request

### Areas for Contribution
- 🌍 **Multi-language support** - Add more language options
- 🎨 **UI/UX improvements** - Enhance design and user experience
- 🔧 **New features** - Voice commands, conversation history
- 🐛 **Bug fixes** - Report and fix issues

---

## 📄 License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgments

**Special Thanks:**

🤖 **Google Gemini** - For powerful AI capabilities  
🎙️ **Flutter Speech Community** - For excellent voice recognition packages  
💙 **Flutter Team** - For the amazing cross-platform framework  
🌟 **Open Source Contributors** - For continuous improvements and feedback  

---

## 👤 Author & Contact

<div align="center">

### **Ahsan Zaman**
*Flutter Developer & AI Enthusiast*

[![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/ahsxndev)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://linkedin.com/in/ahxanzaman)
[![Email](https://img.shields.io/badge/Email-D14836?style=for-the-badge&logo=gmail&logoColor=white)](mailto:ahsanzaman.dev@gmail.com)

**Found this helpful?** Give it a ⭐ on GitHub and share your feedback!

[![GitHub followers](https://img.shields.io/github/followers/ahsxndev?style=social)](https://github.com/ahsxndev)
[![GitHub stars](https://img.shields.io/github/stars/ahsxndev/flutter-chat-ai?style=social)](https://github.com/ahsxndev/flutter-chat-ai)

</div>

---

<div align="center">

**Built with ❤️ using Flutter and AI**

*Crafted with passion for intuitive voice experiences* 🗣️✨

**"The future of human-computer interaction is conversational"**

[⭐ Star this repo](https://github.com/ahsxndev/flutter-chat-ai) • [🐛 Report Bug](https://github.com/ahsxndev/flutter-chat-ai/issues) • [💡 Request Feature](https://github.com/ahsxndev/flutter-chat-ai/issues)

</div>
