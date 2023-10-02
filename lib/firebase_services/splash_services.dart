import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pdda2/Screens/auth/home_screen.dart';
import 'package:pdda2/Screens/auth/signup_screen.dart';

import '../Screens/auth/login_screen.dart';

class SplashServices {
  void islogin(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if (user != null) {
      Timer(
          Duration(seconds: 3),
          () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomeScreen())));
    } else {
      Timer(
          Duration(seconds: 3),
          () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const signup_screen())));
    }
  }
}
