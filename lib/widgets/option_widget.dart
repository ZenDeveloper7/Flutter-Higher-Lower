import 'package:flutter/material.dart';
import 'package:flutter_higher_lower/constants/styles.dart';
import 'package:flutter_higher_lower/model/model.dart';
import 'package:flutter_higher_lower/widgets/result_widget.dart';

class OptionWidget extends StatelessWidget {
  final bool goNext;
  final HLModel answer;
  final HLModel question;
  final Widget inputLayout;

  const OptionWidget(
      {Key? key,
      required this.goNext,
      required this.answer,
      required this.question,
      required this.inputLayout})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            '"${answer.question}"',
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
        goNext ? Result(result: answer.searches) : inputLayout,
        Text(
          'searches than ${question.question}',
          style: description,
        )
      ],
    );
  }
}
