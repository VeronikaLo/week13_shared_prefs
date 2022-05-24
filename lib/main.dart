import 'package:flutter/material.dart';
import'package:week13_shared_prefs/screens/sign_in_screen.dart';
import'package:week13_shared_prefs/screens/sign_up_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        //entry screen
        '/': (context) => const SignInScreen(),
        //registration screen
        '/register': (context) => const SignUpScreen(),
      },
    );
  }
}