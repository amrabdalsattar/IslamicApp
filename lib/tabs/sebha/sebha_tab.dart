import 'package:assignment_five_flutter/settings_provider/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../data/colors.dart';
import '../../../data/image_path.dart';
import 'Widgets/button_generator.dart';
import 'Widgets/sebha.dart';
import 'Widgets/text_generator.dart';

class SebhaTab extends StatelessWidget {
  late String zekr;

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);
    zekr = provider.azkar[0];
    return Scaffold(
      backgroundColor: ColorsGenerator.transparent,
      body: Column(
        children: [
          ///Sebha Head
          Container(
              margin: const EdgeInsets.only(top: 15),
              child: Image.asset(provider.currentMode == ThemeMode.light
                  ? ImagePath.sebhaHead
                  : ImagePath.darkSebhaHead)),

          /// Sebha Body and the Button
          Transform.rotate(
            angle: provider.rotationAngle,
            child: ButtonGenerator(
              widget: const Sebha(),
              onPressed: () {
                provider.incrementCounter();
              },
            ),
          ),

          /// "Tasbeeh Count" (Title Text)
          TextGenerator(
              text: AppLocalizations.of(context)!.tasbeehCount,
              textColor: provider.currentMode == ThemeMode.light
                  ? ColorsGenerator.black
                  : Colors.white,
              backGroundColor: ColorsGenerator.transparent),

          /// Tasbeeh Counter
          Container(
            decoration: BoxDecoration(
              color: provider.currentMode == ThemeMode.light
                  ? ColorsGenerator.liteCaffeColor
                  : ColorsGenerator.darkBlue,
              borderRadius: BorderRadius.circular(30),
            ),
            width: 69,
            height: 81,
            child: Center(
              child: TextGenerator(
                text: "${provider.counter}",
                textColor: provider.currentMode == ThemeMode.light
                    ? ColorsGenerator.black
                    : Colors.white,
                backGroundColor: ColorsGenerator.transparent,
              ),
            ),
          ),

          /// Azkar
          TextGenerator(
            text: provider.azkar[provider.zekrCounter],
            textColor: provider.currentMode == ThemeMode.light
                ? ColorsGenerator.white
                : ColorsGenerator.black,
            backGroundColor: provider.currentMode == ThemeMode.light
                ? ColorsGenerator.primary
                : ColorsGenerator.accentDark,
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
