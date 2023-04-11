// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stop/constants.dart';
import 'package:stop/screens/topics.dart';

 GestureDetector TopicsButton(BuildContext context) {
    return GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Topics()),
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
                    'Topics'.toUpperCase(),
                    style: GoogleFonts.lato(
                      fontSize: 28,
                      color: kLetterColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            );
  }