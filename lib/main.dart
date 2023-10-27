import 'package:assignment_five_flutter/settings_provider/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var provider = SettingsProvider();
  await provider.loadSettingConfig();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(ChangeNotifierProvider(create: (_) => provider, child: MyApp()));
  });
}
