import 'package:blog_app/homepage.dart';
import 'package:blog_app/loginpage.dart';
import 'package:blog_app/service/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String email = "", password = "", name = "";
  TextEditingController namecontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();
  TextEditingController emailcontroller = new TextEditingController();
  final _formkey = GlobalKey<FormState>();

  registration()async{
    if(password!=null && namecontroller.text!="" && emailcontroller.text!=""){
      try{
        UserCredential userCredential= await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Registered Successfully", style: TextStyle(fontSize: 20.0, fontFamily: 'Poppins'),)));
        Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
      } on FirebaseAuthException catch(e) {
        if(e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(backgroundColor: Colors.orangeAccent,content: Text("Password Provided is too Weak", style: TextStyle(fontSize: 18.0, fontFamily: 'Poppins'),)));
        } else if(e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(backgroundColor: Colors.orangeAccent,content: Text('Account already exist',style: TextStyle(fontSize: 18.0, fontFamily: 'Poppins'),)));
        }
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
                const SizedBox(height: 5,),
                Text("Welcome Back, you've been missed!", style: TextStyle(fontSize: 16, fontFamily: 'Poppins' ,color: Colors.grey[700],),),
                const SizedBox(height: 30,),
                Form(
                  key: _formkey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextFormField(
                      validator: (value) {
                        if(value==null || value.isEmpty) {
                          return 'Please enter the name';
                        }
                        return null;
                      },
                      controller: namecontroller,
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade400)),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Username', suffixIcon: const Icon(Icons.supervised_user_circle)
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFormField(
                    validator: (value) {
                      if(value==null || value.isEmpty) {
                        return 'Please enter the email';
                      }
                      return null;
                    },
                    controller: emailcontroller,
                    decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade400)),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Email', suffixIcon: const Icon(Icons.email)
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFormField(
                    validator: (value) {
                      if(value==null || value.isEmpty) {
                        return 'Please enter the password';
                      }
                      return null;
                    },
                    controller: passwordcontroller,
                    decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade400)),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Password', suffixIcon: const Icon(Icons.password)
                    ),
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                ),
                const SizedBox(height: 30,),
                GestureDetector(
                  onTap: () {
                    if(_formkey.currentState!.validate()) {
                      setState(() {
                        email = emailcontroller.text;
                        name = namecontroller.text;
                        password = passwordcontroller.text;
                      });
                    }
                    registration();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(25.0),
                    margin: const EdgeInsets.symmetric(horizontal: 25.0),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 15, fontFamily: 'Poppins'),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50,),
                Row(
                  children: [
                    const SizedBox(width: 25,),
                    Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[300],
                        ),
                    ),
                    const Text('Or continue with', style: TextStyle( fontFamily: 'Poppins'),),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[300],
                      ),
                    ),
                    const SizedBox(width: 25,),
                  ],
                ),
                const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(onTap: () {
                      AuthMethods().signInWithGoogle(context);
                    },child: Image.asset('assets/images/Google.png', height: 60,)),
                    Image.asset('assets/images/Apple.png', height: 50,)
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?', style: TextStyle( fontFamily: 'Poppins'),),
                    const SizedBox(width: 4,),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                      },
                      child: const Text(
                          'Login here',
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'Poppins'
                          ),
                      ),
                    ),
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