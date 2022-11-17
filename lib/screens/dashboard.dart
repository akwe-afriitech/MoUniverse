import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class dashboard extends StatelessWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('MoUniverse'),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.settings))
        ],
        elevation: 2,
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(5))
        ),
      ),
      drawer: Drawer(
        elevation: 5.0,
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                accountName: Text("Mo Universe"),
                accountEmail: Text("mouniverse@gmail.com"),
              currentAccountPicture: CircleAvatar(
                  child:Icon(Icons.people),),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Invoices"),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: (){},
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.centerLeft,
            child: Text('Welcome', style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
            ),),
          ),
          Container(
            width: 360,
            height: 140,
            padding: EdgeInsets.all(7),
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
                    children: const [
                      ListTile(
                        leading: CircleAvatar(
                          child: Icon(Icons.people),
                          backgroundColor: Colors.blue,
                        ),
                        title: Text("Mo Universe",style: TextStyle(
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
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text("Conatact :"),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text("6501823818", style: TextStyle(
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
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text("Network  :"),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text("Camtel", style: TextStyle(
                        color: Colors.blue
                      ),),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(25),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(10),
                        fixedSize: Size(130,40),
                        textStyle: TextStyle(fontSize: 20, fontWeight:FontWeight.bold),
                        elevation: 9,
                        shape: StadiumBorder()
                      ),
                      child: Text("Send"),
                      onPressed: (){},
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(10),
                          fixedSize: Size(130,40),
                          textStyle: TextStyle(fontSize: 20, fontWeight:FontWeight.bold),
                          elevation: 9,
                          shape: StadiumBorder()
                      ),
                      child: Text("Recieve"),
                      onPressed: (){},
                    ),
                  ),
                ),

              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.centerLeft,
            child: Text('Recent Transactions', style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),),
          ),
          Container(
            width: 360,
            height: 225,
            padding: EdgeInsets.all(7),
            margin: EdgeInsets.all(2),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
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
                  height: 180,
                  child: ListView(
                    children: const [
                      ListTile(
                        leading: CircleAvatar(child: Icon(Icons.done, size: 30,)),
                        title: Text("650201202",style: TextStyle(
                            fontSize: 20,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold),),
                        subtitle: Text("for shoes", style: TextStyle(
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
                  child: Column(
                    children: [
                      Icon(Icons.link, color: Colors.white,),
                      Text("Paylinks", style: TextStyle(
                        color: Colors.white,
                      ),)
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 50,
                  child: Column(
                    children: [
                      Icon(Icons.money,color: Colors.white,),
                      Text("Donation", style: TextStyle(
                        color: Colors.white,
                      ),)
                    ],
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
