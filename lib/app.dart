import 'package:assignment_five_flutter/Screens/details_screen.dart';
import 'package:assignment_five_flutter/Screens/home_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  static int currentTabIndex = 0;

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {HomeScreen.routeName: (_) => const HomeScreen(),
        DetailsScreen.routeName: (_) => DetailsScreen()},
        debugShowCheckedModeBanner: false,
        home: const HomeScreen());
  }
}
