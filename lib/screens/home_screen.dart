import 'package:assignment_five_flutter/settings_provider/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../data/icons.dart';
import '../../data/image_path.dart';
import '../Tabs/Ahadeth/ahadeth_tab.dart';
import '../Tabs/Quran/quran_tab.dart';
import '../Tabs/Sebha/sebha_tab.dart';
import '../Tabs/Settings/settings_tab.dart';

class HomeScreen extends StatefulWidget {
  static late SettingsProvider provider;
  static const String routeName = "home";
  static int currentTabIndex = 0;

  static List<Widget> tabs = [
    const QuranTab(),
    const AhadethTab(),
    SebhaTab(),
    const SettingTab()
  ];

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    HomeScreen.provider = Provider.of(context);
    String backGround = HomeScreen.provider.currentMode == ThemeMode.light
        ? ImagePath.backGround
        : ImagePath.darkBackGround;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(backGround),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.islami,
          ),
        ),
        body: HomeScreen.tabs[HomeScreen.currentTabIndex],
        bottomNavigationBar: buildBottomNavigationBar(),
      ),
    );
  }

  Widget buildBottomNavigationBar() => Theme(
        data: ThemeData(
            canvasColor:
                Theme.of(context).bottomNavigationBarTheme.backgroundColor),
        child: BottomNavigationBar(
          currentIndex: HomeScreen.currentTabIndex,
          onTap: (index) {
            HomeScreen.currentTabIndex = index;
            setState(() {});
          },
          selectedItemColor:
              Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
          iconSize: 30,
          items: [
            BottomNavigationBarItem(
                icon: const ImageIcon(AssetImage(AppIcons.icQuran)),
                label: AppLocalizations.of(context)!.quran),
            BottomNavigationBarItem(
                icon: const ImageIcon(AssetImage(AppIcons.icAhadeth)),
                label: AppLocalizations.of(context)!.alAhadeth),
            BottomNavigationBarItem(
                icon: const ImageIcon(AssetImage(AppIcons.icSebha)),
                label: AppLocalizations.of(context)!.sebha),
            BottomNavigationBarItem(
                icon: const Icon(Icons.settings),
                label: AppLocalizations.of(context)!.settings),
          ],
        ),
      );
}
