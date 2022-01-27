import 'package:flutter/material.dart';

class CorrectIcon extends StatelessWidget {
  const CorrectIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      maxRadius: 35.0,
      backgroundColor: Colors.green,
      child: Icon(
        Icons.check,
        color: Colors.white,
      ),
    );
  }
}