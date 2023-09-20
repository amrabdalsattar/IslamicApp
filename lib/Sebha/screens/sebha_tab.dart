import 'package:flutter/material.dart';
import '../data/colors.dart';
import '../data/image_path.dart';

class SebhaTab extends StatelessWidget {
  const SebhaTab ({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImagePath.path["backGround"]!),
            fit: BoxFit.cover,
          )),
      child: Scaffold(
        backgroundColor: ColorsGenerator.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ColorsGenerator.transparent,
          title: const Text(
            "إسلامي",
            style: TextStyle(
              fontSize: 30,
              color: ColorsGenerator.black,
            ),
          ),
          centerTitle: true,
        ),
      ),
    );
  }
}
