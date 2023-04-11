import 'package:flutter/material.dart';
import 'package:flutter_higher_lower/widgets/incorrect_widget.dart';

import 'correct_widget.dart';
import 'vs_widget.dart';

class CenterIcon extends StatelessWidget {
  final double scaleValue;
  final int iconValue;

  const CenterIcon(
      {Key? key, required this.scaleValue, required this.iconValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: scaleValue,
      duration: const Duration(milliseconds: 450),
      curve: Curves.decelerate,
      child: AnimatedContainer(
        duration: const Duration(seconds: 2),
        curve: Curves.fastOutSlowIn,
        child: (iconValue == -1)
            ? const VsIcon()
            : (iconValue == 1)
                ? const CorrectIcon()
                : const IncorrectIcon(),
      ),
    );
  }
}
