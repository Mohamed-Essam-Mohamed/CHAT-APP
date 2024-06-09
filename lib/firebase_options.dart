// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyDOuv8kDoFR6I1S0HI-44kNpVKjF_Zke5U',
    appId: '1:873299620588:web:8370d00fbe3d7bb0f02bc9',
    messagingSenderId: '873299620588',
    projectId: 'chat-app-6f669',
    authDomain: 'chat-app-6f669.firebaseapp.com',
    storageBucket: 'chat-app-6f669.appspot.com',
    measurementId: 'G-EDT80HTZ4D',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB4mPD6mKNp34Fn4dGvhz4_phKXL7Kseho',
    appId: '1:873299620588:android:4120db32e995a3c5f02bc9',
    messagingSenderId: '873299620588',
    projectId: 'chat-app-6f669',
    storageBucket: 'chat-app-6f669.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBi_j_IB_qZDCFITs6McEK3x5OK2WKHjR4',
    appId: '1:873299620588:ios:f58fad4d5befe843f02bc9',
    messagingSenderId: '873299620588',
    projectId: 'chat-app-6f669',
    storageBucket: 'chat-app-6f669.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBi_j_IB_qZDCFITs6McEK3x5OK2WKHjR4',
    appId: '1:873299620588:ios:f58fad4d5befe843f02bc9',
    messagingSenderId: '873299620588',
    projectId: 'chat-app-6f669',
    storageBucket: 'chat-app-6f669.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDOuv8kDoFR6I1S0HI-44kNpVKjF_Zke5U',
    appId: '1:873299620588:web:372149cfc12d4a0bf02bc9',
    messagingSenderId: '873299620588',
    projectId: 'chat-app-6f669',
    authDomain: 'chat-app-6f669.firebaseapp.com',
    storageBucket: 'chat-app-6f669.appspot.com',
    measurementId: 'G-K2WPSBGPMX',
  );
}