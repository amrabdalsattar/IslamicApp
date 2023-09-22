import 'package:assignment_five_flutter/Tabs/Sebha/Widgets/text_generator.dart';
import 'package:assignment_five_flutter/data/colors.dart';
import 'package:flutter/material.dart';

class TasbeehCounter extends StatelessWidget {
  int counter = 0;

  final Color color = const Color.fromARGB(255, 200, 180, 151);

  TasbeehCounter({super.key});

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
          textColor: ColorsGenerator.black,
          backGroundColor: ColorsGenerator.transparent,
        ),
      ),
    );
  }
}
