import 'package:flutter/material.dart';

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
      backgroundColor: Colors.white,
      /**
       * constructs the app bar with the following codes
       */
      appBar: AppBar(
        title: Center(
          child: Text("Quiz"),
        ),
      ),

      /**
       * the body of this screen wrapped in a Container widget
       */

      body: Container(
        child: Column(
          children: <Widget>[
            Text("Select your difficulty"),
            SizedBox(
              height: 45.0,
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
                    }))
          ],
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
    return InkWell(
      onTap: () {
        _onPress(_difficultyType);
      },
      child: Container(
        height: _isChecked == true ? 120.0 : 90.0,
        width: 400.0,
        child: ListTile(
          /**
           * difficulty text title
           */
          title: Text(_getDifficultyText(_difficultyType)),
          /**
           * difficulty text description
           */
          subtitle: Text(_getDifficultyDescription(_difficultyType)),
          trailing: _isChecked == true
              ? Icon(Icons.check)
              : Icon(Icons.keyboard_arrow_right),
        ),

        /**
         * container decoration
         */
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: _isChecked == true ? colorGreenCheck : colorUncheck),
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
