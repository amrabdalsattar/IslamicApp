import 'package:assignment_five_flutter/Sebha/Widgets/body_components.dart';
import 'package:flutter/material.dart';
import '../data/colors.dart';
import '../data/image_path.dart';

class SebhaTab extends StatelessWidget {
  const SebhaTab ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsGenerator.transparent,
      body: BodyComponents(),
    );
  }
}
