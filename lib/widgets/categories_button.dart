// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stop/constants.dart';
import 'package:stop/screens/categories.dart';

GestureDetector CategoriesButton(BuildContext context) {
  return GestureDetector(
    onTap: () => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Categories()),
    ),
    child: Container(
      height: 65,
      width: 160,
      decoration: BoxDecoration(
        color: kButtonColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          kCategoriesButtonText.toUpperCase(),
          style: GoogleFonts.lato(
            fontSize: 24,
            color: kLetterColor,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    ),
  );
}
