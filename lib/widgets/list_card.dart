import 'package:flutter/cupertino.dart';
import 'package:stop/constants.dart';
import 'package:stop/widgets/lato_text.dart';

class ListCard extends StatelessWidget {
  final String text;

  const ListCard({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 80,
        width: double.infinity,
        decoration: BoxDecoration(
          color: kCategoriesTileColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(child: LatoText(size: 28, text: text.toUpperCase())),
      ),
    );
  }
}
