// import 'package:flutter/material.dart';
//
// class login extends StatelessWidget {
//   const login({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth.dart';
import 'auth_repository.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage="";
  bool isLogin = true;
  bool isVisible=false;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerNum = TextEditingController();



  Future<void> signInWithEmailAndPassword()async{
    try {
      await Auth().signInWithEmailAndPassword(
          email: _controllerEmail.text,
          password: _controllerPassword.text
      );
    } on FirebaseAuthException catch (e){
      setState(() {
        errorMessage= e.message;
      });
    }
  }
  Future<void> createUserWithEmailAndPassword()async{
    try {
      await Auth().createUserWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
        name: _controllerName.text,
        phoneNumber: _controllerNum.text,
      );
    } on FirebaseAuthException catch (e){
      setState(() {
        errorMessage= e.message;
      });
    }
  }
  Widget _title(){
    return const Text("UniSwif");
  }
  Widget _entryField(
      String title,
      TextEditingController controller,
      ){
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: title,
      ),
    );
  }
  Widget _errorMessage(){
    return Text(errorMessage?? "");
  }
  Widget _submitButton(){
    return ElevatedButton(
        onPressed: isLogin? signInWithEmailAndPassword : () async{
          await   AuthenticationRepository().createAccount(email: _controllerEmail.text, password: _controllerPassword.text, name: _controllerName.text, number: _controllerNum.text,);
        },
        child: Text(isLogin? "login" : "Register")
    );
  }
  Widget _loginOrRegisterButton(){
    return TextButton(
        onPressed:(){
          setState(() {
            isLogin = !isLogin;
            isVisible = ! isVisible;

          });
        },
        child: Text(isLogin? "Register":"Login")
    );
  }



  @override
  void dispose() {
    _controllerNum.dispose();
    _controllerName.dispose();
    _controllerPassword.dispose();
    _controllerEmail.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: _title(),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Visibility(
              visible: isVisible ,
              child: Column(
                children: <Widget>[
                  _entryField("Momo Name", _controllerName),
                  _entryField("momo number", _controllerNum),
                ],
              ),
            ),

            _entryField("email", _controllerEmail),
            _entryField("password", _controllerPassword),
            _errorMessage(),
            _submitButton(),
            _loginOrRegisterButton()
          ],
        ),
      ),

    );
  }
}