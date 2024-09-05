// File generated by FlutterFire CLI.

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
    apiKey: 'AIzaSyAXe3c9tDRxjdahb8hAjyqQ9HPhIzJVNao',
    appId: '1:569830774909:web:e69b8fc590dbd8c5adf914',
    messagingSenderId: '569830774909',
    projectId: 'wallpaper-app-c3289-default',
    authDomain: 'wallpaper-app-c3289.firebaseapp.com',
    storageBucket: 'wallpaper-app-c3289.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBE2Kq7QMxS0-c0uOmWZgjdMl7dKMKfhlc',
    appId: '1:569830774909:android:68e765cff6490037adf914',
    messagingSenderId: '569830774909',
    projectId: 'wallpaper-app-c3289-default',
    storageBucket: 'wallpaper-app-c3289.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAI4P2QOeNO8VxKuAVpVLfPh4y4rHkklI4',
    appId: '1:569830774909:ios:f7341f7ffaced45eadf914',
    messagingSenderId: '569830774909',
    projectId: 'wallpaper-app-c3289-default',
    storageBucket: 'wallpaper-app-c3289.appspot.com',
    iosBundleId: 'com.example.wallpaperApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAI4P2QOeNO8VxKuAVpVLfPh4y4rHkklI4',
    appId: '1:569830774909:ios:f7341f7ffaced45eadf914',
    messagingSenderId: '569830774909',
    projectId: 'wallpaper-app-c3289-default',
    storageBucket: 'wallpaper-app-c3289.appspot.com',
    iosBundleId: 'com.example.wallpaperApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAXe3c9tDRxjdahb8hAjyqQ9HPhIzJVNao',
    appId: '1:569830774909:web:0cf1ff39fded3d25adf914',
    messagingSenderId: '569830774909',
    projectId: 'wallpaper-app-c3289-default',
    authDomain: 'wallpaper-app-c3289.firebaseapp.com',
    storageBucket: 'wallpaper-app-c3289.appspot.com',
  );
}
