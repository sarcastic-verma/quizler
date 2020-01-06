import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black38,
          title: Text("Quizler"),
          centerTitle: true,
        ),
        backgroundColor: Colors.blueGrey,
        body: SafeArea(child: Quizler()),
      ),
    ));

class Quizler extends StatefulWidget {
  @override
  _QuizlerState createState() => _QuizlerState();
}

class _QuizlerState extends State<Quizler> {
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
                "This is where question goes!!!",
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
              onPressed: () {},
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
              color: Colors.red,
              child: Text("False"),
              onPressed: () {},
            ),
          ),
        )
      ],
    );
  }
}
