import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:pdda2/Screens/auth/home_screen.dart';
import 'package:pdda2/Screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          primaryColor: Colors.black),
      // theme: ThemeData(primarySwatch: Colors.green),
      home: SplashScreen(),
    );
  }
}
