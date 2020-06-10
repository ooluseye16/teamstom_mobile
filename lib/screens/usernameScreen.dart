import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teamstommobile/screens/welcomScreen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UsernameScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.width;
    bool phone = screenWidth < 300;
    return Scaffold(
      backgroundColor: Color(0xffFBF5EE),
      body: Column(
        // crossAxisAlignment:
        //     phone ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: SvgPicture.asset(
              "assets/Illustration.svg",
              height: screenHeight / 2,
              width: screenWidth,
            ),

            //  Image.asset(
            //   "assets/backgroundImg.png",
            //   height: screenHeight / 2,
            //   width: screenWidth,
            // ),
          ),
          Container(
            padding: EdgeInsets.only(left: 30, top: 30.0),
            child: Text(
              "WHAT'S YOUR NAME",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xff7E7F9A),
                fontSize: phone ? 23 : 27,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 30),
            alignment: Alignment.center,
            child: Form(
              key: _formKey,
              child: TextFormField(
                controller: _controller,
                inputFormatters: [
                  // Maximum number of characters the length of the username can be.
                  LengthLimitingTextInputFormatter(10),
                ],
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(),
                validator: (value) {
                  if (value.isEmpty) return "Please enter your name";
                  return null;
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff7E7F9A),
        child: Icon(
          Icons.arrow_forward,
          color: Colors.white,
        ),
        onPressed: () {
          if (_formKey.currentState.validate()) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => WelcomeScreen(username: _controller.text),
              ),
            );
          }
        },
      ),
    );
  }
}
