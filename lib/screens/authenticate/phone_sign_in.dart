import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../service/auth.dart';


class PhoneSignIn extends StatefulWidget {
  const PhoneSignIn({Key? key}) : super(key: key);

  @override
  State<PhoneSignIn> createState() => _PhoneSignInState();
}

class _PhoneSignInState extends State<PhoneSignIn> {

  final TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
  }

  void phoneSignIn() async {
    AuthService(FirebaseAuth.instance).phoneSignin(context, phoneController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: phoneController,
              decoration: const InputDecoration(
                hintText: 'Enter Phone number',
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
            SizedBox(height: 20.0,),
            TextButton(
                onPressed: phoneSignIn,
                child: Text('SEND OTP',style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),)
            ),
            SizedBox(height: 40.0,),
            TextButton(onPressed: () { Navigator.pop(context); },
              child: Text(
                  'Sign up with email and password',
                style: TextStyle(fontSize: 14.0, letterSpacing: 1.5,),
              ),
            )
          ],
        ),
      ),
    );
  }
}
