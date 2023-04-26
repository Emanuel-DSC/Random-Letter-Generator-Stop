import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stop/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


// ignore: must_be_immutable
class ResetAlertDialog extends StatelessWidget {
  VoidCallback onTap; 
  VoidCallback onTap2; 

  ResetAlertDialog({
    Key? key,
    required this.onTap,
    required this.onTap2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(AppLocalizations.of(context)!.kAlertDialogTitleReset.toUpperCase(),
          style: GoogleFonts.lato(
              color: Colors.white, fontWeight: FontWeight.bold)),
      content: Text(AppLocalizations.of(context)!.kAlertDialogTextReset, style: GoogleFonts.lato(color: Colors.white)),
      actions: [
        TextButton(
          onPressed: onTap,
          child: Text(AppLocalizations.of(context)!.cancel.toUpperCase(),
              style: GoogleFonts.lato(color: Colors.white)),
        ),
        TextButton(
          onPressed: onTap2,
          child: Text(AppLocalizations.of(context)!.confirm.toUpperCase(),
              style: GoogleFonts.lato(color: Colors.white)),
        ),
      ],
      elevation: 10,
      backgroundColor: kAlertDialogColor,
    );
  }
}