import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mo_universe/service/auth.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthService>().user;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Home'),
        actions: [
          TextButton(onPressed: () async{
            await FirebaseAuth.instance.signOut();
          },
              child: Text('Sign out', style: TextStyle(color: Colors.white),),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(user.email != null && user.phoneNumber == null) Text(user.email!),
            if(user.phoneNumber != null && user.email == null) Text(user.phoneNumber!),
            ElevatedButton(
                onPressed: () {
                  context.read<AuthService>().deleteAccount(context: context);
            },
                child: Text('Delete Account'))
          ],
        ),
      ),
    );
  }
}

