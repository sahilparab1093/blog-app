import 'package:blog_app/editprofile.dart';
import 'package:blog_app/followerspage.dart';
import 'package:blog_app/followingpage.dart';
import 'package:blog_app/forgot_password.dart';
import 'package:blog_app/homepage.dart';
import 'package:blog_app/intropage.dart';
import 'package:blog_app/loginpage.dart';
import 'package:blog_app/notificationpage.dart';
import 'package:blog_app/profilepage.dart';
import 'package:blog_app/searchpage.dart';
import 'package:blog_app/settingpage.dart';
import 'package:blog_app/uploadpage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Center(child: const HomePage()),
    );
  }
}
