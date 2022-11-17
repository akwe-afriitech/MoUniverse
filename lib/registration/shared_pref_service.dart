import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/person_model.dart';

late SharedPreferences sharedPrefs;

Person? savedUser;
List<Person> personSP = <Person>[];

void getUserFromStorage() {
  List<String>? savedUserList = sharedPrefs.getStringList("savedPerson");
  savedUser = savedUserList!.map((e) => Person.fromMap(json.decode(e))).toList().first;
}

void saveUserToStorage(Person person) {
  personSP.add(person);
  List<String> personToSave =
      personSP.map((savedPerson) => jsonEncode(savedPerson.toMap())).toList();
  sharedPrefs.setStringList("savedPerson", personToSave);
}

void deleteUserFromStorage() {
  personSP.clear();
  List<String> personToSave =
  personSP.map((savedPerson) => jsonEncode(savedPerson.toMap())).toList();
  sharedPrefs.setStringList("savedPerson", personToSave);
}
