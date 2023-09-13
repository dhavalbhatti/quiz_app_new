class Question {
  String questionText = 'You can lead a cow down stairs but not up stairs.';
  bool questionAnswer = false;
  Question({required String q, required bool a}) {
    questionText = q;
    questionAnswer = a;
  }
}
