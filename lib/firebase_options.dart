// File ini dikonfigurasi berdasarkan google-services.json dari Firebase project.
// Project ID: flutterxauth

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'Web platform belum dikonfigurasi. Tambahkan konfigurasi web dari Firebase Console.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'iOS platform belum dikonfigurasi. Tambahkan GoogleService-Info.plist dari Firebase Console.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'macOS platform belum dikonfigurasi.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'Windows platform belum dikonfigurasi.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'Linux platform belum dikonfigurasi.',
        );
      default:
        throw UnsupportedError('Platform tidak dikenali.');
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDUTlqyKaprEgiBpicTJFwBzVEL_Gdr6vw',
    appId: '1:186780311890:android:e351e7029ef53dce651a8b',
    messagingSenderId: '186780311890',
    projectId: 'flutterxauth',
    storageBucket: 'flutterxauth.firebasestorage.app',
  );
}
