import 'package:assignment_five_flutter/Sebha/data/image_path.dart';
import 'package:flutter/material.dart';

import '../Widgets/body_components.dart';
import '../data/colors.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {BodyComponents.routeName: (_) => BodyComponents()},
      debugShowCheckedModeBanner: false,
      home: Container(
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
          body: BodyComponents(),
        ),
      ),
    );
  }
}
