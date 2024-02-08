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
    apiKey: 'AIzaSyAoewIH3F0DuVlc0jmDN_qNPNyCQwMBOMQ',
    appId: '1:201102952033:web:39cc98fcd3294e0abfcc20',
    messagingSenderId: '201102952033',
    projectId: 'cayon-company',
    authDomain: 'cayon-company.firebaseapp.com',
    storageBucket: 'cayon-company.appspot.com',
    measurementId: 'G-HPJDC8FCV2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDE4wc9AFccr1gOHqhwQZa8w7rzeoXm3m0',
    appId: '1:201102952033:android:0f7c1f04e1837694bfcc20',
    messagingSenderId: '201102952033',
    projectId: 'cayon-company',
    storageBucket: 'cayon-company.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDXWBcWe8hezcAUlY-xU0sJfHktOzxKNew',
    appId: '1:201102952033:ios:1fc96f748db54506bfcc20',
    messagingSenderId: '201102952033',
    projectId: 'cayon-company',
    storageBucket: 'cayon-company.appspot.com',
    iosBundleId: 'com.example.shopCar',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDXWBcWe8hezcAUlY-xU0sJfHktOzxKNew',
    appId: '1:201102952033:ios:7da67e91e63c8ab0bfcc20',
    messagingSenderId: '201102952033',
    projectId: 'cayon-company',
    storageBucket: 'cayon-company.appspot.com',
    iosBundleId: 'com.example.shopCar.RunnerTests',
  );
}