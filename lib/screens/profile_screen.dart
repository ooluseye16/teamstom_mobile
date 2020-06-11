import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teamstommobile/constants.dart';
import 'package:teamstommobile/screens/diffculty.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String username = 'Guest';
  Future<String> getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringValue = prefs.getString('USERNAME');
    return stringValue;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: primaryColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FutureBuilder<String>(
                        future: getStringValuesSF(),
                        initialData: 'Guest',
                        builder: (context, snapshot) {
                          username = snapshot.data;
                          return snapshot.hasData
                              ? Text(
                                  "Hi $username",
                                  style: TextStyle(
                                      color: deepOrange,
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold),
                                )
                              : Text("Hi Guest");
                        },
                      ),
                      FutureBuilder(
                        future: getStringValuesSF(),
                        builder: (context, snapshot) => CircleAvatar(
                          backgroundColor: primaryColor,
                          radius: 40.0,
                          child: Text(snapshot.data[0],
                              style: TextStyle(
                                  color: deepOrange,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                )),
            Expanded(
                flex: 12,
                child: Container(
                  child: Container(
                    padding: EdgeInsets.only(bottom: 30.0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ButtonTheme(
                        height: 50.0,
                        minWidth: 150.0,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DifficultySelectionPage()));
                          },
                          child: Text(
                            "START GAME",
                            style: TextStyle(
                                color: deepOrange,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/finn-hackshaw-FQgI8AD-BSg-unsplash.jpg'),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.9), BlendMode.dstATop),
                    ),
                  ),
                )),
            // Expanded(
            //     flex: 2,
            //     child: Container(
            //       padding: EdgeInsets.only(bottom: 30.0),
            //       child: Align(
            //         alignment: Alignment.bottomCenter,
            //         child: ButtonTheme(
            //           height: 50.0,
            //           minWidth: 150.0,
            //           child: RaisedButton(
            //             shape: RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(10.0)),
            //             onPressed: () {
            //               Navigator.push(
            //                   context,
            //                   MaterialPageRoute(
            //                       builder: (context) =>
            //                           DifficultySelectionPage()));
            //             },
            //             child: Text(
            //               "START GAME",
            //               style: TextStyle(
            //                   color: deepOrange,
            //                   fontWeight: FontWeight.bold,
            //                   fontSize: 18.0),
            //             ),
            //             color: Colors.white,
            //           ),
            //         ),
            //       ),
            //     )),
          ],
        ),
      ),
    );
  }
}
