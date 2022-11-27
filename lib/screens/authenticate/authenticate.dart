import 'package:flutter/material.dart';
import 'package:mo_universe/screens/authenticate/phone_sign_in.dart';
import 'package:mo_universe/screens/authenticate/sign_in.dart';
import 'package:mo_universe/screens/authenticate/sign_up.dart';

class Authenticate extends StatefulWidget {

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SignIn());
  }
}