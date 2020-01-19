import 'question.dart';

class QAPairs {
  int _no = 0;
  List<Question> _pair = [
    Question("Am I iron man?", true),
    Question("Do you think I am sherlock's father?", false),
    Question("Do I stay only in one reality?", true),
    Question("Do I know Everything?", true),
    Question("Do I tell you everything?", false)
  ];
  void nextQ() {
    if (_no < _pair.length - 1) {
      _no++;
    }
  }

  String getQ() {
    return _pair[_no].question;
  }

  bool getA() {
    return _pair[_no].answer;
  }

  bool isFinished() {
    if (_no == _pair.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _no = 0;
  }
}
