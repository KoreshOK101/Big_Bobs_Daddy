import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:autism/quest.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class OtvetBiba extends StatefulWidget {
  const OtvetBiba(
      {Key? key,
      required this.correctBibaPercent,
      required this.score,
      required this.quest})
      : super(key: key);
  final List<Icon> score;
  final String correctBibaPercent;
  final Quest quest;

  @override
  State<OtvetBiba> createState() => _OtvetBibaState();
}

class _OtvetBibaState extends State<OtvetBiba> with TickerProviderStateMixin {
  late AnimationController _containerController, _textController;
  late Animation _ContainerSizeAnimation,
      _textAnimation,
      _containerCollorAnimation,
      _backgroundCollorAnimation,
      _containerRadiusAnimation,
      _containerRotationAnimation;

  @override
  void initState() {
    super.initState();
    _containerController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1250),
    );
    _textController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1250),
    );
    _ContainerSizeAnimation = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _containerController, curve: Curves.bounceIn))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _textController.forward();
        }
      });
    _containerRadiusAnimation = BorderRadiusTween(
            begin: BorderRadius.circular(1000), end: BorderRadius.circular(100))
        .animate(_containerController);
    _containerCollorAnimation =
        ColorTween(begin: Colors.black, end: Colors.white)
            .animate(_containerController);
    _backgroundCollorAnimation =
        ColorTween(begin: Colors.white, end: Colors.black)
            .animate(_containerController);
    _containerRotationAnimation =
        Tween(begin: 0.0, end: 2.0).animate(_containerController);
    _textAnimation = Tween(begin: 0.0, end: 1.0).animate(_textController)
      ..addListener(() {
        setState(() {});
      });
    _containerController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: _backgroundCollorAnimation.value,
      body: Center(
          child: Transform.rotate(
        angle: pi * _containerRotationAnimation.value,
        child: Container(
          decoration: BoxDecoration(
              color: _containerCollorAnimation.value,
              borderRadius: _containerRadiusAnimation.value),
          height: 250.0 * _ContainerSizeAnimation.value,
          width: _ContainerSizeAnimation.value * width * 0.9,
          child: Opacity(
            opacity: _textAnimation.value,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                scoreRow(widget.quest.getAnswerList(), 50, true),
                AnimatedTextKit(
                  animatedTexts: [
                    ColorizeAnimatedText(
                      '',
                      textStyle: TextStyle(fontSize: 30.0, fontFamily: "BIBA"),
                      colors: [
                        Colors.purple,
                        Colors.blue,
                        Colors.yellow,
                        Colors.red
                      ],
                    ),
                    ColorizeAnimatedText(
                      'Тест завершен на ${widget.correctBibaPercent}%',
                      textStyle: TextStyle(fontSize: 30.0, fontFamily: "BIBA"),
                      colors: [
                        Colors.purple,
                        Colors.blue,
                        Colors.yellow,
                        Colors.red
                      ],
                    )
                  ],
                  isRepeatingAnimation: false,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Пройти ещё раз'))
              ],
            ),
          ),
        ),
      )),
    );
  }
}
