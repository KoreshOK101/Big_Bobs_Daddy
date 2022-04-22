import 'package:autism/text.dart';

class Quest {
  int _textNumber = 0;

  List<bool> _BibaAnswers = [];

  final List<text> _textQuest = [
    text('Вопрос 1. Вы любите обществознание?', 'Да', 'Нет', true),
    text('Вопрос 2. Что такое конкуренция?', 'Да', 'Нет', true),
    text('Вопрос 3. Что такое чистая монополия?', 'Да', 'Нет', false),
    text('? ', 'Да', 'Нет', false),
    text('БАКС', 'Да', 'Нет', true),
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

  getAnswer1() {
    return _textQuest[_textNumber].answer1;
  }

  getAnswer2() {
    return _textQuest[_textNumber].answer2;
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
