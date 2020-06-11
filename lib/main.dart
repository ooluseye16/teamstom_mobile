import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teamstommobile/screens/splash_screen.dart';
import 'package:teamstommobile/constants.dart';


void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);
  runApp(MaterialApp(
    title: "BrainTease",
    color: primaryColor ,
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
  ));
}


