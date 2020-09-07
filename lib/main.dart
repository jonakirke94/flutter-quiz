import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 7},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 1},
        {'text': 'Green', 'score': 11},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 7},
        {'text': 'Snake', 'score': 5},
        {'text': 'Elephant', 'score': 12},
        {'text': 'Lion', 'score': 3},
      ],
    },
    {
      'questionText': 'What\'s your favorite instructor?',
      'answers': [
        {'text': 'Jonathan', 'score': 8},
        {'text': 'Torben', 'score': 4},
        {'text': 'Elias', 'score': 2},
        {'text': 'Chefen', 'score': 5},
      ],
    }
  ];

  void _answerQuestion(int score) {
    setState(() {
      _totalScore = _totalScore += score;
      _questionIndex = _questionIndex + 1;
    });
  }

  void _resetHandler() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Column(
                children: [
                  Quiz(
                      answerQuestion: _answerQuestion,
                      questions: _questions,
                      questionIndex: _questionIndex),
                ],
              )
            : Result(_totalScore, _resetHandler),
      ),
    );
  }
}
