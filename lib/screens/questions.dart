import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:teamstommobile/question/models/question.dart';
import 'package:teamstommobile/question/repository/data_repository.dart';
import '../constants.dart';

var currentScore = 0;
QuizStates quizState = QuizStates.NO_SELECTION;

class QuestionsPage extends StatefulWidget {
  final int _type;

  QuestionsPage(this._type);

  @override
  _QuestionsPageState createState() => _QuestionsPageState();
}

enum QuizStates { NO_SELECTION, SELECTED }

class _QuestionsPageState extends State<QuestionsPage> {
  DataRepository _dataRepository = DataRepository();

  int _selection = -1;
  List<Question> questions;
  var currentQuestion = 1;

  getQuestions() async {
    questions = await _dataRepository.getQuestions(getQuizType(widget._type));
    currentScore = questions.length;
    setState(() {});
  }

  double getProgressBarValue() {
    return (currentQuestion / questions.length);
  }

  @override
  void initState() {
    getQuestions();
    super.initState();
  }

  String getQuizType(int value) {
    var type;
    switch (value) {
      case 0:
        type = "HARD";
        break;
      case 1:
        type = "MEDIUM";
        break;
      case 2:
        type = "EASY";
        break;
    }

    return type;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0.0,
        title: Text(
          "QUIZ",
          style: TextStyle(
              color: deepOrange,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal),
        ),
        centerTitle: true,
        leading: Icon(
          Icons.keyboard_arrow_left,
          color: deepOrange,
        ),

        /**
         * Skip action button is defined here
         */
//        actions: <Widget>[
//          InkWell(
//            onTap: () {
//              //TODO skip to next question
//            },
//            child: Padding(
//              padding: const EdgeInsets.all(8.0),
//              child: Center(
//                child: Text(
//                  "Skip",
//                  style: TextStyle(
//                      color: Colors.orange,
//                      fontStyle: FontStyle.normal,
//                      fontWeight: FontWeight.bold),
//                ),
//              ),
//            ),
//          )
//        ],
      ),
      body:

          /**
       * in getting the questions from the db the build method might get called
       *  so we should handle this by showing an empty container so we do not get error
       */
          questions == null
              ? Container(
                  child: Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(deepOrange),
                    ),
                  ),
                )
              : Container(
                  child: Column(
                    children: <Widget>[
                      /**
             * rounded progress bar to show quiz progress
             */
                      Padding(
                        padding: EdgeInsets.all(15.0),
                        child: LinearPercentIndicator(
                          backgroundColor: Colors.orange[200],
                          width: MediaQuery.of(context).size.width - 50,
                          animation: false,
                          lineHeight: 20.0,
//                animationDuration: 2000,
                          percent: getProgressBarValue(),
                          linearStrokeCap: LinearStrokeCap.roundAll,
                          progressColor: green,
                        ),
                      ),

                      /**
             * define widget to display number questions answered and those remaining
             */
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              currentQuestion.toString(),
                              style: TextStyle(
                                  fontSize: 22.0,
                                  color: green,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.normal),
                            ),
                            Text(
                              "/${questions.length}",
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.orangeAccent,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.normal),
                            ),
                          ],
                        ),
                      ),

                      /**
             * Question View
             */

                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          child: Text(
                            questions[currentQuestion - 1].question_body,
                            style: TextStyle(
                                color: deepOrange,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                fontSize: 32.0),
                          ),
                        ),
                      ),

                      /**
             * option view
             */

                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                            itemCount: 2,
                            itemBuilder: (context, index) {
                              bool check = _selection == index;
                              return OptionWidget(
                                check,
                                index,
                                questions[currentQuestion - 1].correct_answer,
                                (type) {
                                  setState(() {
                                    _selection = type;
                                  });
                                },
                              );
                            }),
                      )),

                      /**
             * buttons next
             */

                      _selection == -1
                          ? _submitButtonInActive()
                          : _submitButtonActive()
                    ],
                  ),
                ),
    );
  }

  moveToNextQuestion() {
    if (currentQuestion == questions.length) {
      // show completed screen

      return;
    }

    setState(() {
      quizState = QuizStates.NO_SELECTION;
      _selection = -1;
      currentQuestion++;
    });
  }

  Widget _submitButtonActive() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: InkWell(
        onTap: () {
          //go to next question
          moveToNextQuestion();
        },
        child: Container(
          height: 90,
          width: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(22)),
              border: Border.all(color: green, width: 3)),
          child: Center(
            child: Text(
              "NEXT",
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

  Widget _submitButtonInActive() {
    return Opacity(
      opacity: 0.2,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: Container(
          height: 90,
          width: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(22)),
              border: Border.all(color: colorCoral, width: 3)),
          child: Center(
            child: Text(
              "SUBMIT",
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

class OptionWidget extends StatelessWidget {
  final bool _isChecked;
  final int _optionType;
  final String _answer;
  final Function _onPress;

  OptionWidget(this._isChecked, this._optionType, this._answer, this._onPress);

  bool isCorrect() {
    if (_isChecked == true) {
      if (_answer == _getOptionSelcted(_optionType)) {
        return true;
      } else {
        currentScore--;
        return false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32, right: 32, bottom: 12),
      child: InkWell(
        onTap: () {
          if (quizState == QuizStates.SELECTED) return;
          quizState = QuizStates.SELECTED;
          _onPress(_optionType);
          isCorrect();
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
              _getOptionSelcted(_optionType),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 23.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal),
            ),
            /**
             * difficulty text description
             */
            // subtitle: _isChecked == true
            //     ? Text("",
            //         // _getDifficultyDescription(_optionType),
            //         style: TextStyle(
            //             color: Colors.white,
            //             fontSize: 15,
            //             fontWeight: FontWeight.bold))
            //     : Text(""),
            trailing: Icon(
              optionIcon(),
              color: Colors.white,
            ),
          ),
          /**
           * container decoration
           */
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: boxDecorationColor(),
          ),
        ),
      ),
    );
  }

  Color boxDecorationColor() {
    if (_isChecked == true) {
      if (isCorrect()) {
        return green;
      } else {
        return Colors.pink;
      }
    } else {
      return colorCoral;
    }
  }

  IconData optionIcon() {
    if (_isChecked == true) {
      if (isCorrect()) {
        return Icons.check;
      } else {
        return Icons.close;
      }
    } else {
      return Icons.keyboard_arrow_right;
    }
  }
// String _getDifficultyDescription(int position) {
//   var text;
//   switch (position) {
//     case 0:
//       text = "See explanation";
//       break;
//     case 1:
//       text = "See explanation";
//       break;
//   }
//   return text;
// }
}

String _getOptionSelcted(int position) {
  var text;
  switch (position) {
    case 0:
      text = "True";
      break;
    case 1:
      text = "False";
      break;
  }
  return text;
}

//answer 1  = True
//I/flutter ( 3510): question answer 2  = False
//I/flutter ( 3510): question answer 3  = False
//I/flutter ( 3510): question answer 4  = False
//I/flutter ( 3510): question answer 5  = False
//I/flutter ( 3510): question answer 6  = False
//I/flutter ( 3510): question answer 7  = False
//I/flutter ( 3510): question answer 8  = False
//I/flutter ( 3510): question answer 9  = True
//I/flutter ( 3510): question answer 10  = True
