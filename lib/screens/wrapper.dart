import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mo_universe/screens/authenticate/authenticate.dart';
import 'package:mo_universe/screens/home/home.dart';
import 'package:mo_universe/screens/pages/dashboard.dart';
import 'package:provider/provider.dart';


class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.watch<User?>();

    if(user != null){
      return dashboard();
    }else{
      return Authenticate();
    }
  }
}