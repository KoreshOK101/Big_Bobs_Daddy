import 'package:autism/OtvetBiba.dart';
import 'package:autism/quest.dart';
import 'package:autism/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vk_bridge/vk_bridge.dart';

Future<void> main() async {
  VKBridge.instance.init();
  runApp(const AutismTEST());
}

class AutismTEST extends StatelessWidget {
  const AutismTEST({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: TestingPAGE(),
        ),
        backgroundColor: Color(0xFFBEFFFF),
      ),
    );
  }
}

class TestingPAGE extends StatefulWidget {
  const TestingPAGE({Key? key}) : super(key: key);

  @override
  _TestingPAGEState createState() => _TestingPAGEState();
}

class _TestingPAGEState extends State<TestingPAGE> {
  Quest quest = Quest();
  List<Icon> score = [];
  int correctBiba = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: Text(
              quest.gettext(),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 50),
            )),
          ),
          flex: 3,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: GestureDetector(
              onTap: () {
                checkAnswer(1);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.lightGreenAccent,
                ),
                child: Center(
                  child: Text(
                    quest.getAnswer1(),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: GestureDetector(
              onTap: () {
                checkAnswer(2);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.lightGreenAccent,
                ),
                child: Center(
                  child: Text(
                    quest.getAnswer1(),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: GestureDetector(
              onTap: () {
                checkAnswer(3);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.lightGreenAccent,
                ),
                child: Center(
                  child: Text(
                    quest.getAnswer1(),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
            ),
          ),
        ),
        Hero(
          tag: 'scoreBIG_BOB',
          child: scoreRow(quest.getAnswerList(), 30, false),
        )
      ],
    );
  }

  checkAnswer(int userAnswer) {
    int correctAnswer = quest.gettextAnswer();
    setState(() {
      if (userAnswer == correctAnswer) {
        correctBiba++;
        quest.addAnswer(true);
      } else {
        quest.addAnswer(false);
        ;
      }
      if (quest.isfinished()) {
        String correctBibaPercent =
            (correctBiba * 100 / quest.getAllBiba()).toStringAsFixed(0);
        onGoBack(dynamic value) {
          setState(() {
            quest.reset();
            score = [];
            correctBiba = 0;
          });
        }

        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => OtvetBiba(
                    correctBibaPercent: correctBibaPercent,
                    score: score,
                    quest: quest,
                  )),
        ).then(onGoBack);

        // showDialog(
        //     context: context,
        //     builder: (BuildContext context) {
        //       return AlertDialog(
        //         title: Text('Конец теста'),
        //         content: Text('Тест завершен на $correctBibaPercent%'),
        //       );
        //     });
      } else {
        quest.nexttext();
      }
    });
  }
}

Widget scoreRow(List<bool> answerList, double size, bool centered) {
  List<Icon> score = [];
  for (bool answer in answerList) {
    if (answer) {
      score.add(
        Icon(
          Icons.check,
          color: Colors.lightGreenAccent,
          size: size,
        ),
      );
    } else {
      score.add(
        Icon(
          Icons.close,
          color: Colors.redAccent,
          size: size,
        ),
      );
    }
  }

  return Row(
    mainAxisAlignment:
        centered ? MainAxisAlignment.center : MainAxisAlignment.start,
    children: score,
  );
}
