abstract class InputSate {}

class InvalideSate extends InputSate {
  final String error;
  InvalideSate(this.error);
}

class InitialSate extends InputSate {}

class ValideSate extends InputSate {}

class OnbuttonClick extends InputSate {
  final String result;
  OnbuttonClick(this.result);
}
