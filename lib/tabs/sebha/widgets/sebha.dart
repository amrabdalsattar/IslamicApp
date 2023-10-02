import 'package:assignment_five_flutter/settings_provider/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../data/image_path.dart';

class Sebha extends StatelessWidget {
  const Sebha({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(provider.currentMode == ThemeMode.light
            ? ImagePath.sebhaBody
            : ImagePath.darkSebhaBody),
      ],
    );
  }
}
