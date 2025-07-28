# 🖼️ Text to Image Generator

A Flutter-based mobile application that allows users to generate images from text prompts using an external AI-powered API.

## 🚀 Features

- Convert any text prompt into a visually appealing image
- Simple and clean UI with real-time image preview
- API integration for image generation (e.g., DALL·E, Replicate, or other AI services)

## 📱 Screenshots

<!-- Add screenshots in assets folder and link them here -->
<p align="center">
  <img src="assets/<img width="534" height="500" alt="screenshot1" src="https://github.com/user-attachments/assets/e71a2a7f-7c50-4953-a170-81a2b387f514" />
" width="150"/>
  <img src="assets/screenshot2.png" width="250"/>
</p>

## 🛠️ Tech Stack

- **Frontend:** Flutter (Dart)
- **Backend/API:** RESTful API for text-to-image generation (you can plug in DALL·E, Replicate, etc.)

## 📦 Packages Used

- `http` – For making API requests
- `flutter_dotenv` – To manage API keys securely (if used)
- `provider` or `get` – For state management (if applicable)

## 🔧 Setup Instructions

1. Clone the repository:
   ```bash
   git clone https://github.com/Shivanigupta00/Text_To_Image_Generator.git
   cd Text_To_Image_Generator
2. Get packages:
    flutter pub get

3. Run the app:  
    flutter run

## 📁 Project Structure

lib/
├── main.dart
├── api_service.dart
├── ui/
│ ├── home_screen.dart
│ └── image_display.dart
   
💡 Future Improvements
Add image download and share functionality

Add prompt suggestions

Improve loading state and error handling

🙌 Contributing
Feel free to fork the project and submit pull requests. Open issues for bugs or feature suggestions.

✨ Made with Flutter and ❤️ by Shivani Gupta

---
