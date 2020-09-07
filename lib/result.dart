import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final Function resetHandler;

  Result(this.score, this.resetHandler);

  String get resultPhrase {
    String resultText;

    if (score <= 8) {
      resultText = 'You are awesome and innocent!';
    } else if (score <= 12) {
      resultText = 'Prettty likeable!';
    } else if (score <= 16) {
      resultText = 'You are ... strange?!';
    } else {
      resultText = 'You are so bad!';
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(resultPhrase,
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
          FlatButton(
              child: Text('Reset Quiz'),
              textColor: Colors.blue,
              onPressed: resetHandler),
        ],
      ),
    );
  }
}
