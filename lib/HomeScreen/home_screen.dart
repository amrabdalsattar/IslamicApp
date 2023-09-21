import 'package:assignment_five_flutter/Ahadeth/ahadeth_tab.dart';
import 'package:assignment_five_flutter/Quran/quran_tab.dart';
import 'package:assignment_five_flutter/Radio/radio_tab.dart';
import 'package:assignment_five_flutter/Sebha/screens/sebha_tab.dart';
import 'package:flutter/material.dart';
import '../Sebha/data/colors.dart';
import '../Sebha/data/icons.dart';
import '../Sebha/data/image_path.dart';


class HomeScreen extends StatefulWidget {
  static const String routeName = "home";
  static int currentTabIndex = 0;
  static const List<Widget> tabs = [QuranTab(), AhadethTab(), SebhaTab(), RadioTab()];

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            "Islami",
            style: TextStyle(
              fontSize: 30,
              color: ColorsGenerator.black,
            ),
          ),
          centerTitle: true,
        ),
        body: HomeScreen.tabs[HomeScreen.currentTabIndex],
        bottomNavigationBar: buildBottomNavigationBar(),
      ),
    );
  }

  Widget buildBottomNavigationBar() => Theme(
        data: ThemeData(canvasColor: ColorsGenerator.primary),
        child: BottomNavigationBar(
          currentIndex: HomeScreen.currentTabIndex,
          onTap: (index) {
            HomeScreen.currentTabIndex = index;
            setState(() {});
          },
          selectedItemColor: ColorsGenerator.accent,
          iconSize: 30,
          items: [
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppIcons.icQuran)), label: "Quran"),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppIcons.icAhadeth)),
                label: "Ahadeth"),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppIcons.icSebha)), label: "Sebha"),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppIcons.icRadio)), label: "Radio")
          ],
        ),
      );
}
