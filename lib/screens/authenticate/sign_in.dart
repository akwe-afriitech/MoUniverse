import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mo_universe/screens/authenticate/phone_sign_in.dart';
import 'package:mo_universe/service/auth.dart';

class SignIn extends StatefulWidget {


  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void signInUser() async {
    AuthService(
        FirebaseAuth.instance).signInWithEmailAndPass(
        email: emailController.text,
        password: passwordController.text,
        context: context
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'Enter Email',
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurpleAccent, width: 2.0),
                  ),
                ),
              ),
              SizedBox(height: 10.0,),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  hintText: 'Enter Password',
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurpleAccent, width: 2.0),
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: signInUser,
                  child: Text('Sign In')
              ),
              SizedBox(height: 20.0,),
              ElevatedButton(
                  onPressed: (){ Navigator.pushNamed(context, '/signUp'); },
                  child: Text('Sign Up')
              ),
              SizedBox(height: 40.0,),
              TextButton(
                child: Text(
                    'Sign in with phone',
                  style: TextStyle(fontSize: 16.0, letterSpacing: 2,),
                ),
                onPressed: () { Navigator.pushNamed(context, '/phoneSignIn'); },
              )
            ],
          ),
        ),
      ),
    );
  }
}
