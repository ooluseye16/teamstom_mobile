import 'package:flutter/material.dart';
import 'package:teamstommobile/constants.dart';

class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: primaryColor,
        leading: Icon(
          Icons.keyboard_arrow_left,
          color: deepOrange,
        ),
        title: Text(
            "Quiz",
            style: TextStyle(
                color: deepOrange,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal),
          ),
        centerTitle: true,
        ),
      body: Container(
        margin: EdgeInsets.only(top: 50.0, bottom: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              height: 350.0,
              child: Center(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Text("QUIZ COMPLETE!", style: TextStyle( color: deepOrange,fontSize: 24.0, fontWeight: FontWeight.bold),),
                      SizedBox(height: 150.0,),
                      Text("3/10", style: TextStyle(color: Colors.green, fontSize: 50.0, fontWeight: FontWeight.bold), ),
                    ],
                  ),
                ),
              ),
            ),
            ButtonTheme(
              height: 50.0,
              minWidth: 290.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: OutlineButton(
                borderSide: BorderSide(
                  color: Colors.green,
                  width: 2.0,
                ),
                onPressed: () {},
                child: Text("RESTART"),
              ),
            ),
            ButtonTheme(
              height: 50.0,
              minWidth: 290.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: OutlineButton(
                borderSide: BorderSide(
                    color: Colors.green,
                    width: 2.0
                ),
                onPressed: () {},
                child: Text("HOME"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
