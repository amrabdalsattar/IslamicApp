import 'package:flutter/material.dart';

import '../../../../data/colors.dart';

class ButtonGenerator extends StatefulWidget {
  final Widget? widget;
  final VoidCallback onPressed;

  const ButtonGenerator(
      {Key? key, required this.widget, required this.onPressed})
      : super(key: key);

  @override
  State<ButtonGenerator> createState() => _ButtonGeneratorState();
}

class _ButtonGeneratorState extends State<ButtonGenerator> {
  @override
  Widget build(BuildContext context) {
    return Ink(
      color: ColorsGenerator.transparent,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          backgroundColor:
              MaterialStateProperty.all(ColorsGenerator.transparent),
          elevation: MaterialStateProperty.all(0),
        ),
        child: widget.widget,
      ),
    );
  }
}
