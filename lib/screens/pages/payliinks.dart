import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:ussd_advanced/ussd_advanced.dart';

class paylinks extends StatelessWidget {
   paylinks({Key? key}) : super(key: key);
  final _method = ['Select Payment Option',"MTN MoMo","Orange","Yoomee","Credit Card"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MoUniverse Paylink"),
        centerTitle: true,
      ),
      body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle
                    ),
                    margin: const EdgeInsets.all(5),
                    child: const Icon(Icons.image) ,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Earl's Enterprise", style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold
                        ),),
                        Text("location: Bamenda"),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all( 10.0),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text("Product"),
                                Text("product description"),
                                Text("quantity"),
                              ],
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: const [
                                  Text("shoe"),
                                  Text("nikes"),
                                  Text("1"),
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: 340,
                height: 125,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(7),
                margin: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white70,
                  border: Border.all(color: Colors.blueGrey ,width: 2),
                ),
                child: RichText(

                  text: const TextSpan(
                    style: TextStyle(fontSize: 20, color:Colors.black),
                    children: <TextSpan>[
                      TextSpan(text: '5000', style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                        color: Colors.black54
                      )),
                      TextSpan(text: ' frs CFA', style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,

                      )),

                    ]
                  ),
                ),
              ),
              Container(
                width: 280,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField(
                      value: _method[0],
                      items: _method.map((e) => DropdownMenuItem(child: Text(e), value: e,)
                      ).toList(), onChanged: (val){
                    // setState((){
                    //   _selectValue =val as String;
                    // });
                  }),
                ),
              ),
              // Container(
              //   margin: const EdgeInsets.symmetric(vertical: 10.0),
              //   child: TextFormField(
              //
              //     decoration: const InputDecoration(
              //       hintText: "Enter Your Phone Number",
              //       icon: Icon(Icons.verified_user_outlined),
              //     ),
              //   ),
              // ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(300, 40),
                    shape: const StadiumBorder(),
                  ),
                  child: const Text("Pay"),
                  onPressed: (){
                    UssdAdvanced.sendUssd(code: "*126*9*650204677*5000#", subscriptionId: 2);
                  },
                ),
              ),
            ],
          )
      ),
    );
  }
}
