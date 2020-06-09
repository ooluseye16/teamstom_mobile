import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  final String username;
  WelcomeScreen({@required this.username});
  @override
  Widget build(BuildContext context) {
    double screenSize = MediaQuery.of(context).size.width;
    bool phone = screenSize < 300;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInset.all(20.0),
              child: Image.asset("assets/logo.png"),
            ),
            Text(
              "Welcome",
              style: TextStyle(
                color: Color(0xff642900),
                fontWeight: FontWeight.bold,
                fontSize: phone ? 25.0 : 30.0,
              ),
            ),
            Text(
              "$username!",
              style: TextStyle(
                color: Color(0xff642900),
                fontWeight: FontWeight.bold,
                fontSize: phone ? 25.0 : 30.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
