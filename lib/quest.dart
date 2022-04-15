import 'package:autism/text.dart';

class Quest {
  int _textNumber = 0;

  List<bool> _BibaAnswers = [];

  final List<text> _textQuest = [
    text('Эй,Дора.', true),
    text('Готова?', true),
    text('Да', false),
    text('В моих глазах доллар? ', false),
    text('БАКС', true),
  ];

  addAnswer(bool answer) {
    _BibaAnswers.add(answer);
  }

  getAnswerList() {
    return _BibaAnswers;
  }

  gettext() {
    return _textQuest[_textNumber].textQuest;
  }

  gettextAnswer() {
    return _textQuest[_textNumber].textAnswers;
  }

  nexttext() {
    if (_textNumber < _textQuest.length - 1) {
      _textNumber++;
    }
    ;
  }

  bool isfinished() {
    if (_textNumber >= _textQuest.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  reset() {
    _textNumber = 0;
    _BibaAnswers.clear();
  }

  getAllBiba() {
    return _textQuest.length;
  }
}
