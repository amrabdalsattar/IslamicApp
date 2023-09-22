import 'package:flutter/material.dart';

class TextGenerator extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color backGroundColor;
  final double? width;
  final double? height;
  final FontWeight normal;
  final double? fontSize;

  const TextGenerator(
      {super.key,
      required this.text,
      required this.textColor,
      required this.backGroundColor,
      this.height,
      this.width,
      this.normal = FontWeight.bold,
      this.fontSize = 30});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: backGroundColor, borderRadius: BorderRadius.circular(30)),
      margin: const EdgeInsets.only(top: 18, bottom: 5),
      child: Center(
          child: Text(
        text,
        style:
            TextStyle(fontWeight: normal, fontSize: fontSize, color: textColor),
      )),
    );
  }
}
