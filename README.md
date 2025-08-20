# 🖼️ Text to Image Generator

A Flutter-based mobile/Web application that allows users to generate images from text prompts using an external AI-powered API.

## 🚀 Features

- Convert any text prompt into a visually appealing image
- Simple and clean UI with real-time image preview
- API integration for image generation (e.g., Stability API AI services)

## 📱 Screenshots

<!-- Add screenshots in assets folder and link them here -->
<p align="center">
  <img width="300" alt="screenshot1" src="https://github.com/user-attachments/assets/6d94880e-cdfb-4030-b0c1-6113304e1671" />
  <img width="1902" height="884" alt="Screenshot 2025-08-20 123343" src="https://github.com/user-attachments/assets/c6d7abc5-82b0-4421-8acc-49d4411914db" />
</p>




## 🛠️ Tech Stack

- **Frontend:** Flutter (Dart)
- **Backend/API:** Stability API for text-to-image generation (you can plug in DALL·E, Replicate, etc.)

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



---
