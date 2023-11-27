import 'package:flutter/material.dart';

import 'Page5.dart';
import 'listUsers.dart';

class Page3 extends StatefulWidget {
  Page3({Key? key}) : super(key: key);

  @override
  _Page3State createState() {
    return _Page3State();
  }
}

class _Page3State extends State<Page3> {
  List <String> blood = ["A Positive" , "A Negative","B Positive", "B Negative" , "O Positive" , "O Negative"];
  String bloodType = "";
  void selectBlood(String c){
    setState(() {
      bloodType = c;
    });
  }
  void search(){
    showDialog(context: context, builder: (builder){
      int nb = getNbOfIdentical(bloodType);
      String msg = "Total is : $nb";
      return AlertDialog(title : Text("Number of persons has the same blood type"),content: Text(msg),);
    });
  }
  void showListDonators(String blood){
    int nb = getNbOfIdentical(bloodType);
    if(nb > 0){
        Navigator.of(context).push(MaterialPageRoute(builder: (builder){
          return Page5();
        },
            settings: RouteSettings(arguments: bloodType )));
      }else{
      showDialog(context: context, builder: (builder){
        return AlertDialog(title : Text("Sorry! No persons found of same type"),content: Text(""),);
      });
    }
    }

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
    // TODO: implement build
    return  Scaffold(
      appBar: AppBar(
        title: Text("In Need",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Center(
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(height: 40,),

                Text("Needed Blood Type",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
                SizedBox(height: 10,),
                DropdownMenu(dropdownMenuEntries:
                blood.map<DropdownMenuEntry<String>>( (e){
                  return DropdownMenuEntry(value: e, label: e.toString());
                }
                ).toList(),
                  onSelected: (c){
                    selectBlood(c!);
                  },
                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                        onPressed: (){
                          search();
                        },
                        icon: Icon(Icons.remove_red_eye),
                        label: Text("Matching number"),
                        style: ElevatedButton.styleFrom(
                          primary : Colors.red,
                        )

                    ),
                    ElevatedButton.icon(
                        onPressed: (){
                          showListDonators(bloodType);
                        },
                        icon: Icon(Icons.search),
                        label: Text("Search"),
                        style: ElevatedButton.styleFrom(
                          primary : Colors.red,
                        )

                    ),
                  ],
                )
              ],
            ),
          )
      ),
    );
  }
}