import 'package:firebase_auth/firebase_auth.dart';
import 'package:mouniverse/registration/shared_pref_service.dart';
import '../models/person_model.dart';
import 'auth_service.dart';
import 'firestore_service.dart';


class AuthenticationRepository{

  final AuthService _authService = AuthService();
  final FirestoreService _firestoreService = FirestoreService();
  User? get _currentUser => _authService.currentUser;
  Person? currentPerson;

  Future<void> createAccount({required String email, required String password, required String name, required String number,})async {
    await _authService.createUserWithEmailAndPassword(email: email, password: password).whenComplete(() async {

      await _firestoreService.uploadUserInfo(name: name, number: number, uid: _currentUser!.uid);

      if(_currentUser!=null){
        //TODO: save user information to local storage

        currentPerson = Person(name: name, email: email, uid: _currentUser!.uid, number: number);
        saveUserToStorage(currentPerson!);
      }

    });


  }




}