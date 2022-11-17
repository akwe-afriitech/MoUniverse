class Person {
  final String name;
  final String email;
  final String uid;
  final String number;

  Person(
      {required this.name,
      required this.email,
      required this.uid,
      required this.number});

  Person.fromMap(Map map)
      : name = map["name"],
        email = map["email"],
        uid = map["uid"],
        number = map["number"];

  Map toMap(){
    return {"name": name,"number":number,"uid":uid,"email":email};
  }
}
