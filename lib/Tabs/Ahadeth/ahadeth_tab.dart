import 'package:flutter/material.dart';
import '../../Model/details_args.dart';
import '../../Screens/details_screen.dart';
import '../../data/app_theme.dart';
import '../../data/colors.dart';
import '../../data/image_path.dart';

class AhadethTab extends StatelessWidget {
  static const Divider divider = Divider(
    thickness: 3,
    color: ColorsGenerator.primary,
  );
  // List<String> ahadethNames =
  //     List.generate(50, (index) => "الحديث رقم ${index + 1}");

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(flex: 3, child: Image.asset(ImagePath.ahadethScreenLogo)),
        divider,
        const Text(
          "Al-Ahadeth",
          style: AppTheme.quranTabTitleTextStyle,
        ),
        divider,
        Expanded(
          flex: 7,
          child: ListView.builder(
              itemCount: 50,
              itemBuilder: (_, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, DetailsScreen.routeName,
                            arguments: DetailsScreenArguments(
                                fileName: "h${index+1}.txt",
                                isQuran: false,
                                titleName: "الحديث رقم ${index+1}"));
                      },
                      child: Text(
                        "الحديث رقم ${index+1}",
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
