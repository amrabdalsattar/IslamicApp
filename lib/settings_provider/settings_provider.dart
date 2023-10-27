import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  String currentLocale = "en";
  ThemeMode currentMode = ThemeMode.light;
  int counter = 0;
  double rotationAngle = 0.0;
  List<String> azkar = ["سبحان الله", "الحمد لله", "الله أكبر"];
  int zekrCounter = 0;
  SharedPreferences? _preferences;
  final String _themeKey = "theme";
  final String _langKey = "lang";

  void setCurrentLocale(String newLocale) {
    currentLocale = newLocale;
    notifyListeners();
    saveLang(newLocale);
  }

  void setCurrentMode(ThemeMode newThemeMode) {
    currentMode = newThemeMode;
    notifyListeners();
    saveTheme(newThemeMode);
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
  String? getLang(){
    return _preferences!.getString(_langKey);
  }

  Future<void> saveLang(String newLang) async{
    await _preferences!.setString(_langKey, newLang);
  }

  String? getTheme() {
    return _preferences!.getString(_themeKey);
  }

  Future<void> saveTheme(ThemeMode themeMode) async {
    String themeValue = (themeMode == ThemeMode.light ? "light" : "dark");
    await _preferences!.setString(_themeKey, themeValue);
  }

  Future<void> loadSettingConfig() async {
    _preferences = await SharedPreferences.getInstance();
    String? themeMode = getTheme();
    String? lang = getLang();


    if (themeMode != null) {
      currentMode = (themeMode == "light" ? ThemeMode.light : ThemeMode.dark);
    }
    if (lang != null) {
      currentLocale = lang;
    }
  }

}
