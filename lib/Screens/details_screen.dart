import 'package:assignment_five_flutter/Model/details_args.dart';
import 'package:assignment_five_flutter/data/app_theme.dart';
import 'package:assignment_five_flutter/data/image_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../data/colors.dart';

class DetailsScreen extends StatefulWidget {
  static const String routeName = "details_screen";

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late DetailsScreenArguments arguments;

  String fileContent = "";

  @override
  Widget build(BuildContext context) {
    arguments =
        ModalRoute.of(context)!.settings.arguments as DetailsScreenArguments;
    if (fileContent.isEmpty) readFile();
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(ImagePath.backGround))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ColorsGenerator.transparent,
          title: Text(
            arguments.titleName,
            style: const TextStyle(
              fontSize: 30,
              color: ColorsGenerator.black,
            ),
          ),
          centerTitle: true,
        ),
        body: fileContent.isEmpty
            ? const CircularProgressIndicator(
                color: ColorsGenerator.primary,
              )
            : Align(
                alignment: Alignment.center,
                child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: ColorsGenerator.ayatContainer,
                        borderRadius: BorderRadius.circular(20)),
                    height: MediaQuery.of(context).size.height * 0.8,
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: SingleChildScrollView(
                      child: Text(
                        fileContent,
                        style: AppTheme.ayatTextStyle,
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
