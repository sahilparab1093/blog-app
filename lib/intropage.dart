import 'dart:async';
import 'package:blog_app/signuppage.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 2),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => const SignUpPage()))
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/Blog nest logo.png', width: 300, height: 300,),
      ),
    );
  }
}