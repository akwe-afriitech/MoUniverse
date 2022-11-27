import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mo_universe/udata.dart';
import 'package:mo_universe/userData.dart';

class DatabaseService {

  final String uid;
  DatabaseService({required this.uid});

  final CollectionReference moUniverse = FirebaseFirestore.instance.collection('links');
  
  Future updateUserData(String name) async{
    return await moUniverse.doc(uid).set({
      'name' : name
    });
  }

  List<UserData> _userDataListSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return UserData(
        name: doc['name'] ?? ''
      );
    }).toList();
  }
  Udata _udata(DocumentSnapshot snapshot){
    return Udata(name: snapshot['name'], uid: uid);
  }

  Stream<List<UserData>> get links{
    return moUniverse.snapshots().map<List<UserData>>(_userDataListSnapshot);
  }

  Stream<Udata> get userData {
    return moUniverse.doc(uid).snapshots().map<Udata>(_udata);
  }

}