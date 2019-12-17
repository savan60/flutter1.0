import 'package:first_app/result.dart';
import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  final _questions = const [
    {
      'questionText': 'What is your favourite color?',
      'answerText': [
        {'text': 'blue', 'Score': 10},
        {'text': 'black', 'Score': 7},
        {'text': 'white', 'Score': 3},
        {'text': 'red', 'Score': 1}
      ],
    },
    {
      'questionText': 'What is your favourite animal?',
      'answerText': [
        {'text': 'cat', 'Score': 10},
        {'text': 'dog', 'Score': 7},
        {'text': 'horse', 'Score': 3},
        {'text': 'cow', 'Score': 1}
      ],
    },
    {
      'questionText': 'What is your favourite instructor?',
      'answerText': [
        {'text': 'SHM', 'Score': 10},
        {'text': 'Abhinav', 'Score': 7},
        {'text': 'Max', 'Score': 3},
        {'text': 'Amola', 'Score': 1}
      ],
    }
  ];

  static int _totalScore = 0;
  void restartQuiz(){
    setState(() {
      _questionIndex=0;
      _totalScore=0;
    });
  }
  void _answerWritten(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    if (_questionIndex > _questions.length) {
      print('Questions are left');
    } else {
      print('questions are finished');
    }
    print(_questionIndex);
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                answerWritten: _answerWritten,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore,restartQuiz),
      ),
    );
  }
}
