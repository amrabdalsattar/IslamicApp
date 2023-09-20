import 'package:assignment_five_flutter/Sebha/Widgets/text_generator.dart';
import 'package:flutter/material.dart';

class TasbeehCounter extends StatelessWidget {
  void function;
  int counter = 0;

  final Color color = const Color.fromARGB(255, 200, 180, 151);

  final Color transparent = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
      ),
      width: 69,
      height: 81,
      child: Center(
        child: TextGenerator(
          text: "$counter",
          textColor: Colors.black,
          backGroundColor: transparent,
        ),
      ),
    );
  }
}
