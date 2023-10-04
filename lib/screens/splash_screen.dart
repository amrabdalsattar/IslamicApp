import 'package:assignment_five_flutter/Screens/home_screen.dart';
import 'package:assignment_five_flutter/data/image_path.dart';
import 'package:assignment_five_flutter/settings_provider/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "splash";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  late SettingsProvider provider;
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5)).then((value) => {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName)
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.bottom
    ]);
    provider = Provider.of(context);
    return Image.asset(provider.currentMode == ThemeMode.light
        ? ImagePath.splashScreen
        : ImagePath.darkSplashScreen);
  }
}
