import 'package:assignment_five_flutter/HomeScreen/home_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  static int currentTabIndex = 0;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {HomeScreen.routeName: (_) => HomeScreen()},
        debugShowCheckedModeBanner: false,
        home: HomeScreen());
  }
}
