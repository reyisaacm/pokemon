# Pokemon Flutter

Pokemon app on flutter

## Constraints and dependency
- This app is designed to run only on mobile devices running Android or IOS.
- Due to the limited devices this app is only tested to work on Samsung's Android 12, Samsung's Android 13, Vivo's Android 14, and iPhone 15 iOS 17. Other devices may or may not work as intended.
- The orientation of the app is only portrait.
- Due to lack of Apple Developer Account the CI/CD will only publish android APK file.
- As of version 1.0.0 this app will build successfully when you use flutter version 3.19.3. Other version may or might not work as intended.
- As of version 1.0.0 when a pokemon has more than 1 next evolution line, only the first one will be followed.

## Getting Started

### Running app on iOS
For iOS you need to manually build the files. Please make sure you have valid developer certificates. To setup these certificates please follow the official Apple developer documentation.

Install flutter according to the official documentation
> https://docs.flutter.dev/get-started/install/macos/mobile-ios

Connect your iPhone or run a simulator. Then in your terminal type:
> flutter run

If you want to build from the source for iPhone please follow this guide:
> https://docs.flutter.dev/deployment/ios

### Running app on Android
For Android you can either get the APK on the release pages 
> https://github.com/reyisaacm/pokemon/releases

or you can build manually manually.

To build manually, Install flutter according to the official documentation, follow the guide according to the operating system that you use
> https://docs.flutter.dev/get-started/install

Connect your Android device or run a simulator. Then in your terminal type:
> flutter run

If you want to build from the source for Android device please follow this guide:
> https://docs.flutter.dev/deployment/android