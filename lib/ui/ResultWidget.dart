import 'package:flutter/material.dart';

import 'CustomStyles.dart';

class Result extends StatelessWidget {
  final int result;

  const Result({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(result.toString(), style: secondaryTitle),
    );
  }
}
