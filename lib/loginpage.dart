import 'package:blog_app/forgot_password.dart';
import 'package:blog_app/homepage.dart';
import 'package:blog_app/service/auth.dart';
import 'package:blog_app/signuppage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String email = "", password = "";

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  final _formkey = GlobalKey<FormState>();

  userLogin() async {
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage(

      )));
    } on FirebaseAuthException catch(e) {
      if(e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(backgroundColor: Colors.orangeAccent,content: Text('No user found for that Email', style: TextStyle(fontSize: 18.0, fontFamily: 'Poppins'),)));
      } else if(e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(backgroundColor: Colors.orangeAccent,content: Text('Wrong Password Provided by User', style: TextStyle(fontSize: 18.0, fontFamily: 'Poppins'),)));
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/Blog nest logo.png', width: 130,),
                const SizedBox(height: 10,),
                Form(
                  key: _formkey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextFormField(
                      validator: (value) {
                        if(value == null || value.isEmpty) {
                          return 'Please Enter the Email';
                        }
                      },
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'Email', suffixIcon: const Icon(Icons.email),
                        enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade400)),
                        fillColor: Colors.white,
                        filled: true,
                        errorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.red))
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFormField(
                    validator: (value) {
                      if(value == null || value.isEmpty) {
                        return 'Please Enter the Password';
                      }
                    },
                    controller: passwordController,
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade400)),
                      hintText: 'Password', suffixIcon: const Icon(Icons.password),
                      errorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                      fillColor: Colors.white,
                      filled: true
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                  ),
                ),
                const SizedBox(height: 10,),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgotPassword()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Forgot Password ?', style: TextStyle(color: Colors.grey.shade600, fontFamily: 'Poppins'),),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                GestureDetector(
                  onTap: () {
                    if(_formkey.currentState!.validate()) {
                      setState(() {
                        email = emailController.text;
                        password = passwordController.text;
                      });
                    }
                    userLogin();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(25),
                    margin: const EdgeInsets.symmetric(horizontal: 25.0),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8.0)
                    ),
                    child: const Center(
                      child: Text(
                        'Sign In',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 15, fontFamily: 'Poppins'),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: 25,),
                    Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[300],
                        )
                    ),
                    const Text('Or continue with', style: TextStyle( fontFamily: 'Poppins'),),
                    Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[300],
                        )
                    ),
                    const SizedBox(width: 25,)
                  ],
                ),
                const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(onTap: () {
                      AuthMethods().signInWithGoogle(context);
                    },child: Image.asset('assets/images/Google.png', height: 60,)),
                    Image.asset('assets/images/Apple.png', height: 50,),
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Not Registered?', style: TextStyle( fontFamily: 'Poppins'),),
                    const SizedBox(width: 4,),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpPage()));
                      },
                      child: const Text(
                        'Register here',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins'
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}