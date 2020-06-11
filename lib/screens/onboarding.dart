import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teamstommobile/screens/username.dart';
import 'package:teamstommobile/utilities/styles.dart';

 class OnBoardingScreen extends StatefulWidget {
  @override
  _onBoardingScreenState createState() => _onBoardingScreenState();
}

// ignore: camel_case_types
class _onBoardingScreenState extends State<OnBoardingScreen> {
  final int _numPages = 1;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Color(0xFF7B51D3),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.4, 0.7, 0.9],
              colors: [
                Color(0xffFBF5EE),
                Color(0xffFBF5EE),
                Color(0xffFBF5EE),
                Color(0xffFBF5EE),
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // Container(
                //   alignment: Alignment.centerRight,
                //   child: FlatButton(
                //     onPressed: () => Navigator.push(context,
                //         MaterialPageRoute(builder: (context)=> UsernameScreen())),//here you can add the welcome screen
                //     // or the login screen instead of the hompage screen i used
                //     child: Text(
                //       'Skip',
                //       style: TextStyle(
                //         color: Colors.deepOrangeAccent,
                //         fontSize: 20.0,
                //       ),
                //     ),
                //   ),
                // ),
                Expanded(
                  child: Container(
                    height: 600.0,
                    child: PageView(
                      physics: ClampingScrollPhysics(),
                      controller: _pageController,
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(40.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                child: Image(
                                  image: AssetImage(
                                    'assets/images/Illustration.png',
                                  ),
                                  height: 300.0,
                                  width: 300.0,
                                ),
                              ),
                              SizedBox(height: 50.0),
                              Center(
                                child: Text(
                                  'Challenge yourself with our awesome mind boggling quizzes. Unlock levels of your minds...',
                                  style: TextStyle(
                                    color: Colors.deepOrangeAccent,
                                    fontFamily: 'CM Sans Serif',
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w500
                                  ),
                                  textAlign: TextAlign.center,
                                  softWrap: true,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                _currentPage != _numPages - 1
                    ? Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomRight,
                    child: FlatButton(
                      onPressed: () {
                        _pageController.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            'Next',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 30.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                    : Text(''),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: _currentPage == _numPages - 1
          ? Container(
        height: 100.0,
        width: double.infinity,
        color: Colors.white,
        child: GestureDetector(
          onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context)=>UsernameScreen())),//here you can add the welcome screen
          // or the login screen instead of the hompage screen i used
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 30.0),
              child: Text(
                'Get started',
                style: TextStyle(
                  color: Color(0xffFF7F5D),
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      )
          : Text(''),
    );
  }
}