import 'package:assignment_five_flutter/data/app_theme.dart';
import 'package:assignment_five_flutter/settings_provider/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'Screens/details_screen.dart';
import 'Screens/home_screen.dart';

class MyApp extends StatelessWidget {
  static int currentTabIndex = 0;
  late SettingsProvider provider;

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        supportedLocales: const [Locale("en"), Locale("ar")],
        locale: Locale(provider.currentLocale),
        themeMode: provider.currentMode,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        routes: {
          HomeScreen.routeName: (_) => HomeScreen(),
          DetailsScreen.routeName: (_) => const DetailsScreen()
        },
        debugShowCheckedModeBanner: false,
        home: HomeScreen());
  }
}
