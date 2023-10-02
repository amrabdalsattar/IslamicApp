import 'package:assignment_five_flutter/Model/details_args.dart';
import 'package:assignment_five_flutter/data/image_path.dart';
import 'package:assignment_five_flutter/settings_provider/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../data/colors.dart';

class DetailsScreen extends StatefulWidget {
  static const String routeName = "details_screen";
  static late SettingsProvider provider;

  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late DetailsScreenArguments arguments;

  String fileContent = "";

  @override
  Widget build(BuildContext context) {
    DetailsScreen.provider = Provider.of(context);
    Color circularProgressColor =
        DetailsScreen.provider.currentMode == ThemeMode.light
            ? ColorsGenerator.primary
            : ColorsGenerator.accentDark;
    String backGround = DetailsScreen.provider.currentMode == ThemeMode.light
        ? ImagePath.backGround
        : ImagePath.darkBackGround;
    Color containerColor =
        (DetailsScreen.provider.currentMode == ThemeMode.light
            ? ColorsGenerator.whiteForContainer
            : ColorsGenerator.darkBlueForContainer);
    arguments =
        ModalRoute.of(context)!.settings.arguments as DetailsScreenArguments;
    if (fileContent.isEmpty) readFile();
    return Container(
      decoration:
          BoxDecoration(image: DecorationImage(image: AssetImage(backGround))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ColorsGenerator.transparent,
          title: Text(
            arguments.titleName,
            style: Theme.of(context).appBarTheme.titleTextStyle,
          ),
          centerTitle: true,
        ),
        body: fileContent.isEmpty
            ? Center(
                child: CircularProgressIndicator(
                  color: circularProgressColor,
                ),
              )
            : Align(
                alignment: Alignment.center,
                child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: containerColor,
                        borderRadius: BorderRadius.circular(20)),
                    height: MediaQuery.of(context).size.height * 0.8,
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: SingleChildScrollView(
                      child: Text(
                        fileContent,
                        style: Theme.of(context).textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                      ),
                    )),
              ),
      ),
    );
  }

  void readFile() async {
    String file = await rootBundle.loadString(arguments.isQuran
        ? "assets/files/quran/${arguments.fileName}"
        : "assets/files/ahadeth/${arguments.fileName}");
    if (arguments.isQuran) {
      List<String> fileLines = file.split("\n");
      for (int i = 0; i < fileLines.length; i++) {
        fileLines[i] += "(${i + 1})";
      }
      fileContent = fileLines.join();
    } else {
      fileContent = file;
    }
    setState(() {});
  }
}
