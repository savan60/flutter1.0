import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final Function restartHandler;
  Result(this.totalScore,this.restartHandler);

  String get resultPhrase {
    var resultText = 'You did it!';
    if (totalScore <= 8) {
      resultText = 'You are awesome';
    } else if (totalScore <= 12) {
      resultText = 'Pretty Likable';
    } else if (totalScore <= 16) {
      resultText = 'You are Strange..?!';
    } else {
      resultText = 'You are bad';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          FlatButton(
            child: Text('Restart the quiz'),
            onPressed: restartHandler,
          ),
        ],
      ),
    );
  }
}
