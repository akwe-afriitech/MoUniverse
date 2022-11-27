import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:mo_universe/shared/show_otp_dialog.dart';

import '../shared/snack_bar.dart';

class AuthService {

  final FirebaseAuth _auth;

  AuthService( this._auth);

  User get user => _auth.currentUser!;

  //Auth changes
  Stream<User?> get authState => _auth.authStateChanges();
  // FirebaseAuth.instance.userChanges();
  // FirebaseAuth.instance.iDTokenChanges();

  //email and pass
    Future<void> signUpWithEmailAndPass({
      required String name,
      required String email,
      required String password,
      required BuildContext context,
    }) async {
      try {
        await _auth.createUserWithEmailAndPassword(email: email, password: password);

        await sendEmailVerification(context);
      } on FirebaseAuthException catch (e) {
        showSnackBar(context, e.message!);
      }
    }
    //email verification
    Future<void> sendEmailVerification(BuildContext context) async{
      try {
       await _auth.currentUser!.sendEmailVerification();
        showSnackBar(context, 'Email verification sent!');
      } on FirebaseAuthException catch (e) {
        showSnackBar(context, e.message!);
      }
    }
    Future<void> signInWithEmailAndPass({
      required String email,
      required String password,
      required BuildContext context
}) async {
      try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      if(!_auth.currentUser!.emailVerified) {
        await sendEmailVerification(context);
      }
    } on FirebaseAuthException catch(e) {
        showSnackBar(context, e.message!);
      }
  }
      //phone sign in
  Future<void> phoneSignin(BuildContext context, String phoneNumber) async {
      TextEditingController codeController = TextEditingController();

      //web auth
      if(kIsWeb) {
        ConfirmationResult result = await _auth.signInWithPhoneNumber(phoneNumber);

        showOTPDialog(
            codeController: codeController,
            context: context,
            onPressed: () async {
              PhoneAuthCredential credential = PhoneAuthProvider.credential(
                verificationId:  result.verificationId,
                smsCode: codeController.text.trim(),
              );
              await _auth.signInWithCredential(credential);
              Navigator.of(context).pop();
            }
        );
      }else {
        //for ios and android
        await _auth.verifyPhoneNumber(
            phoneNumber: phoneNumber,
            verificationCompleted: (PhoneAuthCredential credential) async {
              await _auth.signInWithCredential(credential);
            },
            verificationFailed: (e) {
              showSnackBar(context, e.message!);
            },
            codeSent: ((String verificationId, int? resendToken) async {
              showOTPDialog(
                  codeController: codeController,
                  context: context,
                  onPressed: () async {
                    PhoneAuthCredential credential = PhoneAuthProvider
                        .credential(
                      verificationId: verificationId,
                      smsCode: codeController.text.trim(),
                    );
                    await _auth.signInWithCredential(credential);
                    Navigator.of(context).pop();
                  }
              );
            }),
            codeAutoRetrievalTimeout: (String verificationid) {}
        );
      }
}
     //sign out
     Future<void> signOut({ required BuildContext context}) async{
      try{
        await _auth.signOut();
      }on FirebaseAuthException catch (e) {
        showSnackBar(context, e.message!);
      }
     }
     //delete account
      Future<void> deleteAccount({ required BuildContext context}) async{
      try{
        await _auth.currentUser!.delete();
      } on FirebaseAuthException catch (e){
        showSnackBar(context, e.message!);
      }
    }
}