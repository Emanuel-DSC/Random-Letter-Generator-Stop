import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stop/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


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
      title: Text(AppLocalizations.of(context)!.kAlertDialogTitle.toUpperCase(),
          style: GoogleFonts.lato(
              color: Colors.white, fontWeight: FontWeight.bold)),
      content: Text(AppLocalizations.of(context)!.kAlertDialogText, style: GoogleFonts.lato(color: Colors.white)),
      actions: [
        TextButton(
          onPressed: onTap,
          child: Text(AppLocalizations.of(context)!.close.toUpperCase(),
              style: GoogleFonts.lato(color: Colors.white)),
        ),
      ],
      elevation: 10,
      backgroundColor: kAlertDialogColor,
    );
  }
}