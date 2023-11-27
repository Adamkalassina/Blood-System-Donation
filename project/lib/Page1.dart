import 'package:flutter/material.dart';
import 'package:project/Page%203.dart';

import 'Page2.dart';


class Page1 extends StatefulWidget {
  Page1({Key? key}) : super(key: key);

  @override
  _Page1State createState() {
    return _Page1State();
  }
}

class _Page1State extends State<Page1> {
  List <String> opt = ["Blood Donor","In Need"];
  String sel = "";
  void select(String c){
    setState(() {
      sel = c;
    });
  }
  void goto(){
    if(sel == "Blood Donor"){
      Navigator.of(context).push(MaterialPageRoute(builder: (builder){
        return Page2();
      }));
    }else{
      Navigator.of(context).push(MaterialPageRoute(builder: (builder){
        return Page3();
      }));
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
    return Scaffold(
      appBar: AppBar(
        title: Text("AK Blood System",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 50),
              Text("Choose what you want to be",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              SizedBox(height: 30,),
              DropdownMenu(
                dropdownMenuEntries:
                opt.map<DropdownMenuEntry<String>>( (e) {
                  return DropdownMenuEntry <String> (value: e,label:e.toString());
                }
                ) .toList(),
                onSelected: (c){
                  select(c!);
                },
              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){
                goto();
              },
                  child: Icon(Icons.arrow_right,size: 30,),
                  style: ElevatedButton.styleFrom(
                    primary : Colors.red,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}