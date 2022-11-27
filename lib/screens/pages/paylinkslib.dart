import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class paylinkslib extends StatelessWidget {
   paylinkslib({Key? key}) : super(key: key);

   final Stream<QuerySnapshot> prl = FirebaseFirestore.instance.collection('prl').snapshots();
   final Stream<QuerySnapshot> donor = FirebaseFirestore.instance.collection('donor').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: 1000,
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      child: Text('Paylink',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        fontStyle: FontStyle.italic,
                      ),),
                    ),
                    Container(
                      width: 360,
                      height: 280,
                      padding: EdgeInsets.all(0),
                      margin: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white70,
                        border: Border.all(color: Colors.blueGrey ,width: 2),
                      ),
                      child: ListView(
                        children: [
                          ListTile(
                            leading: CircleAvatar(child: Icon(Icons.link), backgroundColor: Colors.blue,),
                            title: Container(
                              child: StreamBuilder<QuerySnapshot>(stream: prl, builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                                if (snapshot.hasError) {
                                  return Text("error loading data");
                                }
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return Text("loading.....");
                                }
                                final data1 = snapshot.requireData;
                                return Text("${data1.docs[0]['productname']} ",
                                  style: TextStyle(
                                     fontWeight: FontWeight.bold,
                                  ),
                                );
                              },),
                            ),
                            subtitle: Container(
                              child: StreamBuilder<QuerySnapshot>(stream: prl, builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                                if (snapshot.hasError) {
                                  return Text("error loading data");
                                }
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return Text("loading.....");
                                }
                                final data1 = snapshot.requireData;
                                return Text("${data1.docs[0]['amt']} ",
                                  // style: TextStyle(
                                  //   fontSize:30, fontWeight: FontWeight.bold,
                                  // ),
                                );
                              },),
                            ),
                            trailing: Container(
                              child: ElevatedButton.icon(
                                  onPressed:(){},
                                  icon: Icon(Icons.copy),
                                  label: Text('copy'),
                                style: ElevatedButton.styleFrom(
                                  shape: StadiumBorder()
                                ),
                              ),
                            ),
                            onTap: (){},
                            tileColor: Colors.blueGrey[100],
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      child: Text('Donate links',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        fontStyle: FontStyle.italic,
                      ),),
                    ),
                    Container(
                      width: 360,
                      height: 280,
                      padding: EdgeInsets.all(0),
                      margin: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white70,
                        border: Border.all(color: Colors.blueGrey ,width: 2),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 65,
                            child: ListView(
                              children: [
                                ListTile(
                                  leading: CircleAvatar(child: Icon(Icons.link), backgroundColor: Colors.blue,),
                                  title: Container(
                                    child: StreamBuilder<QuerySnapshot>(stream: donor, builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                                      if (snapshot.hasError) {
                                        return Text("error loading data");
                                      }
                                      if (snapshot.connectionState == ConnectionState.waiting) {
                                        return Text("loading.....");
                                      }
                                      final data1 = snapshot.requireData;
                                      return Text("${data1.docs[0]['fundraiser']} ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      );
                                    },),
                                  ),
                                  subtitle: Container(
                                    child: StreamBuilder<QuerySnapshot>(stream: donor, builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                                      if (snapshot.hasError) {
                                        return Text("error loading data");
                                      }
                                      if (snapshot.connectionState == ConnectionState.waiting) {
                                        return Text("loading.....");
                                      }
                                      final data1 = snapshot.requireData;
                                      return Text("${data1.docs[0]['amt']} ",
                                        // style: TextStyle(
                                        //   fontSize:30, fontWeight: FontWeight.bold,
                                        // ),
                                      );
                                    },),
                                  ),
                                  trailing: Container(
                                    child: ElevatedButton.icon(
                                      onPressed:(){},
                                      icon: Icon(Icons.copy),
                                      label: Text('copy'),
                                      style: ElevatedButton.styleFrom(
                                          shape: StadiumBorder()
                                      ),
                                    ),
                                  ),
                                  onTap: (){},
                                  tileColor: Colors.blueGrey[100],
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
