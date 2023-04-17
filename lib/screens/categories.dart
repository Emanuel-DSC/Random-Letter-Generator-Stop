import 'package:flutter/material.dart';
import 'package:stop/constants.dart';
import 'package:stop/widgets/list_card.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          
          children: [ListCard(text: kCategoriesText1), 
          ListCard(text: kCategoriesText2), ListCard(text: kCategoriesText3), 
          ListCard(text: kCategoriesText4), ListCard(text: kCategoriesText5), 
          ListCard(text: kCategoriesText6), ListCard(text: kCategoriesText7), 
          ListCard(text: kCategoriesText8), ListCard(text: kCategoriesText9), 
          ListCard(text: kCategoriesText10), ListCard(text: kCategoriesText11),
          ListCard(text: kCategoriesText12), ListCard(text: kCategoriesText13),
          ListCard(text: kCategoriesText14), ListCard(text: kCategoriesText15),
          ListCard(text: kCategoriesText16), ListCard(text: kCategoriesText17)],
        ),
      ),
    );
  }
}
