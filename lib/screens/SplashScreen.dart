import 'dart:async';

import 'package:flutter/material.dart';
import 'package:teamstommobile/screens/onboarding.dart';


void main() => runApp( MaterialApp(
  home: SplashScreen(),
  debugShowCheckedModeBanner: false,
));
class SplashScreen extends StatefulWidget{

  @override
  _SplashScreenState createState() =>  _SplashScreenState();


}
class _SplashScreenState extends State<SplashScreen>{

  @override
  void initState(){
    super.initState();
    new Future.delayed(
      const Duration(seconds: 5),
        () => Navigator.push(context,
        MaterialPageRoute(builder: (context)=> OnboardingScreen())
    ));
  }
  @override
  Widget build(BuildContext context){
    return  Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(image: new AssetImage("assets/images/splashScreen.png"),
                fit: BoxFit.fill
              ),
            )

          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(
                      backgroundColor: Colors.black45
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    Text(
                      "Loading", style: TextStyle(
                        color: Colors.red,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold
                    ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  homepage() {}
}