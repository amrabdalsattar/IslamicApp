import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  String currentLocale = "en";
  ThemeMode currentMode = ThemeMode.light;
  int counter = 0;
  double rotationAngle = 0.0;
  List<String> azkar = ["سبحان الله", "الحمد لله", "الله أكبر"];
  int zekrCounter = 0;

  void setCurrentLocale(String newLocale) {
    currentLocale = newLocale;
    notifyListeners();
  }

  void setCurrentMode(ThemeMode newThemeMode) {
    currentMode = newThemeMode;
    notifyListeners();
  }

  void incrementCounter() {
    rotationAngle += (1 / 5);
    if (counter < 32) {
      counter += 1;
    } else {
      counter = 0;
      zekrCounter += 1;
      if (zekrCounter >= azkar.length) {
        zekrCounter = 0;
      }
    }
    notifyListeners();
  }
}
