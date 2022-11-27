import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mo_universe/firebase_options.dart';
import 'package:mo_universe/screens/authenticate/authenticate.dart';
import 'package:mo_universe/screens/authenticate/phone_sign_in.dart';
import 'package:mo_universe/screens/authenticate/sign_in.dart';
import 'package:mo_universe/screens/authenticate/sign_up.dart';
import 'package:mo_universe/screens/pages/splash.dart';
import 'package:mo_universe/screens/wrapper.dart';
import 'package:mo_universe/service/auth.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create:(_) => AuthService(FirebaseAuth.instance),
        ),
        StreamProvider(
            create: (context) => context.read<AuthService>().authState,
            initialData: null,
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/signUp': (context) => SignUp(),
          '/signIn': (context) => SignIn(),
          '/phoneSignIn': (context) => PhoneSignIn()
        },
        home: splash(),
      ),
    );
  }
}