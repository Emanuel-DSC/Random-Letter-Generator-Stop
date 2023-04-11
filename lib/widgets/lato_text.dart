
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stop/constants.dart';

class LatoText extends StatelessWidget {
  final double size;
  final String text;
  const LatoText({
    Key? key, 
    required this.size,
    required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
        fontSize: size,
        color: kLetterColor,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}