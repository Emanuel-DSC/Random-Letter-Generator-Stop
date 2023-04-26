import 'package:flutter/material.dart';
import 'package:stop/constants.dart';
import 'package:stop/widgets/list_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          
          children: [ListCard(text: AppLocalizations.of(context)!.kCategoriesText1.toUpperCase()), 
          ListCard(text: AppLocalizations.of(context)!.kCategoriesText2.toUpperCase()), ListCard(text: AppLocalizations.of(context)!.kCategoriesText3.toUpperCase()), 
          ListCard(text: AppLocalizations.of(context)!.kCategoriesText4.toUpperCase()), ListCard(text: AppLocalizations.of(context)!.kCategoriesText5.toUpperCase()), 
          ListCard(text: AppLocalizations.of(context)!.kCategoriesText6.toUpperCase()), ListCard(text: AppLocalizations.of(context)!.kCategoriesText7.toUpperCase()), 
          ListCard(text: AppLocalizations.of(context)!.kCategoriesText8.toUpperCase()), ListCard(text: AppLocalizations.of(context)!.kCategoriesText9.toUpperCase()), 
          ListCard(text: AppLocalizations.of(context)!.kCategoriesText10.toUpperCase()), ListCard(text: AppLocalizations.of(context)!.kCategoriesText11.toUpperCase()),
          ListCard(text: AppLocalizations.of(context)!.kCategoriesText12.toUpperCase()), ListCard(text: AppLocalizations.of(context)!.kCategoriesText13.toUpperCase()),
          ListCard(text: AppLocalizations.of(context)!.kCategoriesText14.toUpperCase()), ListCard(text: AppLocalizations.of(context)!.kCategoriesText15.toUpperCase()),
          ListCard(text: AppLocalizations.of(context)!.kCategoriesText16.toUpperCase()), ListCard(text: AppLocalizations.of(context)!.kCategoriesText17.toUpperCase())],
        ),
      ),
    );
  }
}
