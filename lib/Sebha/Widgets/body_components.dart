import 'package:assignment_five_flutter/Sebha/Widgets/sebha.dart';
import 'package:assignment_five_flutter/Sebha/Widgets/tasbeeh_counter.dart';
import 'package:assignment_five_flutter/Sebha/Widgets/text_generator.dart';
import 'package:flutter/material.dart';
import '../data/azkar.dart';
import '../data/colors.dart';
import '../data/image_path.dart';
import 'button_generator.dart';

class BodyComponents extends StatefulWidget {
  static String routeName = "Sebha";

  @override
  State<BodyComponents> createState() => _BodyComponentsState();
}

class _BodyComponentsState extends State<BodyComponents> {
  int zekrCounter = 0;
  String zekr = Azkar.azkar[0];
  int counter = 0;

  final TasbeehCounter tasbeehCounter = TasbeehCounter();

  final ImagePath pathData = ImagePath();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(ImagePath.path["backGround"]!),
        fit: BoxFit.cover,
      )),
      child: Column(
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
