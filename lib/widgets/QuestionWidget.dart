import 'package:flutter/material.dart';
import '../constants/styles.dart';

class Question extends StatelessWidget {
  final String question;
  final int searches;

  const Question({Key? key, required this.question, required this.searches})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            '"$question"',
            style: primaryTitle,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 8.0),
          child: Text(
            'has',
            style: description,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            "$searches",
            style: secondaryTitle,
          ),
        ),
        const Text(
          'average monthly searches',
          style: description,
        )
      ],
    );
  }
}
