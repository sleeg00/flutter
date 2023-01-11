import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Color bgcColor;
  final Color textColor;

  const Button(
      {super.key,
      required this.text,
      required this.bgcColor,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        color: bgcColor,
        borderRadius: BorderRadius.circular(45),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15, //위아래
          horizontal: 40, //양옆
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
