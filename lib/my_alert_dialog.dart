import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stop/constants.dart';

// ignore: must_be_immutable
class MyAlertDialog extends StatelessWidget {
  VoidCallback onTap; 

  MyAlertDialog({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(kAlertDialogTitle.toUpperCase(),
          style: GoogleFonts.lato(
              color: Colors.white, fontWeight: FontWeight.bold)),
      content: Text(kAlertDialogText, style: GoogleFonts.lato(color: Colors.white)),
      actions: [
        TextButton(
          onPressed: onTap,
          child: Text('close'.toUpperCase(),
              style: GoogleFonts.lato(color: Colors.white)),
        ),
      ],
      elevation: 10,
      backgroundColor: kAlertDialogColor,
    );
  }
}