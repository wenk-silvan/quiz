import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resultText = 'You did it!';
    if (resultScore >= 120) {
      resultText = 'You are awesome';
    } else if (resultScore >= 90) {
      resultText = 'Pretty likeable';
    } else if (resultScore >= 50) {
      resultText = 'You are strange';
    } else {
      resultText = 'You are bad.';
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: <Widget>[
        Text(
          this.resultPhrase,
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        FlatButton(
          child: Text('Restart Quiz'),
          onPressed: this.resetHandler,
          color: Colors.blue,
        )
      ],
    ));
  }
}
