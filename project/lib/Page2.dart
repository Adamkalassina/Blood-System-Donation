import 'package:flutter/material.dart';
import 'Users.dart';
import 'listUsers.dart';

class Page2 extends StatefulWidget {
  Page2({Key? key}) : super(key: key);

  @override
  _Page2State createState() {
    return _Page2State();
  }
}

class _Page2State extends State<Page2> {

    List <String> blood = ["A Positive" , "A Negative","B Positive", "B Negative" , "O Positive" , "O Negative"];
    TextEditingController _name = TextEditingController();
    TextEditingController _age = TextEditingController();
    TextEditingController _nb = TextEditingController();
    String bloodType = "";
    int deases = 5;
    void selectBlood(String c){
      setState(() {
        bloodType = c;
      });
    }
    void checkDeases(int c){
      setState(() {
        deases =c;
      });
    }
    void addUser(){
      String n = _name.text;
      int a = int.parse(_age.text);
      String pnb = _nb.text;

      if(n.length < 7) {
        showDialog(context: context, builder: (builder) {
          String msg = "Name characters should be more than 6";
          return AlertDialog(title: Text("Error"), content: Text(msg),);
        });
      }
      if(a < 18 || a > 70 ) {
        showDialog(context: context, builder: (builder) {
          String msg = "Your age should be between 18 & 70";
          return AlertDialog(title: Text("Error"), content: Text(msg),);
        });
      }
          if(pnb.length != 8) {
            showDialog(context: context, builder: (builder) {
              String msg = "Enter a number formed of 6 digits";
              return AlertDialog(title: Text("Error"), content: Text(msg),);
            });
          }
      if(bloodType == "") {
        showDialog(context: context, builder: (builder) {
          String msg = "Choose Blood Type";
          return AlertDialog(title: Text("Error"), content: Text(msg),);
        });
      }
      if(deases == 1) {
        showDialog(context: context, builder:( builder){
          String msg = " You are suffering from a desease , So you cannot donnate";
          return AlertDialog(title: Text("Cannot Donate"),content: Text(msg),);
        });
      }
      if(n.length >= 7 && a >= 18 && a < 70  && pnb.length == 8 && bloodType != "" && deases == 0 ){
              data.add(Users(n,a,pnb,bloodType));
              _name.text = "";
              _age.text="";
              _nb.text="";
              bloodType="";
              showDialog(context: context, builder: (builder){
                String msg = "Your info are added successfully";
                return AlertDialog(title : Text("Status"),content: Text(msg),);
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
            return Scaffold(
              appBar: AppBar(
                title: Text("Donor",
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
                        TextField(
                          controller: _name,
                          cursorColor: Colors.red,
                          decoration: InputDecoration(
                              icon: Icon(Icons.person , color: Colors.red,),
                              labelText: "Enter your name [minimum 7 characters]",
                              labelStyle: TextStyle(
                                color: Colors.red,
                              ),

                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red)
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomLeft: Radius.circular(10)),
                                borderSide: BorderSide(
                                  width: 4,
                                ),

                              )
                          ),
                        ),
                        SizedBox(height: 20,),
                        TextField(
                          controller: _age,
                          cursorColor: Colors.red,
                          decoration: InputDecoration(
                              icon: Icon(Icons.date_range , color: Colors.red,),
                              labelText: "Enter your Age between 18 and 70 ",
                              labelStyle: TextStyle(
                                color: Colors.red,
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red)
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomLeft: Radius.circular(10)),
                                borderSide: BorderSide(
                                  width: 4,
                                ),
                              )
                          ),
                        ),
                        SizedBox(height: 20,),
                        TextField(
                          controller: _nb,
                          cursorColor: Colors.red,
                          decoration: InputDecoration(
                              icon: Icon(Icons.phone , color: Colors.red,),
                              labelText: "Enter your Phone Number (8 digits) ",
                              labelStyle: TextStyle(
                                color: Colors.red,
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red)
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomLeft: Radius.circular(10)),
                                borderSide: BorderSide(
                                  width: 4,
                                ),
                              )
                          ),
                        ),
                        SizedBox(height: 30,),
                        Text("Choose Your Blood Type",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
                        SizedBox(height: 10,),
                        DropdownMenu(dropdownMenuEntries:
                        blood.map<DropdownMenuEntry<String>>( (e){
                          return DropdownMenuEntry(value: e, label: e.toString());
                        }
                        ).toList(),
                          label: Text("Choose Type"),
                          onSelected: (c){
                            selectBlood(c!);
                          },
                          initialSelection: bloodType,
                        ),
                        SizedBox(height: 30,),
                        Text("Do You Have Chronic Diseases",style: TextStyle(fontWeight: FontWeight.bold),),
                        SizedBox(height: 30,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Yes"),
                            Radio(value: 1, groupValue: deases,activeColor: Colors.red, onChanged: (x){
                              checkDeases(x!);
                            }
                            ),
                            SizedBox(width: 20,),
                            Text("No"),
                            Radio(value: 0, groupValue: deases,activeColor: Colors.red, onChanged: (x){
                              checkDeases(x!);
                            }
                            ),
                          ],
                        ),

                        SizedBox(height: 30,),
                        ElevatedButton.icon(
                            onPressed: (){
                              addUser();
                            },
                            icon: Icon(Icons.add),
                            label: Text("Add Info"),
                            style: ElevatedButton.styleFrom(
                              primary : Colors.red,
                            )

                        ),

                      ],
                    ),
                  )
              ),
            );
          }
  }