import 'package:assignment_five_flutter/data/colors.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static const TextStyle quranTabTitleTextStyle = TextStyle(
      fontSize: 25, fontWeight: FontWeight.w600, color: ColorsGenerator.accent);
  static const TextStyle ayatTextStyle = TextStyle(
      fontSize: 20, fontWeight: FontWeight.w400, color: ColorsGenerator.accent);
}
