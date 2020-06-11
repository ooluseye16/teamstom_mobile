import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:teamstommobile/screens/profile_screen.dart';

class WelcomeScreen extends StatefulWidget {
  final String username;
  WelcomeScreen({@required this.username});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() { 
    super.initState();
    new Future.delayed(const Duration(seconds: 3), () {
        Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProfileScreen()));
    });
  }
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
              padding: EdgeInsets.all(20.0),
              child: SvgPicture.asset(
                "assets/Logo.svg",
              ),

              // Image.asset("assets/logo.png"),
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
              "${widget.username}!",
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
