import 'package:assignment_five_flutter/Model/details_args.dart';
import 'package:assignment_five_flutter/Screens/details_screen.dart';
import 'package:assignment_five_flutter/data/app_theme.dart';
import 'package:assignment_five_flutter/data/colors.dart';
import 'package:assignment_five_flutter/data/image_path.dart';
import 'package:flutter/material.dart';
import '../../data/constants.dart';

class QuranTab extends StatelessWidget {
  static const Divider divider = Divider(
    thickness: 3,
    color: ColorsGenerator.primary,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(flex: 3, child: Image.asset(ImagePath.quranScreenLogo)),
        divider,
        const Text(
          "Sura Name",
          style: AppTheme.quranTabTitleTextStyle,
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
                                fileName: "${index+1}.txt",
                                isQuran: true,
                                titleName: Constants.suraNames[index]));
                      },
                      child: Text(
                        Constants.suraNames[index],
                        style: AppTheme.quranTabTitleTextStyle
                            .copyWith(fontWeight: FontWeight.normal),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                    )
                  ],
                );
              }),
        )
      ],
    );
  }
}
