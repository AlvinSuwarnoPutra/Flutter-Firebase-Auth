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
    apiKey: 'AIzaSyCsiGcknbr0HN96AAgxwTnWA2Aj8d1AWeA',
    appId: '1:876493641811:web:9a93557336758de0528ea6',
    messagingSenderId: '876493641811',
    projectId: 'auth-firebase-e9b98',
    authDomain: 'auth-firebase-e9b98.firebaseapp.com',
    storageBucket: 'auth-firebase-e9b98.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAuD2fSfG-lS8dNMlL8aY64pQJ2nYzAzUc',
    appId: '1:876493641811:android:b52ca0bbe8eddd53528ea6',
    messagingSenderId: '876493641811',
    projectId: 'auth-firebase-e9b98',
    storageBucket: 'auth-firebase-e9b98.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCwHppGyCOwBb5i2H3LkaDS0KOeVyU64ms',
    appId: '1:876493641811:ios:8cba395561a41164528ea6',
    messagingSenderId: '876493641811',
    projectId: 'auth-firebase-e9b98',
    storageBucket: 'auth-firebase-e9b98.appspot.com',
    iosBundleId: 'com.example.authFirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCwHppGyCOwBb5i2H3LkaDS0KOeVyU64ms',
    appId: '1:876493641811:ios:8cba395561a41164528ea6',
    messagingSenderId: '876493641811',
    projectId: 'auth-firebase-e9b98',
    storageBucket: 'auth-firebase-e9b98.appspot.com',
    iosBundleId: 'com.example.authFirebase',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCsiGcknbr0HN96AAgxwTnWA2Aj8d1AWeA',
    appId: '1:876493641811:web:2b0aca990c5807cb528ea6',
    messagingSenderId: '876493641811',
    projectId: 'auth-firebase-e9b98',
    authDomain: 'auth-firebase-e9b98.firebaseapp.com',
    storageBucket: 'auth-firebase-e9b98.appspot.com',
  );
}
