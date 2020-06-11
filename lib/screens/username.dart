import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teamstommobile/constants.dart';
import 'package:teamstommobile/screens/welcomScreen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      body: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment:
          //     phone ? CrossAxisAlignment.start : CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(top: 5.0),
              child: SvgPicture.asset(
                "assets/Illustration.svg",
                height: screenHeight,
                width: screenWidth,
              ),

              //  Image.asset(
              //   "assets/backgroundImg.png",
              //   height: screenHeight / 2,
              //   width: screenWidth,
              // ),
            ),
            SizedBox(height: 40.0,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Center(
                child: Text(
                  "WHAT'S YOUR NAME",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff7E7F9A),
                    fontSize: phone ? 23 : 27,
                  ),
                ),
              ),
            ),
            Container(
              padding:  EdgeInsets.symmetric(horizontal: 30.0),
              alignment: Alignment.center,
              child: Form(
                key: _formKey,
                child: TextFormField(
                  style: TextStyle(
                    fontSize: 20.0,
                    color: deepOrange,
                    fontWeight: FontWeight.w500
                  ),
                  textAlign: TextAlign.center,
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
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff7E7F9A),
        child: Icon(
          Icons.arrow_forward,
          color: Colors.white,
        ),
        onPressed: () async{
          if (_formKey.currentState.validate()) {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setString('USERNAME', _controller.text);
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
