// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDRMo0YNzbHxxyTCecDmQKngtH55Sg7Hjw',
    appId: '1:230104185592:web:a698118bc09dc7d9be590d',
    messagingSenderId: '230104185592',
    projectId: 'chat-app-5842c',
    authDomain: 'chat-app-5842c.firebaseapp.com',
    storageBucket: 'chat-app-5842c.appspot.com',
    measurementId: 'G-MXDB2YE3BW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDbhSLeFd2hmMsnAa1_EbLXhkCNCGkB6sg',
    appId: '1:230104185592:android:cec1f2cbf8549145be590d',
    messagingSenderId: '230104185592',
    projectId: 'chat-app-5842c',
    storageBucket: 'chat-app-5842c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBcgLXBpCVsFt6l6jDGocKorBQaxiJLUQE',
    appId: '1:230104185592:ios:ff51489798133a4ebe590d',
    messagingSenderId: '230104185592',
    projectId: 'chat-app-5842c',
    storageBucket: 'chat-app-5842c.appspot.com',
    iosBundleId: 'com.example.chatapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBcgLXBpCVsFt6l6jDGocKorBQaxiJLUQE',
    appId: '1:230104185592:ios:acded824990f3c15be590d',
    messagingSenderId: '230104185592',
    projectId: 'chat-app-5842c',
    storageBucket: 'chat-app-5842c.appspot.com',
    iosBundleId: 'com.example.chatapp.RunnerTests',
  );
}