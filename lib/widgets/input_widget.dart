import 'package:flutter/material.dart';
import 'package:flutter_higher_lower/constants/styles.dart';

class InputWidget extends StatelessWidget {
  final VoidCallback onClick;
  final String title;

  const InputWidget({Key? key, required this.onClick, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250.0,
      child: ElevatedButton(
        onPressed: onClick,
        child: Text(title),
        style: ElevatedButton.styleFrom(
            shape: buttonShape,
            minimumSize: const Size(0.0, 40.0),
            primary: (title == 'Higher') ? Colors.green : Colors.red),
      ),
    );
  }
}
