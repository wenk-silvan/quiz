import 'package:first_app/answer.dart';
import 'package:first_app/question.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final questions = const [
    {
      'question': 'What\'s your favorite color?',
      'answers': ['Black', 'Red', 'Violet', 'Yellow']
    },
    {
      'question': 'What\'s you favorite animal?',
      'answers': ['Dog', 'Cat', 'Snake', 'Elephant']
    },
    {
      'question': 'What\'s your favorite hobby?',
      'answers': ['Ski', 'Jump', 'Run', 'Play']
    }
  ];

  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex++;
    });

    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: this._questionIndex < this.questions.length ? Column(
          children: <Widget>[
            Question(questions[_questionIndex]['question']),
            ...(questions[_questionIndex]['answers'] as List<String>)
                .map((answer) {
                  return Answer(_answerQuestion, answer);
            }).toList(),
          ],
        ) : Center(child: Text('You did it.')),
      ),
    );
  }
}
