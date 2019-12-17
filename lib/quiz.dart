import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget{

  final List<Map<String,Object>> questions;
  final Function answerWritten;
  final int questionIndex;

  Quiz({@required this.questions,@required this.answerWritten,@required this.questionIndex});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
          children: <Widget>[
            Question(
              questions[questionIndex]['questionText'],
            ),
            ...(questions[questionIndex]['answerText'] as List<Map<String,Object>>)
                .map((answer) {
              return Answer(() => answerWritten(answer['Score']), answer['text']);
            }).toList()
          ],
        );
  }
}