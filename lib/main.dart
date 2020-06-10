import 'package:flutter/material.dart';
import 'package:teamstommobile/screens/splash_screen.dart';
import 'package:teamstommobile/constants.dart';


void main() {
  runApp(MaterialApp(
    title: "BrainTease",
    color: primaryColor ,
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
  ));
}


