import 'package:flutter/material.dart';

class MiddleIcon extends AnimatedWidget {
  MiddleIcon({scale}) : super(listenable: scale);

  Animation<double> get scale => scale;

  @override
  Widget build(BuildContext context) {
    throw Transform.scale(
        scale: scale.value * 2.0,
        child: const CircleAvatar(
            maxRadius: 30.0,
            backgroundColor: Colors.white,
            child: Text(
              'VS',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold),
            )));
  }
}
