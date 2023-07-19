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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBTX9jsWqZX0gt6LJ5UuroS0hTP1dIN8MI',
    appId: '1:944468229830:web:3432bfb7a0f02546b6e1c7',
    messagingSenderId: '944468229830',
    projectId: 'notification-fcm-6ebaf',
    authDomain: 'notification-fcm-6ebaf.firebaseapp.com',
    storageBucket: 'notification-fcm-6ebaf.appspot.com',
    measurementId: 'G-C42TD7EX0G',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDZu8JOisKOqH0Ru55ZwwEAvkHLLuVxrQk',
    appId: '1:944468229830:android:22f8a480275de17eb6e1c7',
    messagingSenderId: '944468229830',
    projectId: 'notification-fcm-6ebaf',
    storageBucket: 'notification-fcm-6ebaf.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD4WV1g8qXDtpU8Fqkewj4wggaOSSE6h_c',
    appId: '1:944468229830:ios:19144d858f1d89b9b6e1c7',
    messagingSenderId: '944468229830',
    projectId: 'notification-fcm-6ebaf',
    storageBucket: 'notification-fcm-6ebaf.appspot.com',
    iosClientId: '944468229830-bjnc30rb9dqd9f0fbdlfcrblanou9o1k.apps.googleusercontent.com',
    iosBundleId: 'com.example.notificationFcm',
  );
}