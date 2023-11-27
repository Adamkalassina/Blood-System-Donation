import 'package:flutter/material.dart';

import 'listUsers.dart';

class Page5 extends StatefulWidget {
  Page5({Key? key}) : super(key: key);

  @override
  _Page5State createState() {
    return _Page5State();
  }
}

class _Page5State extends State<Page5> {
  String? bloodType;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bloodType = ModalRoute.of(context)!.settings.arguments as String?;
    return Scaffold(
      appBar: AppBar(title: Text("Informations of identical persons"), centerTitle: true, backgroundColor: Colors.red,),
      body: Container(
        margin : EdgeInsets.all(30),
      child: ListView.builder(
        itemBuilder: (context, position) {
          String? n = data[position].name?.toUpperCase();
          String ?nb = data[position].phoneNb;
          String? b = data[position].blood;
          if (b == bloodType) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.person),
                        SizedBox(width: 15,),
                        Text("$n", style: TextStyle(fontSize: 20,),),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.phone),
                        SizedBox(width: 15,),
                        Text("$nb", style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic),)
                      ],
                    )

                  ],
                ),
                SizedBox(height: 20,)
              ],
            );
          } else {
            // Return an empty container or another widget if the condition is not met.
            return Container();
          }
        },
        itemCount: data.length,
      ),
    ),
    );
  }
}