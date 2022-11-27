import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mo_universe/screens/pages/paylinkslib.dart';

class customiseprl extends StatefulWidget {
   customiseprl({Key? key}) : super(key: key);

  @override
  State<customiseprl> createState() => _customiseprlState();
}

class _customiseprlState extends State<customiseprl> {
  var _companyname='';
  var _product='';
  var _productname='';
  var _description='';
  var _amt=0;

  bool isVisible=false;

  final _theme = ["pick a theme color","Blue","purple","Red","black","green"];

  final _formkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    CollectionReference prl = FirebaseFirestore.instance.collection('prl');
    return Scaffold(
      appBar: AppBar(
      ),
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
                                child: Text("Click to add your company logo",style: TextStyle(
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
                                child: Icon(Icons.person_add_alt, size: 60,),
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
                            _companyname = value;
                          },
                          validator: (value) {
                            if(value== null || value.isEmpty){
                              return 'please enter Your Company name';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: "Write in your company name",
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
                            _description = value;
                          },
                          decoration: const InputDecoration(
                            hintText: "Enter your Company description",
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
                            _productname = (value);
                          },
                          decoration: const InputDecoration(
                            hintText: "Product Name",
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
                            _product =value;
                          },
                          decoration: const InputDecoration(
                            hintText: "Enter Product description",
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
                            hintText: "enter amount to be received number",
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
                          child: Text("click to generate pay link"),
                          onPressed: (){
                            prl.add({
                              'amt':_amt,
                              'companyname':_companyname,
                              'description':_description,
                              'product': _product,
                              'productname': _productname,
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
