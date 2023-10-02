import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:pdda2/Screens/auth/auth.dart';
import 'package:pdda2/Screens/auth/login_screen.dart';
import 'package:pdda2/Screens/auth/signup_screen.dart';
import 'package:pdda2/Screens/forgot_password.dart';

import '../../utils/utils.dart';
import '../../widgets/round_button.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isSignupScreen = true;
  bool isHiddenPassword = true;
  var obscureText = true;
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void login() {
    setState(() {
      loading = true;
    });
    _auth
        .signInWithEmailAndPassword(
            email: emailController.text.toString(),
            password: passwordController.text.toString())
        .then((value) {
      utils().toastMessage(value.user!.email.toString());
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
      setState(() {
        loading = false;
      });
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
      utils().toastMessage(error.toString());
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 350,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/leaf.png'),

                      // NetworkImage(
                      //     'https://img.freepik.com/premium-vector/texture-green-leaves-green-background-pattern-vector_532963-6459.jpg?w=2000'),
                      fit: BoxFit.fill)),
              child: Container(
                padding: EdgeInsets.only(top: 90, left: 20),
                color: Colors.black.withOpacity(.60),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                          text: TextSpan(
                        text: 'Welcome Back!',
                        style: TextStyle(
                            fontSize: 25,
                            letterSpacing: 2,
                            color: Colors.yellow[700]),
                      )),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Sign in to Continue',
                        style: TextStyle(color: Colors.white, letterSpacing: 1),
                      )
                    ]),
              ),
            ),
          ),
          Positioned(
            top: 200,
            child: Container(
              height: 380,
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 15,
                      spreadRadius: 5,
                    )
                  ]),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                        child: Column(
                          children: [
                            Text(
                              'LOGIN',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 3),
                              height: 2,
                              width: 55,
                              color: Colors.yellow[700],
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => signup_screen()));
                        },
                        child: Column(
                          children: [
                            Text(
                              'SIGNUP',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 3),
                              height: 2,
                              width: 55,
                              color: Colors.yellow[700],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Column(children: [
                      Form(
                        key: _formKey,
                        child: Column(children: [
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(35.0)),
                              hintText: 'Enter Email',
                              prefixIcon: Icon(Icons.email),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ("Email Required");
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            obscureText: isHiddenPassword,
                            controller: passwordController,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(35.0)),
                              hintText: 'Enter Password',
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon: InkWell(
                                  onTap: _togglePasswordView,
                                  child: Icon(isHiddenPassword
                                      ? Icons.visibility_off
                                      : Icons.visibility)),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ("Password Required");
                              }
                              return null;
                            },
                          ),
                        ]),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ForgotPasswordScreen()));
                          },
                          child: Text('Forgot Password?'),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 2),
                        width: 250,
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text: "By Pressing 'Submit' You agree to our",
                              style: TextStyle(color: Colors.grey),
                              children: [
                                TextSpan(
                                  text: " Terms and Conditions",
                                  style: TextStyle(
                                      color: Colors.yellow[700],
                                      fontWeight: FontWeight.bold),
                                ),
                              ]),
                        ),
                      )
                    ]),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Center(
                        child: RoundButton(
                          title: 'Sign In',
                          loading: loading,
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              login();
                            }
                          },
                          iconData: Icons.person,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height - 150,
            right: 0,
            left: 0,
            child: Column(
              children: [
                Center(
                  child: Text(
                    'Or Continue with ',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: SignInButton(Buttons.Google, onPressed: () {
                    signInWithGoogle();
                  }),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an Account?",
                      style: TextStyle(color: Colors.black),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const signup_screen()));
                        },
                        child: const Text("Sign up"))
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _togglePasswordView() {
    if (isHiddenPassword == true) {
      isHiddenPassword = false;
    } else {
      isHiddenPassword = true;
    }
    setState(() {});
  }
}
