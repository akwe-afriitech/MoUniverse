import 'dart:async';

import 'package:flutter/material.dart';
import '../registration/widget_tree.dart';

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 2),
        ()=>Navigator.pushReplacement(
            context,
          MaterialPageRoute(builder: (context)=> WidgetTree())
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 350,
          height: 250,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(20),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue,width: 5),
              shape: BoxShape.circle
            ),
            child: const Text("MoUniverse", style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.blue
            ),),
        ),
      ),
    );
  }
}
