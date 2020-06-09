import "package:flutter/material.dart";
// import 'screens/homepage.dart';
import 'package:teamstommobile/screens/usernameScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugshowch
      // debugShowCheckedMode:false,
      home: UsernameScreen(),
    );
  }
}