// import 'package:flutter/material.dart';
// import 'package:teamstommobile/question/models/question.dart';
// import '../constants.dart';
// import '../question/repository/data_repository.dart';

// class QuestionsScreenPage extends StatefulWidget {
//   const QuestionsScreenPage({Key key, @required this.difficultyType})
//       : super(key: key);
//   final String difficultyType;

//   @override
//   QuestionsScreenPageState createState() => QuestionsScreenPageState();
// }

// class QuestionsScreenPageState extends State<QuestionsScreenPage> {
//   int _selection = -1;
//   int questionNum = 1;
//   int correctScore = 0;
//   int inCorrectScore = 0;
//   DataRepository _dataRepository = DataRepository();
//   PageController _controller = PageController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: primaryColor,
//       /**
//        * constructs the app bar with the following codes
//        */
//       appBar: AppBar(
//         elevation: 0.0,
//         backgroundColor: primaryColor,
//         leading: Icon(
//           Icons.keyboard_arrow_left,
//           color: deepOrange,
//         ),
//         title: Text(
//           "Quiz",
//           style: TextStyle(
//             color: deepOrange,
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//             fontStyle: FontStyle.normal,
//           ),
//         ),
//         centerTitle: true,
//         actions: [
//           InkWell(
//             child: Text(
//               "skip",
//               style: TextStyle(
//                 color: deepOrange,
//                 fontSize: 18,
//                 fontStyle: FontStyle.normal,
//               ),
//             ),
//           ),
//         ],
//       ),

//       /**
//        * the body of this screen wrapped in a Container widget
//        */

//       body: FutureBuilder(
//           future: _dataRepository.getQuestions(widget.difficultyType),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             } else if (snapshot.connectionState == ConnectionState.done) {
//               List<Question> questions = snapshot.data;

//               return Column(
//                 children: <Widget>[
//                   Padding(
//                     padding:
//                         const EdgeInsets.only(left: 32, right: 32, bottom: 12),
//                     child: Row(
//                       children: <Widget>[
//                         Text("$questionNum/",
//                             style: TextStyle(
//                               color: green,
//                               fontSize: 24,
//                               fontWeight: FontWeight.bold,
//                               fontStyle: FontStyle.normal,
//                             )),
//                         Text("${questions.length}",
//                             style: TextStyle(
//                                 color: colorCoral,
//                                 fontSize: 24,
//                                 fontWeight: FontWeight.bold,
//                                 fontStyle: FontStyle.normal)),
//                       ],
//                     ),
//                   ),
//                   Expanded(
//                     child: PageView.builder(
//                       physics: NeverScrollableScrollPhysics(),
//                       pageSnapping: false,
//                       controller: _controller,
//                       itemCount: questions.length,
//                       itemBuilder: (context, index) {
//                         return Container(
//                           child: Column(
//                             children: <Widget>[
//                               SizedBox(
//                                 height: 35,
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(
//                                     left: 32, right: 32, bottom: 12),
//                                 child: Text(
//                                   "${questions[index].question_body}",
//                                   style: TextStyle(
//                                       fontSize: 32,
//                                       fontWeight: FontWeight.bold,
//                                       color: deepOrange),
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 35.0,
//                               ),
//                               Expanded(
//                                   child: ListView.builder(
//                                       itemCount: 2,
//                                       itemBuilder: (context, index) {
//                                         bool check = _selection == index;

//                                         return OptionWidget(
//                                           check,
//                                           index,
//                                           questions[index].correct_answer,
//                                           (type) {
//                                             setState(() {
//                                               _selection = type;
//                                             });
//                                           },
//                                           (type) {
//                                             setState(() {
//                                               if (type == true) {
//                                                 correctScore++;
//                                               } else {
//                                                 inCorrectScore++;
//                                               }
//                                               print(
//                                                   "correctScore: $correctScore");
//                                               print(
//                                                   "inCorrectScore: $inCorrectScore");
//                                             });
//                                           },
//                                         );
//                                       })),
//                               _selection == -1
//                                   ? _submitButtonInActive()
//                                   : _submitButtonActive(
//                                       index + 1, questions.length - 1)
//                             ],
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               );
//             }
//           }),
//     );
//   }

