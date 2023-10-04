import 'package:assignment_five_flutter/Model/details_args.dart';
import 'package:assignment_five_flutter/Screens/details_screen.dart';
import 'package:assignment_five_flutter/data/colors.dart';
import 'package:assignment_five_flutter/data/image_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../data/constants.dart';

class QuranTab extends StatelessWidget {
  static const Divider divider = Divider();

  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(flex: 3, child: Image.asset(ImagePath.quranScreenLogo)),
        divider,
        Text(
          AppLocalizations.of(context)!.suraName,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        divider,
        Expanded(
          flex: 7,
          child: ListView.builder(
              itemCount: Constants.suraNames.length,
              itemBuilder: (_, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, DetailsScreen.routeName,
                            arguments: DetailsScreenArguments(
                                fileName: "${index + 1}.txt",
                                isQuran: true,
                                titleName: Constants.suraNames[index]));
                      },
                      style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all(ColorsGenerator.buttonOverLay),
                      ),
                      child: Text(
                        Constants.suraNames[index],
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontWeight: FontWeight.normal),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                      color: Color.fromARGB(103, 158, 158, 158),
                    )
                  ],
                );
              }),
        )
      ],
    );
  }
}
