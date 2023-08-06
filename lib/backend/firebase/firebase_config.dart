import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCsHpEBH_eB5dTY1URxccAvlgF-fUCdJiM",
            authDomain: "food-expiration-82ca0.firebaseapp.com",
            projectId: "food-expiration-82ca0",
            storageBucket: "food-expiration-82ca0.appspot.com",
            messagingSenderId: "584012263661",
            appId: "1:584012263661:web:88c58af00f13e0a0405ce4"));
  } else {
    await Firebase.initializeApp();
  }
}
