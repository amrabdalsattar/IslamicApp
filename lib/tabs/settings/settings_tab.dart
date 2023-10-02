import 'package:assignment_five_flutter/data/colors.dart';
import 'package:assignment_five_flutter/settings_provider/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SettingTab extends StatelessWidget {
  static late SettingsProvider provider;
  static bool darkModeSwitch = false;
  static bool langSwitch = false;
  static int switcher = 0;

  const SettingTab({super.key});

  @override
  Widget build(BuildContext context) {
    SettingTab.provider = Provider.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.settings,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                buildRow(
                    "العربية",
                    langSwitch,
                    (switchLang) => {
                          SettingTab.langSwitch = switchLang,
                          if (langSwitch)
                            {provider.setCurrentLocale("ar")}
                          else
                            {provider.setCurrentLocale("en")},
                        },
                    context),
                buildRow(
                    AppLocalizations.of(context)!.darkMode,
                    darkModeSwitch,
                    (switchMode) => {
                          darkModeSwitch = switchMode,
                          if (darkModeSwitch == true)
                            {provider.setCurrentMode(ThemeMode.dark)}
                          else
                            {provider.setCurrentMode(ThemeMode.light)}
                        },
                    context),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildRow(String text, bool switchValue, Function(bool) onChanged,
      BuildContext context) {
    Color switchColor = SettingTab.provider.currentMode == ThemeMode.light
        ? ColorsGenerator.primary
        : ColorsGenerator.accentDark;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        Switch(
          value: switchValue,
          onChanged: onChanged,
          activeColor: switchColor,
        )
      ],
    );
  }
}
