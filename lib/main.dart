import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mouniverse/screens/splash.dart';

Future<void>main ()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp())
;
SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  statusBarColor: Colors.blue,
    systemNavigationBarColor: Colors.blue
  )
);}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: splash(),
    );
  }
}
