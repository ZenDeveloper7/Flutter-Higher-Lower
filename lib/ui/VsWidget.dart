import 'package:flutter/material.dart';


class VsIcon extends StatelessWidget {
  const VsIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      maxRadius: 35.0,
      backgroundColor: Colors.white,
      child: Text(
        'VS',
        style: TextStyle(
            color: Colors.black, fontSize: 17.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}