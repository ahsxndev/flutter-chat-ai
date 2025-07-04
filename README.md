# 🗣️ VoiceVerse AI

**VoiceVerse AI** is a sleek, real-time voice assistant app built with **Flutter**, enabling users to interact via **voice or text**. Whether you're speaking or typing, the app processes your input using OpenAI and delivers responses that are both displayed and spoken when applicable. It features animated UI elements, formatted markdown replies, and clean modular architecture — making it an ideal AI companion for modern mobile users.

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

## 🖼️ Screenshot

<img src="https://raw.githubusercontent.com/ahsxndev/flutter-chat-ai/main/assets/screenshot.png" width="100%"/>

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
````

---

## 🚀 Getting Started

To run this project locally:

1. **Clone the Repository**

   ```bash
   git clone https://github.com/ahsxndev/flutter-chat-ai.git
   ```

2. **Navigate to the project directory**

   ```bash
   cd flutter-chat-ai
   ```

3. **Install dependencies**

   ```bash
   flutter pub get
   ```

4. **Run the app**

   ```bash
   flutter run
   ```

---

## 🤝 Contributing

Have ideas or improvements? Contributions, issues, and feature requests are welcome!
Fork the repo, make your changes, and submit a pull request.

---

## 👨‍💻 Author

**Ahsan Zaman**
Flutter Developer
[GitHub](https://github.com/ahsxndev) · [LinkedIn](https://linkedin.com/in/ahxanzaman)

---

## 📄 License

This project is licensed under the **MIT License**.
See the [`LICENSE`](LICENSE) file for full details.

---

> *Crafted with ❤️ using Flutter and a love for intuitive AI experiences.*
