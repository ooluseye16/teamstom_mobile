import "package:flutter/material.dart";
import 'package:teamstommobile/screens/SplashScreen.dart';
import 'screens/homepage.dart';

void main() => runApp(MyApp(
));


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}