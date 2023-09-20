import 'package:flutter/material.dart';
import '../data/colors.dart';

class ButtonGenerator extends StatelessWidget {
  final Widget? widget;
  final VoidCallback onPressed;

  ButtonGenerator({Key? key, required this.widget, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      // Call the provided callback when the button is pressed
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(ColorsGenerator.transparent),
        elevation: MaterialStateProperty.all(0),
      ),
      child: widget,
    );
  }
}