//   Widget _submitButtonActive(int nextPage, int totalPages) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 50),
//       child: InkWell(
//         onTap: () {
//           //save difficulty level
//           print(nextPage);
//           print(totalPages);
//           if (nextPage < totalPages) {
//             _controller.animateToPage(nextPage,
//                 duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
//           } else if (nextPage == totalPages) {
//           } else {
//             setState(() => questionNum = nextPage);
//           }
//           //go to next page
//         },
//         child: Container(
//           height: 90,
//           width: 300,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.all(Radius.circular(22)),
//               border: Border.all(color: green, width: 3)),
//           child: Center(
//             child: Text(
//               "NEXT",
//               style: TextStyle(
//                   color: green,
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   fontStyle: FontStyle.normal),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _submitButtonInActive() {
//     return Opacity(
//       opacity: 0.2,
//       child: Padding(
//         padding: const EdgeInsets.only(bottom: 50),
//         child: Container(
//           height: 90,
//           width: 300,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.all(Radius.circular(22)),
//               border: Border.all(color: colorCoral, width: 3)),
//           child: Center(
//             child: Text(
//               "SUBMIT",
//               style: TextStyle(
//                   color: colorCoral,
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   fontStyle: FontStyle.normal),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class OptionWidget extends StatelessWidget {
//   final bool _isChecked;
//   final int _optionType;
//   final String _answer;
//   final Function _onPress;
//   final Function _checkAnswer;

//   OptionWidget(this._isChecked, this._optionType, this._answer, this._onPress,
//       this._checkAnswer);

//   bool isCorrect() {
//     if (_isChecked == true) {
//       // print("Answer: $_answer");
//       // print("Checked: ${_getOptionSelcted(_optionType)}");
//       if (_answer == _getOptionSelcted(_optionType)) {
//         return true;
//       } else {
//         return false;
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 32, right: 32, bottom: 12),
//       child: InkWell(
//         onTap: () {
//           print("Answer: $_answer");
//           print("Checked: ${_getOptionSelcted(_optionType)}");
//           print("${isCorrect()} ");

//           _onPress(_optionType);
//           _checkAnswer(isCorrect());
//         },
//         child: Container(
//           padding: _isChecked == true
//               ? EdgeInsets.only(bottom: 20.0)
//               : EdgeInsets.only(bottom: 0.0),
//           width: 400.0,
//           child: ListTile(
//             /**
//              * difficulty text title
//              */
//             title: Text(
//               _getOptionSelcted(_optionType),
//               style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 23.0,
//                   fontWeight: FontWeight.bold,
//                   fontStyle: FontStyle.normal),
//             ),
//             /**
//              * difficulty text description
//              */
//             // subtitle: _isChecked == true
//             //     ? Text("",
//             //         // _getDifficultyDescription(_optionType),
//             //         style: TextStyle(
//             //             color: Colors.white,
//             //             fontSize: 15,
//             //             fontWeight: FontWeight.bold))
//             //     : Text(""),
//             trailing: Icon(
//               optionIcon(),
//               color: Colors.white,
//             ),
//           ),
//           /**
//            * container decoration
//            */
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.all(Radius.circular(20)),
//             color: boxDecorationColor(),
//           ),
//         ),
//       ),
//     );
//   }

//   Color boxDecorationColor() {
//     if (_isChecked == true) {
//       if (isCorrect()) {
//         return green;
//       } else {
//         return Colors.pink;
//       }
//     } else {
//       return colorCoral;
//     }
//   }

//   IconData optionIcon() {
//     if (_isChecked == true) {
//       if (isCorrect()) {
//         return Icons.check;
//       } else {
//         return Icons.close;
//       }
//     } else {
//       return Icons.keyboard_arrow_right;
//     }
//   }
//   // String _getDifficultyDescription(int position) {
//   //   var text;
//   //   switch (position) {
//   //     case 0:
//   //       text = "See explanation";
//   //       break;
//   //     case 1:
//   //       text = "See explanation";
//   //       break;
//   //   }

//   //   return text;
//   // }
// }

// String _getOptionSelcted(int position) {
//   var text;
//   switch (position) {
//     case 0:
//       text = "True";
//       break;
//     case 1:
//       text = "False";
//       break;
//   }
//   return text;
// }
