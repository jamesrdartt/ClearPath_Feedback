import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBZDqMrpZv0iIw2U37bTLBIm2_2aB9tOxM",
            authDomain: "clear-path-feedback-k3jc0k.firebaseapp.com",
            projectId: "clear-path-feedback-k3jc0k",
            storageBucket: "clear-path-feedback-k3jc0k.firebasestorage.app",
            messagingSenderId: "274095815229",
            appId: "1:274095815229:web:f4138a72b8c2d860e94854",
            measurementId: "G-4JCRMFWPNS"));
  } else {
    await Firebase.initializeApp();
  }
}
