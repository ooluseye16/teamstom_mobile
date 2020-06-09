import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../constants.dart';

class DifficultySelectionPage extends StatefulWidget {
  @override
  _DifficultySelectionPageState createState() =>
      _DifficultySelectionPageState();
}

class _DifficultySelectionPageState extends State<DifficultySelectionPage> {
  int _selection = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      /**
       * constructs the app bar with the following codes
       */
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

      /**
       * the body of this screen wrapped in a Container widget
       */

      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 75,
            ),
            Text(
              "Select your difficulty",
              style: TextStyle(
                  fontSize: 32, fontWeight: FontWeight.bold, color: deepOrange),
            ),
            SizedBox(
              height: 75.0,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      bool check = _selection == index;

                      return DifficultyWidget(check, index, (type) {
                        setState(() {
                          _selection = type;
                        });
                      });
                    })),
            _selection == -1 ? _startButtonInActive() : _startButtonActive()
          ],
        ),
      ),
    );
  }

  Widget _startButtonActive() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: InkWell(
        onTap: () {
          //save difficulty level

          //go to next page
        },
        child: Container(
          height: 90,
          width: 380,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(22)),
              border: Border.all(color: green, width: 3)),
          child: Center(
            child: Text(
              "START QUIZ",
              style: TextStyle(
                  color: green,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal),
            ),
          ),
        ),
      ),
    );
  }

  Widget _startButtonInActive() {
    return Opacity(
      opacity: 0.2,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: Container(
          height: 90,
          width: 380,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(22)),
              border: Border.all(color: colorCoral, width: 3)),
          child: Center(
            child: Text(
              "START QUIZ",
              style: TextStyle(
                  color: colorCoral,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal),
            ),
          ),
        ),
      ),
    );
  }
}

class DifficultyWidget extends StatelessWidget {
  final bool _isChecked;
  final int _difficultyType;
  final Function _onPress;

  DifficultyWidget(this._isChecked, this._difficultyType, this._onPress);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32, right: 32, bottom: 12),
      child: InkWell(
        onTap: () {
          _onPress(_difficultyType);
        },
        child: Container(
          padding: _isChecked == true
              ? EdgeInsets.only(bottom: 20.0)
              : EdgeInsets.only(bottom: 0.0),
          width: 400.0,
          child: ListTile(
            /**
             * difficulty text title
             */
            title: Text(
              _getDifficultyText(_difficultyType),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 23.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal),
            ),
            /**
             * difficulty text description
             */
            subtitle: _isChecked == true
                ? Text(_getDifficultyDescription(_difficultyType),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold))
                : Text(""),
            trailing: _isChecked == true
                ? SvgPicture.asset("assets/images/selected.svg")
                : SvgPicture.asset("assets/images/unselected.svg"),
          ),

          /**
           * container decoration
           */
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: _isChecked == true ? green : colorCoral),
        ),
      ),
    );
  }

  String _getDifficultyText(int position) {
    var text;
    switch (position) {
      case 0:
        text = "Hard";
        break;
      case 1:
        text = "Intermidiate";
        break;
      case 2:
        text = "Easy";
        break;
    }

    return text;
  }

  String _getDifficultyDescription(int position) {
    var text;
    switch (position) {
      case 0:
        text = "These questions are insane...";
        break;
      case 1:
        text = "These questions are normal...";
        break;
      case 2:
        text = "These questions are cheap...";
        break;
    }

    return text;
  }
}
