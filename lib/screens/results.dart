import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:social_share/social_share.dart';
import 'package:teamstommobile/constants.dart';
import 'package:teamstommobile/screens/diffculty.dart';

class ResultScreen extends StatelessWidget {
  ScreenshotController screenshotController = ScreenshotController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: primaryColor,
        // leading: Icon(
        //   Icons.keyboard_arrow_left,
        //   color: deepOrange,
        // ),
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
              height: 300.0,
              child: Center(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Text(
                        "QUIZ COMPLETE!",
                        style: TextStyle(
                            color: deepOrange,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 150.0,
                      ),
                      Text(
                        "3/10",
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 50.0,
                            fontWeight: FontWeight.bold),
                      ),
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
                onPressed: () {
                  Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DifficultySelectionPage()));
                },
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
                borderSide: BorderSide(color: Colors.green, width: 2.0),
                onPressed: () {},
                child: Text("HOME"),
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    onTap: () async {
                      SocialShare.shareWhatsapp(
                              "Hey there! I got 9/10 in the hard level of Brain Tease app, can you do better?")
                          .then((data) {
                        print(data);
                      });
                    },
                    child: Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/WhatsApp_48px.png'),
                                fit: BoxFit.cover))),
                  ),
                  InkWell(
                    onTap: () async {
                      SocialShare.shareTwitter(
                          "Hey there! I got 9/10 in the hard level of Brain Tease app, can you do better?",
                          hashtags: ["hnginternship", "teamSTORM", "HNGTeamStorm","trivia","quiz"],
                          url: "",
                          trailingText: "")
                      .then((data) {
                    print(data);
                  });
                    },
                    child: Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/Twitter_50px.png'),
                                fit: BoxFit.cover))),
                  ),
                  InkWell(
                    onTap: () async {
                      SocialShare.shareSms("Hey there! I got 9/10 in the hard level of Brain Tease app, can you do better?",
                          url: "",
                          trailingText: "")
                      .then((data) {
                    print(data);
                  });
                    },
                    child: Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/Chat_64px.png'),
                                fit: BoxFit.cover))),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
