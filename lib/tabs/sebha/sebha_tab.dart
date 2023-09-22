import 'package:flutter/material.dart';
import '../../data/azkar.dart';
import '../../data/colors.dart';
import 'Widgets/button_generator.dart';
import 'Widgets/sebha.dart';
import 'Widgets/text_generator.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int zekrCounter = 0;
  String zekr = Azkar.azkar[0];
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsGenerator.transparent,
      body: Column(
        children: [
          ButtonGenerator(
            widget: const Sebha(),
            onPressed: () {
              setState(() {
                if (counter < 32) {
                  counter += 1;
                } else {
                  counter = 0;
                  if (zekrCounter < Azkar.azkar.length - 1) {
                    zekrCounter += 1;
                  } else {
                    zekrCounter = 0;
                  }
                  zekr = Azkar.azkar[zekrCounter];
                }
              });
            },
          ),
          TextGenerator(
              text: "عدد التسبيحات",
              textColor: ColorsGenerator.black,
              backGroundColor: ColorsGenerator.transparent),
          Container(
            decoration: BoxDecoration(
              color: ColorsGenerator.liteCaffeColor,
              borderRadius: BorderRadius.circular(30),
            ),
            width: 69,
            height: 81,
            child: Center(
              child: TextGenerator(
                text: "$counter",
                textColor: Colors.black,
                backGroundColor: ColorsGenerator.transparent,
              ),
            ),
          ),
          TextGenerator(
            text: Azkar.azkar[zekrCounter],
            textColor: ColorsGenerator.white,
            backGroundColor: ColorsGenerator.primary,
            height: 51,
            width: 137,
            normal: FontWeight.normal,
            fontSize: 25,
          ),
        ],
      ),
    );
  }
}
