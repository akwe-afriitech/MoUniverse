
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService{
  
FirebaseFirestore firestore = FirebaseFirestore.instance;

Future<void> uploadUserInfo({ required String uid ,required String name, required  String number}) async{

  final Map<String, dynamic> dataToUpload = {
    "name":name,
    "number": number,
  };
  try {
    await firestore.collection("momo_universe").doc(uid).set(dataToUpload);
  } on FirebaseException catch(e){
    print(e);
  }
}
}