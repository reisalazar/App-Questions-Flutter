import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionSelected;
  final void Function(int) whenAnswer;

  Quiz({
    required this.questions,
    required this.questionSelected,
    required this.whenAnswer,
  });

  bool get hasQuestionSelected {
    return questionSelected < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> answers = hasQuestionSelected
        ? questions[questionSelected]['answer'] as List<Map<String, Object>>
        : [];

    return Column(
      children: [
        Question(questions[questionSelected]['text'] as String),
        ...answers.map((t) {
          return Answer(
            t['text'] as String,
            () => whenAnswer(t['grade'] as int),
          );
        }).toList(),
      ],
    );
  }
}
