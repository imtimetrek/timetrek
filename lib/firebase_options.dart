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
    apiKey: 'AIzaSyBqe_wn53Y78ND4e0AVAJWLvUuWgUneTyw',
    appId: '1:961439948799:web:3ef42d3a14787f15a3d1ca',
    messagingSenderId: '961439948799',
    projectId: 'timetrek-timetrek',
    authDomain: 'timetrek-timetrek.firebaseapp.com',
    storageBucket: 'timetrek-timetrek.appspot.com',
    measurementId: 'G-92BL10617R',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAuh6GDEauLHTqdDJBMyjrpJfqCOYNG_ww',
    appId: '1:961439948799:android:5c3deb9916fcafb5a3d1ca',
    messagingSenderId: '961439948799',
    projectId: 'timetrek-timetrek',
    storageBucket: 'timetrek-timetrek.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCRGVvKCekDoHuqwxMVVSb3mxZlH-mtPCM',
    appId: '1:961439948799:ios:f521d1fcaeda9e91a3d1ca',
    messagingSenderId: '961439948799',
    projectId: 'timetrek-timetrek',
    storageBucket: 'timetrek-timetrek.appspot.com',
    androidClientId: '961439948799-tkj3q3npr5r50hmvrbd7ioct2sg67rjb.apps.googleusercontent.com',
    iosClientId: '961439948799-mv4t2hksi2qkuggrvola8drbpp2d5hqi.apps.googleusercontent.com',
    iosBundleId: 'com.timetrek.timetrek',
  );
}
