import 'package:flutter/material.dart';
import '../Tabs/Ahadeth/ahadeth_tab.dart';
import '../Tabs/Quran/quran_tab.dart';
import '../Tabs/Radio/radio_tab.dart';
import '../Tabs/Sebha/sebha_tab.dart';
import '../Tabs/Settings/settings_tab.dart';
import '../data/colors.dart';
import '../data/icons.dart';
import '../data/image_path.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";
  static int currentTabIndex = 0;
  static List<Widget> tabs = [
    QuranTab(),
    AhadethTab(),
    SebhaTab(),
    RadioTab(),
    SettingTab()
  ];

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage(ImagePath.backGround),
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
                icon: ImageIcon(AssetImage(AppIcons.icRadio)), label: "Radio"),
            const BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Radio"),
          ],
        ),
      );
}
