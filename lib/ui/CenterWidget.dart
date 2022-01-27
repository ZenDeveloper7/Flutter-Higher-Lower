import 'package:flutter/material.dart';

import 'CorrectWidget.dart';
import 'VsWidget.dart';


class CenterIcon extends StatelessWidget {
  final double scaleValue;
  final bool change;

  const CenterIcon({Key? key, required this.scaleValue, required this.change})
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
        child: change ? const CorrectIcon() : const VsIcon(),
      ),
    );
  }
}
