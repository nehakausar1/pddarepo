import 'package:flutter/material.dart';
import 'package:pdda2/firebase_services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashScreen = SplashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashScreen.islogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: SingleChildScrollView(
      child: Form(
        // key: _formKey,

        child: Center(
          child: Column(children: [
            SizedBox(
              height: 250.0,
            ),
            Image.asset(
              "assets/images/logo.png",
              // fit: BoxFit.cover,
            ),
          ]

              // child: Text("Plant Disease detection App",style: ,),
              ),
        ),
      ),
    )));
  }
}
