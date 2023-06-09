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
    apiKey: 'AIzaSyCaEIuNKumL5judTOFqYnHq9ZXgxHDGwZQ',
    appId: '1:653387730810:web:6417cf346f7fdb0d0e10c3',
    messagingSenderId: '653387730810',
    projectId: 'chat-app-f307d',
    authDomain: 'chat-app-f307d.firebaseapp.com',
    storageBucket: 'chat-app-f307d.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBLRwdc12SrasDDsHz6J2-yhk5fL6sDv3o',
    appId: '1:653387730810:android:087d245258a2dfe00e10c3',
    messagingSenderId: '653387730810',
    projectId: 'chat-app-f307d',
    storageBucket: 'chat-app-f307d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAKizwhPR4sBv3BD6WCKaA57N-CGTAtX4s',
    appId: '1:653387730810:ios:c8ad1a3c4d9c386d0e10c3',
    messagingSenderId: '653387730810',
    projectId: 'chat-app-f307d',
    storageBucket: 'chat-app-f307d.appspot.com',
    iosClientId: '653387730810-2lhd7047bus4og1jjbb6f68gebcg6dvb.apps.googleusercontent.com',
    iosBundleId: 'com.example.scholarchatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAKizwhPR4sBv3BD6WCKaA57N-CGTAtX4s',
    appId: '1:653387730810:ios:c8ad1a3c4d9c386d0e10c3',
    messagingSenderId: '653387730810',
    projectId: 'chat-app-f307d',
    storageBucket: 'chat-app-f307d.appspot.com',
    iosClientId: '653387730810-2lhd7047bus4og1jjbb6f68gebcg6dvb.apps.googleusercontent.com',
    iosBundleId: 'com.example.scholarchatApp',
  );
}
