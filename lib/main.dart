//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'Pairs.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData.dark().copyWith(
          accentColor: Colors.orange,
          textTheme: TextTheme(body1: TextStyle(color: Colors.white))),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black54,
          title: Text("Quizler"),
          centerTitle: true,
        ),
        backgroundColor: Colors.black,
        body: SafeArea(child: Quizler()),
      ),
    ));

class Quizler extends StatefulWidget {
  @override
  _QuizlerState createState() => _QuizlerState();
}

class _QuizlerState extends State<Quizler> {
  List<Widget> score = [];
  QAPairs thepair = QAPairs();

  void checkans(bool userA) {
    setState(() {
      if (thepair.isFinished()) {
        Alert(
          context: context,
          type: AlertType.info,
          title: "Finished",
          desc: "The quiz is finished!!",
          buttons: [
            DialogButton(
              child: Text(
                "Re-Start",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();
        thepair.reset();
        score = [];
      } else {
        if (thepair.getA() == userA) {
          score.add(Icon(
            Icons.check_circle,
            color: Colors.green,
          ));
        } else {
          score.add(Icon(
            Icons.cancel,
            color: Colors.red,
          ));
        }
        thepair.nextQ();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                thepair.getQ(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          flex: 5,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
              color: Colors.green,
              child: Text("True"),
              onPressed: () {
                checkans(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
              color: Colors.red,
              child: Text("False"),
              onPressed: () {
                checkans(false);
              },
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: score,
          ),
        )
      ],
    );
  }
}
