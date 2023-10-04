import 'package:assignment_five_flutter/data/colors.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static const TextStyle quranAndHadeethTabTitleTextStyle = TextStyle(
      fontSize: 25, fontWeight: FontWeight.w600, color: ColorsGenerator.accent);

  static const TextStyle quranAndHadeethTabTitleDarkTextStyle = TextStyle(
      fontSize: 25, fontWeight: FontWeight.w600, color: ColorsGenerator.white);

  static const TextStyle azkarTextStyle = TextStyle(
      fontSize: 25, fontWeight: FontWeight.w600, color: ColorsGenerator.accent);

  static const TextStyle switchTitleTextStyle = TextStyle(
      fontSize: 20, fontWeight: FontWeight.w400, color: ColorsGenerator.accent);

  static const TextStyle azkarDarkTextStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: ColorsGenerator.accentDark);

  static const TextStyle ayatTextStyle = TextStyle(
      fontSize: 20, fontWeight: FontWeight.w400, color: ColorsGenerator.accent);

  static const TextStyle ayatContentDarkTextStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: ColorsGenerator.accentDark);

  static const TextStyle ayatContentTextStyle = TextStyle(
      fontSize: 20, fontWeight: FontWeight.w400, color: ColorsGenerator.accent);

  static const TextStyle appBarTextStyle = TextStyle(
      fontSize: 30, fontWeight: FontWeight.w600, color: ColorsGenerator.accent);

  static const TextStyle darkAppBarTextStyle = TextStyle(
      fontSize: 30, fontWeight: FontWeight.w600, color: ColorsGenerator.white);

  static const TextStyle darkSwitchTitleTextStyle = TextStyle(
      fontSize: 20, fontWeight: FontWeight.w400, color: ColorsGenerator.white);

  static ThemeData lightTheme = ThemeData(
      switchTheme: SwitchThemeData(overlayColor: MaterialStateProperty.all(ColorsGenerator.primary)),
      scaffoldBackgroundColor: ColorsGenerator.transparent,
      primaryColor: ColorsGenerator.primary,
      dividerTheme:
          const DividerThemeData(thickness: 2, color: ColorsGenerator.primary),
      appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
              color: ColorsGenerator.black
          ),
          centerTitle: true,
          backgroundColor: ColorsGenerator.transparent,
          elevation: 0,
          titleTextStyle: appBarTextStyle),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: ColorsGenerator.accent,
          backgroundColor: ColorsGenerator.primary,
          selectedIconTheme: IconThemeData(size: 30),
          unselectedIconTheme: IconThemeData(size: 26)),
      textTheme: const TextTheme(
          bodySmall: switchTitleTextStyle,
          bodyMedium: quranAndHadeethTabTitleTextStyle,
          displayMedium: azkarTextStyle,
          bodyLarge: ayatContentTextStyle));

  static ThemeData darkTheme = ThemeData(

      switchTheme: SwitchThemeData(
          overlayColor: MaterialStateProperty.all(ColorsGenerator.primaryDark)),
      scaffoldBackgroundColor: ColorsGenerator.transparent,
      primaryColor: ColorsGenerator.primaryDark,
      dividerTheme: const DividerThemeData(
          thickness: 2, color: ColorsGenerator.accentDark),
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(
          color: ColorsGenerator.white
        ),
          centerTitle: true,
          backgroundColor: ColorsGenerator.transparent,
          elevation: 0,
          titleTextStyle: darkAppBarTextStyle),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: ColorsGenerator.accentDark,
          backgroundColor: ColorsGenerator.primaryDark,
          selectedIconTheme: IconThemeData(size: 30),
          unselectedIconTheme: IconThemeData(size: 26)),
      textTheme: const TextTheme(
          bodySmall: darkSwitchTitleTextStyle,
          bodyMedium: quranAndHadeethTabTitleDarkTextStyle,
          displayMedium: azkarDarkTextStyle,
          bodyLarge: ayatContentDarkTextStyle));
}
