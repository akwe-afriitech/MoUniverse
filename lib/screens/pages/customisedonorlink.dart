import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mo_universe/screens/pages/donatepage.dart';
import 'package:mo_universe/screens/pages/paylinkslib.dart';



class customisedonorlink extends StatefulWidget {
 customisedonorlink({Key? key}) : super(key: key);

  @override
  State<customisedonorlink> createState() => _customisedonorlinkState();
}

class _customisedonorlinkState extends State<customisedonorlink> {
  var _name="";

  var _fundraiser="";
  var _fundraiserdes='';

  var _amt;

  bool isVisible=false;

  final _theme = ["pick a theme color","Blue","purple","Red","black","green"];

  final _formkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    CollectionReference donor = FirebaseFirestore.instance.collection('donor');
    return Scaffold(
      body: Container(
        child: Column(
          children:  [
            Expanded(
              child: Container(
                child: ListView(
                  children: [
                    ListTile(
                      title:Form(
                        key: _formkey,
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                child: Text("Click to add your Picture",style: TextStyle(
                                    decorationStyle: TextDecorationStyle.wavy
                                ),),
                              ),
                            ),
                            Expanded(
                              child: Container(

                                height: 100,
                                padding: EdgeInsets.all(5),
                                margin: EdgeInsets.all(15),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(Icons.picture_in_picture_alt, size: 60,),
                              ),
                            ),
                          ],
                        ),
                      ),

                    ),
                    ListTile(
                      title:Container(
                        margin: EdgeInsets.symmetric(vertical: 10.0),
                        child: TextFormField(
                          onChanged: (value){
                            _name = value;
                          },
                          validator: (value) {
                            if(value== null || value.isEmpty){
                              return 'please enter Your name';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: "please enter Your name",
                            icon: Icon(Icons.verified_user_outlined),
                          ),
                        ),
                      ),
                    ),

                    ListTile(
                      title:Container(
                        margin: EdgeInsets.symmetric(vertical: 10.0),
                        child: TextFormField(
                          onChanged: (value){
                            _fundraiser = (value);
                          },
                          decoration: const InputDecoration(
                            hintText: "Name of fund Raising Event",
                            icon: Icon(Icons.verified_user_outlined),
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      title:Container(
                        margin: EdgeInsets.symmetric(vertical: 10.0),
                        child: TextFormField(
                          onChanged: (value){
                            _fundraiserdes =value;
                          },
                          decoration: const InputDecoration(
                            hintText: "What is the fund raising for? ",
                            icon: Icon(Icons.verified_user_outlined),
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      title:Container(
                        margin: EdgeInsets.symmetric(vertical: 10.0),
                        child: TextFormField(
                          onChanged: (value){
                            _amt = int.parse(value);
                          },
                          decoration: const InputDecoration(
                            hintText: "Enter expected Amt",
                            icon: Icon(Icons.verified_user_outlined),
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      title:Container(
                        width: 280,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownButtonFormField(
                              value: _theme[0],
                              items: _theme.map((e) => DropdownMenuItem(child: Text(e), value: e,)
                              ).toList(), onChanged: (val){
                            // setState((){
                            //   _selectValue =val as String;
                            // });
                          }),
                        ),
                      ),
                    ),
                    ListTile(
                      title:Container(
                        margin: EdgeInsets.symmetric(vertical: 10.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(300, 40),
                            shape: StadiumBorder(),
                          ),
                          child: Text("click to generate donate link"),
                          onPressed: (){
                            donor.add({
                              'amt':_amt,
                              'name':_name,
                              'fundraiserdes':_fundraiserdes,
                              'fundraiser': _fundraiser,
                              'theme': _theme[2],
                            });

                            setState(() {
                              isVisible = ! isVisible;
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return paylinkslib();
                                },),);
                          },
                        ),
                      ),
                    ),
                    ListTile(
                      title:Visibility(
                        visible: isVisible ,
                        child: Container(
                          child: Text(""),
                        ),
                      ),
                    )
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
