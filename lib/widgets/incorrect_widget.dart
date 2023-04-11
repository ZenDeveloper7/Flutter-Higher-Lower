import 'package:flutter/material.dart';

class IncorrectIcon extends StatelessWidget {
  const IncorrectIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      maxRadius: 35.0,
      backgroundColor: Colors.red,
      child: Icon(
        Icons.close,
        color: Colors.white,
      ),
    );
  }
}
