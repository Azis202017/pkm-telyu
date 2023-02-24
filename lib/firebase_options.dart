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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAIx8ihkXGRdbAoEtMV9tGG_W6H4pr_iaA',
    appId: '1:1021778336572:android:a4de87ed6daa288f4e5c39',
    messagingSenderId: '1021778336572',
    projectId: 'pkm-telyu',
    storageBucket: 'pkm-telyu.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD7i0TNkeFVPWEY0lz37GGhYQcla7c4aA0',
    appId: '1:1021778336572:ios:66ac5eda5f8b19f94e5c39',
    messagingSenderId: '1021778336572',
    projectId: 'pkm-telyu',
    storageBucket: 'pkm-telyu.appspot.com',
    androidClientId: '1021778336572-3ji1ojrfujr93d0h2shl0j88rnecrg6q.apps.googleusercontent.com',
    iosClientId: '1021778336572-bs6dmci2tp5007pd470pks2cels1lj4b.apps.googleusercontent.com',
    iosBundleId: 'com.abdulazisalayubbi.pakas',
  );
}
