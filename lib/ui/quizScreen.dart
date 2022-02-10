import 'package:flutter/material.dart';
import 'package:level_up/model/question.dart';

class QuizzApp extends StatefulWidget {
  const QuizzApp({Key? key}) : super(key: key);

  @override
  _QuizzAppState createState() => _QuizzAppState();
}

class _QuizzAppState extends State<QuizzApp> {
  var _currentIndex = 0;

  List questions = [
    Question.name(
      questionText:
          "The Big Apple is a nickname given to Washington D.C in 1971.",
      iscorrect: false,
    ),
    Question.name(
      questionText: "Muddy York is a nickname for New York in the Winter..",
      iscorrect: false,
    ),
    Question.name(
      questionText: "Peanuts are not nuts!",
      iscorrect: true,
    ),
    Question.name(
      questionText: "People may sneeze or cough while sleeping deeply.",
      iscorrect: false,
    ),
    Question.name(
      questionText: "Copyrights depreciate over time.",
      iscorrect: true,
    ),
    Question.name(
      questionText: "Emus can’t fly.",
      iscorrect: true,
    ),
    Question.name(
      questionText: "Electrons move faster than the speed of light.",
      iscorrect: false,
    ),
    Question.name(
      questionText: "There is no snow on Minecraft",
      iscorrect: false,
    ),
    Question.name(
      questionText: "Light travels in a straight line.",
      iscorrect: true,
    ),
    Question.name(
      questionText: "The Mona Liza was stolen from the Louvre in 1911.",
      iscorrect: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[700],
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.6),
        title: Center(
          child: Text(
            ' True Citizen',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
      ),
      body: Builder(builder: (BuildContext context) {
        return Container(
          child: Column(
            children: [
              Image.asset(
                'images/flag.png',
                height: 330,
              ),
              // Spacer(),
              Container(
                height: 120.0,
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 8.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.5),
                      style: BorderStyle.solid,
                    )),
                child: Center(
                  child: Text(
                    questions[_currentIndex].questionText,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        _goBack();
                      },
                      child: Icon(Icons.arrow_back),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black.withOpacity(0.6),
                      )),
                  ElevatedButton(
                      onPressed: () {
                        _checkAnswer(true, context);
                      },
                      child: Text("TRUE"),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black.withOpacity(0.6),
                      )),
                  ElevatedButton(
                      onPressed: () {
                        _checkAnswer(false, context);
                      },
                      child: Text("FALSE"),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black.withOpacity(0.6),
                      )),
                  ElevatedButton(
                      onPressed: () {
                        _goFront();
                      },
                      child: Icon(Icons.arrow_forward),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black.withOpacity(0.6),
                      )),
                ],
              ),
              Spacer(),
            ],
          ),
        );
      }),
    );
  }

  void _goBack() {
    setState(() {
      _currentIndex = (_currentIndex - 1) % questions.length;
    });
  }

  _checkAnswer(bool userSelect, BuildContext context) {
    if (userSelect == questions[_currentIndex].iscorrect) {
      final snackbar = SnackBar(
        content: Text('CORRECT'),
        backgroundColor: Colors.greenAccent[700],
        elevation: 12.0,
        duration: Duration(milliseconds: 500),
      );
      // ignore: deprecated_member_use
      Scaffold.of(context).showSnackBar(snackbar);

      _nextQuestion();
    } else {
      final snackbar = SnackBar(
        content: Text('INCORRECT'),
        backgroundColor: Colors.red[700],
        elevation: 12.0,
      );
      // ignore: deprecated_member_use
      Scaffold.of(context).showSnackBar(snackbar);
      _nextQuestion();
    }
  }

  void _goFront() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % questions.length;
    });
  }

  _nextQuestion() {
    _goFront();
  }
}
