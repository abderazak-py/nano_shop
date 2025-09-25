# Nano Shop

A modern e-commerce mobile application built with Flutter. This project showcases a complete shopping experience with product browsing, cart management, and user authentication.

## 📱 Features 

- Product catalog with categories 
- Product search and filtering 
- Shopping cart functionality 
- User authentication system 
- Order management 
- Responsive UI for all device sizes 

## 🛠️ Tech Stack 

- **Framework**: [Flutter](https://flutter.dev/) 
- State Management: [GetX](https://pub.dev/packages/get) 
- Local Storage: [GetStorage](https://pub.dev/packages/get_storage)
- Networking: [HTTP](https://pub.dev/packages/http) 
- UI Components: Material Design & Cupertino Icons 

## 🚀 Getting Started 

### Prerequisites

- Flutter SDK (version 3.9.2 or higher)

### Installation

1. Clone the repository:
    ```bash
    git clone https://github.com/abderazak-py/nano_shop.git
cd nano_shop 
Install dependencies:
dart
flutter pub get
Run the app:
dart
flutter run 

## 📁 Project Structure

The project is organized as follows:

- **lib/**  
  - `main.dart`                  # Entry point 
  - `controllers/`             # Business logic (GetX controllers) 
  - `models/`                   # Data models 
  - `views/`                    # Screens and pages 
  - `widgets/`                  # Custom reusable widgets 
  - `services/`                 # API and data services 
  - `utils/`                    # Helper classes and utilities
  - `routes/`                   # App routing configuration

## 🎨 UI Components 

- Custom product cards  
- Animated shopping cart 
- Pull-to-refresh functionality 
- Loading indicators 
- Error handling UI components 

### 🧪 Testing 
Run tests using:
```bash
flutter test
```

## 📦 Build for Production 

### Android (APK Generation)

```bash
flutter build apk --release
```

### iOS App

```bash
flutter build ios --release
```
📦 OR  
Generate IPA file (iOS): `flutter build ios --release`


🤝 Contributing 
Fork the project, create a feature branch (`git checkout -b feature/AmazingFeature`) and follow the standard contribution workflow.

📄 License 
This project is licensed under the MIT License. See the LICENSE file for details.

🙏 Acknowledgements

- Flutter Documentation
- GetX Package (part of Tech Stack)
- Flutter Community

📞 Support
If you have any questions or need help, open an issue in your repository!
