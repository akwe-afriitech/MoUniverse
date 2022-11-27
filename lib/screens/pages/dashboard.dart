import 'package:flutter/material.dart';
import 'package:mo_universe/screens/pages/customisedonorlink.dart';
import 'package:mo_universe/screens/pages/donatepage.dart';
import 'package:mo_universe/screens/pages/invoices.dart';
import 'package:mo_universe/screens/pages/payliinks.dart';
import 'package:mo_universe/screens/pages/ussd.dart';
import 'customize prl.dart';
import 'package:mo_universe/service/auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:ussd_advanced/ussd_advanced.dart';

class dashboard extends StatefulWidget {
   dashboard({Key? key}) : super(key: key);

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  late TextEditingController _controller;

  String? _response;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final _amtController=TextEditingController();

  final _numController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthService>().user;
    return Scaffold(
      appBar: AppBar(
        title: const Text('MoUniverse'),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.settings))
        ],
        elevation: 2,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(5))
        ),
      ),
      drawer: Drawer(
        elevation: 5.0,
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
        // if(user.email != null && user.phoneNumber == null) Text(user.email!),
        // if(user.phoneNumber != null && user.email == null) Text(user.phoneNumber!)
                accountName: Text("Earl Millen Toh Akwe"),
                accountEmail: Text("676315399"),
              currentAccountPicture: CircleAvatar(
                  child:Icon(Icons.people),),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: (){},
            ),
            ListTile(
              leading: const Icon(Icons.inventory),
              title: const Text("Invoice"),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> const ussd())
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.link),
              title: const Text("customize paylink"),
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=> customiseprl()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Custommise Donation Link"),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> customisedonorlink()),
                );
              },
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if(user.email != null && user.phoneNumber == null) Text(user.email!),
                if(user.phoneNumber != null && user.email == null) Text(user.phoneNumber!),
                ElevatedButton(
                    onPressed: () {
                      context.read<AuthService>().deleteAccount(context: context);
                    },
                    child: const Text('Delete Account'))
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.centerLeft,
            child: const Text('Welcome', style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
            ),),
          ),
          Container(
            width: 360,
            height: 140,
            padding: const EdgeInsets.all(7),
            margin: const EdgeInsets.all(3),
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
                    children: const [
                      ListTile(
                        leading: CircleAvatar(
                          child: Icon(Icons.people),
                          backgroundColor: Colors.blue,
                        ),
                        title: Text("Earl Millen Toh Akwe",style: TextStyle(
                            fontSize: 25,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text("Cameroon", style: TextStyle(
                          color: Colors.blue
                        ),),
                        trailing: Icon(Icons.notification_add,color: Colors.blue,),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: const Text("Conatact :"),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: const Text("676315399", style: TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: const Text("Network  :"),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: const Text("MTN", style: TextStyle(
                        color: Colors.blue
                      ),),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(25),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(125, 40),
                          elevation: 8,
                          shape: const StadiumBorder(),
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.blue,
                          side: const BorderSide(color: Colors.blue, width: 1)),
                      child: const Text(
                        "send",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            contentPadding: const EdgeInsets.all(10),
                            content: Container(
                              height: 250,
                              margin: EdgeInsets.all(0),
                              padding: const EdgeInsets.all(5),
                              child: Column(
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            alignment: Alignment.center,
                                            child: const Text(
                                              "Quick Transfer",
                                              style:
                                              TextStyle(fontSize: 15),
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                  TextFormField(
                                    controller: _numController,
                                    decoration: const InputDecoration(
                                      hintText: "Enter MoMo Number",
                                      hintStyle: TextStyle(fontSize: 13),
                                      icon: Icon(
                                          Icons.verified_user_outlined),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: _amtController,
                                    decoration: const InputDecoration(
                                      hintText: "Enter Amount",
                                      hintStyle: TextStyle(fontSize: 13),
                                      icon: Icon(
                                          Icons.verified_user_outlined),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            child: ElevatedButton(
                                              child: const Text("Cancel"),
                                              onPressed: () => Navigator.pop(context),
                                            ),
                                          ),
                                          Container(
                                            child: ElevatedButton(
                                              onPressed: () {
                                                final number = _numController.text;
                                                final amt = _amtController.text;
                                                if(number.isEmpty || amt.isEmpty){
                                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text('please fill the fields')));
                                                }else{

                                                  UssdAdvanced.sendUssd(code: "*126*9*${_numController.text}*${_amtController.text}#", subscriptionId: 2);
                                                }
                                              },
                                              child: const Text("Send"),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  // child: Container(
                  //   alignment: Alignment.center,
                  //   child: ElevatedButton(
                  //     style: ElevatedButton.styleFrom(
                  //       padding: EdgeInsets.all(10),
                  //       fixedSize: Size(130,40),
                  //       textStyle: TextStyle(fontSize: 20, fontWeight:FontWeight.bold),
                  //       elevation: 9,
                  //       shape: StadiumBorder()
                  //     ),
                  //     child: Text("Send"),
                  //     onPressed: (){},
                  //   ),
                  // ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(125, 40),
                          elevation: 8,
                          shape: const StadiumBorder(),
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.blue,
                          side: const BorderSide(color: Colors.blue, width: 1)),
                      child: const Text(
                        "Recieve",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            contentPadding: const EdgeInsets.all(10),
                            content: Container(
                              height: 300,
                              padding: const EdgeInsets.all(5),
                              child: Column(
                                children: [
                                  Container(
                                    height:200,
                                    width: 400,
                                    padding: const EdgeInsets.all(40),
                                    color: Colors.blue,
                                    child: const Text(''),
                                  ),
                                  const Text('Scan Qr Code'),
                                  Container(
                                    // decoration: BoxDecoration(
                                    //   border: Border.all(color: Colors.blueGrey ,width: 1),
                                    //   borderRadius: BorderRadius.circular(20),
                                    // ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(

                                            alignment: Alignment.center,
                                            child: ElevatedButton.icon(
                                              icon: const Icon(Icons.link),
                                              style: ElevatedButton.styleFrom(
                                                // padding: EdgeInsets.all(10),
                                                fixedSize: const Size(210,50),
                                                textStyle: const TextStyle(fontSize: 15, fontWeight:FontWeight.bold),
                                                elevation: 9,
                                                shape: const StadiumBorder()
                                              ),
                                              onPressed: (){
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context)=>  paylinks()),
                                                );
                                              }, label: const Text("Paylinks"),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child:  Container(
                                            height: 50,
                                            alignment: Alignment.center,
                                            child: ElevatedButton.icon(
                                              icon: const Icon(Icons.money),
                                              style: ElevatedButton.styleFrom(
                                                padding: const EdgeInsets.all(10),
                                                fixedSize: const Size(210,50),
                                                textStyle: const TextStyle(fontSize: 15, fontWeight:FontWeight.bold),
                                                elevation: 9,
                                                shape: const StadiumBorder()
                                              ),
                                              onPressed: (){
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context)=> donate()),
                                                );
                                              }, label: const Text("Donation"),
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  // Container(
                  //   alignment: Alignment.center,
                  //   child: ElevatedButton(
                  //     style: ElevatedButton.styleFrom(
                  //         padding: EdgeInsets.all(10),
                  //         fixedSize: Size(130,40),
                  //         textStyle: TextStyle(fontSize: 20, fontWeight:FontWeight.bold),
                  //         elevation: 9,
                  //         shape: StadiumBorder()
                  //     ),
                  //     child: Text("Recieve"),
                  //     onPressed: (){},
                  //   ),
                  // ),
                ),

              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.centerLeft,
            child: const Text('Recent Transactions', style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),),
          ),
          Container(
            width: 360,
            height: 225,
            padding: const EdgeInsets.all(7),
            margin: const EdgeInsets.all(2),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                const BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5,
                  spreadRadius: 3,
                  offset: Offset(4,4)
                )
              ],
              border: Border.all(color: Colors.grey ,width: 1),

            ),
            child: Column(
              children: [
                Container(
                  height: 200,
                  // child: const Center(
                  // //   child: Text('You havent done any transcactions yet'),
                  // // ),
                  child: ListView(
                    children: const [
                      ListTile(
                        leading: CircleAvatar(child: Icon(Icons.done, size: 30,)),
                        title: Text("650204677",style: TextStyle(
                            fontSize: 20,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold),),
                        subtitle: Text("200", style: TextStyle(
                            color: Colors.blue
                        ),),
                        trailing: Icon(Icons.history_outlined,color: Colors.blue,),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,

        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueGrey ,width: 1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.link),
                    style: ElevatedButton.styleFrom(
                      // padding: EdgeInsets.all(10),
                        fixedSize: const Size(210,50),
                        textStyle: const TextStyle(fontSize: 15, fontWeight:FontWeight.bold),
                        elevation: 9,
                        // shape: StadiumBorder()
                    ),
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=>  paylinks()),
                      );
                    }, label: const Text("Paylinks"),
                  ),
                ),
              ),
              Expanded(
                child:  Container(
                  height: 50,
                  alignment: Alignment.center,
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.money),
                    style: ElevatedButton.styleFrom(
                        // padding: EdgeInsets.all(10),
                        fixedSize: const Size(210,50),
                        textStyle: const TextStyle(fontSize: 15, fontWeight:FontWeight.bold),
                        elevation: 9,
                        // shape: StadiumBorder()
                    ),
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=> donate()),
                      );
                    }, label: const Text("Donation"),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),

    );
}
}
