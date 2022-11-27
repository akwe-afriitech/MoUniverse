import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mo_universe/service/auth.dart';

class SignUp extends StatefulWidget {


  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
  }

  void signUpUser() async {
    AuthService(FirebaseAuth.instance).signUpWithEmailAndPass(
        email: emailController.text,
        password: passwordController.text,
        context: context,
        name: nameController.text
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
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: 'Enter Name',
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
              SizedBox(height: 20.0,),
              ElevatedButton(
                  onPressed: signUpUser,
                  child: Text('Sign Up')
              ),
              SizedBox(height: 20.0,),
              ElevatedButton(
                  onPressed: (){ Navigator.pushNamed(context, '/signIn'); },
                  child: Text('Sign In')
              ),
              SizedBox(height: 40.0,),
              TextButton(onPressed: () { Navigator.pushNamed(context, '/phoneSignIn'); },
                  child: Text(
                    'Sign in with phone',
                    style: TextStyle(fontSize: 16.0, letterSpacing: 2,),
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
