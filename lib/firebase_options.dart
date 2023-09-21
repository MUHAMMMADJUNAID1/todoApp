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
    apiKey: 'AIzaSyDf3IamMn8FH8W_ploNW9NALhHEyrD4ARI',
    appId: '1:353964701606:web:a3997e22c71c70b0fc0167',
    messagingSenderId: '353964701606',
    projectId: 'todo-firebase-3791c',
    authDomain: 'todo-firebase-3791c.firebaseapp.com',
    storageBucket: 'todo-firebase-3791c.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBNfI858yUPf2fCZJOhFIjZzFu7aLac7dI',
    appId: '1:353964701606:android:973bb2aad94347fdfc0167',
    messagingSenderId: '353964701606',
    projectId: 'todo-firebase-3791c',
    storageBucket: 'todo-firebase-3791c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBgzqEgfwtHfXqRSdFHluD92Rm3wWgAgf8',
    appId: '1:353964701606:ios:daae949949c35a95fc0167',
    messagingSenderId: '353964701606',
    projectId: 'todo-firebase-3791c',
    storageBucket: 'todo-firebase-3791c.appspot.com',
    iosBundleId: 'com.example.todoList',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBgzqEgfwtHfXqRSdFHluD92Rm3wWgAgf8',
    appId: '1:353964701606:ios:9c13ad20f6d1af81fc0167',
    messagingSenderId: '353964701606',
    projectId: 'todo-firebase-3791c',
    storageBucket: 'todo-firebase-3791c.appspot.com',
    iosBundleId: 'com.example.todoList.RunnerTests',
  );
}
