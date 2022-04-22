import 'package:autism/text.dart';

class Quest {
  int _textNumber = 0;

  List<bool> _BibaAnswers = [];

  final List<text> _textQuest = [
    text('Вопрос 1. Вы любите обществознание?', 'Да', 'Нет','Возможно', 1),
    text('Общество, в отличие от природы…', 'развивается закономерно', 'подвержено изменениям','творит культуру', 3),
    text('Экологический кризис относится к глобальным потому, что…', 'затрагивает существование большинства землян ', 'возник в эпоху экономической глобализации','порожден внеземными силами', 1),
    text('Что из перечисленного характеризует постиндустриальное общество?', 'религиозный характер культуры', 'переход от натурального к товарному производству','развитие информационных технологий', 3),
    text('К потребностям человека, порожденным обществом, относится потребность в', 'трудовой деятельности', 'нормальном теплообмене','сохранении здоровья', 1),
    text('Какой признак характеризует человека как личность?', 'физическое и психическое здоровье', 'особенности внешности','активная жизненная позиция', 3),
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

   getAnswer3() {
    return _textQuest[_textNumber].answer3;
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
