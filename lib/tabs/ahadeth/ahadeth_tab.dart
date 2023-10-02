import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../Model/details_args.dart';
import '../../../Screens/details_screen.dart';
import '../../../data/image_path.dart';

class AhadethTab extends StatelessWidget {
  static const Divider divider = Divider();

  const AhadethTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(flex: 3, child: Image.asset(ImagePath.ahadethScreenLogo)),
        divider,
        Text(
          AppLocalizations.of(context)!.alAhadeth,
          style: Theme.of(context).textTheme.bodyMedium
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
                                fileName: "h${index + 1}.txt",
                                isQuran: false,
                                titleName:
                                    "${AppLocalizations.of(context)!.hadethNum}${index + 1}"));
                      },
                      child: Text(
                        "${AppLocalizations.of(context)!.hadethNum}${index + 1}",
                        style: Theme.of(context).textTheme.bodyMedium!
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
