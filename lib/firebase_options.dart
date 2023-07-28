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
    apiKey: 'AIzaSyBfppxm4qqUo60xeV2k7Ztr9z2qHc0lT6I',
    appId: '1:14884624350:web:afd49a693367dd40f16f4f',
    messagingSenderId: '14884624350',
    projectId: 'that-esp',
    authDomain: 'that-esp.firebaseapp.com',
    storageBucket: 'that-esp.appspot.com',
    measurementId: 'G-PNELZWER83',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBRimD4AB8hSwC6I9PgnTH9i9p7k76D8RI',
    appId: '1:14884624350:android:c8cd3492f6e69e8df16f4f',
    messagingSenderId: '14884624350',
    projectId: 'that-esp',
    storageBucket: 'that-esp.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCDQ-ZWjLkNInsYN5lcLz6eD9H1OnGxQ7A',
    appId: '1:14884624350:ios:dd7f652ccf600063f16f4f',
    messagingSenderId: '14884624350',
    projectId: 'that-esp',
    storageBucket: 'that-esp.appspot.com',
    iosClientId:
        '14884624350-m6e0lch5u9rk0ogqb23g2r07t0at3339.apps.googleusercontent.com',
    iosBundleId: 'com.example.thatEsp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCDQ-ZWjLkNInsYN5lcLz6eD9H1OnGxQ7A',
    appId: '1:14884624350:ios:dd7f652ccf600063f16f4f',
    messagingSenderId: '14884624350',
    projectId: 'that-esp',
    storageBucket: 'that-esp.appspot.com',
    iosClientId:
        '14884624350-m6e0lch5u9rk0ogqb23g2r07t0at3339.apps.googleusercontent.com',
    iosBundleId: 'com.example.thatEsp',
  );
}