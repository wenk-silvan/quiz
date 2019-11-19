import 'package:flutter/material.dart';

import './quiz.dart';
import 'result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'question': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 30},
        {'text': 'Yellow', 'score': 50},
      ]
    },
    {
      'question': 'What\'s you favorite animal?',
      'answers': [
        {'text': 'Dog', 'score': 10},
        {'text': 'Cat', 'score': 20},
        {'text': 'Snake', 'score': 30},
        {'text': 'Elephant', 'score': 50}
      ]
    },
    {
      'question': 'What\'s your favorite hobby?',
      'answers': [
        {'text': 'Ski', 'score': 50},
        {'text': 'Jump', 'score': 30},
        {'text': 'Run', 'score': 20},
        {'text': 'Play', 'score': 10}
      ]
    }
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    setState(() {
      _questionIndex++;
    });

    _totalScore += score;

    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: this._questionIndex < this._questions.length
            ? Quiz(
                answerQuestion: this._answerQuestion,
                questionIndex: this._questionIndex,
                questions: this._questions,
              )
            : Result(this._totalScore),
      ),
    );
  }
}
