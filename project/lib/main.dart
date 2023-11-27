import 'package:flutter/material.dart';

import 'Page1.dart';
import 'Page2.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Project",
      home: Page1(),
    );
  }
}