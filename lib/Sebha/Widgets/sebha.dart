import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../data/image_path.dart';

class Sebha extends StatelessWidget {
  const Sebha({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(ImagePath.path["sebhaHead"]!),
        Image.asset(ImagePath.path["sebhaBody"]!),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
