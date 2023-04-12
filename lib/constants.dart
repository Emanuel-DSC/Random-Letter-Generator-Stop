import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//colors 
Color kBgColor = const Color(0xFF1E1E1E);
Color kButtonColor = const Color(0xFF52515C);
Color kLetterColor = const Color.fromARGB(255, 187, 187, 187);
Color kResetColor = const Color(0xFF721B54);
Color kAlertDialogColor = const Color(0xFF371f33);
Color kDrawerColor = const Color.fromARGB(255, 32, 29, 36);
Color kCategoriesTileColor = const Color(0xFF5a3b58);

// dialog alert
String kUsedLettersText = 'Used letters: ';
String kAlertDialogTitle = 'Whoah!';
String kAlertDialogText =
    'You used every letter of the alphabet. I hope you had a good game';

//categories
String kCategoriesText1 = 'Men';
String kCategoriesText2 = 'women';
String kCategoriesText3 = 'brand';
String kCategoriesText4 = 'tv series / movies';
String kCategoriesText5 = 'occupation';
String kCategoriesText6 = 'fruit';
String kCategoriesText7 = 'food';
String kCategoriesText8 = 'objects';
String kCategoriesText9 = 'places';
String kCategoriesText10 = 'clothing';
String kCategoriesText11 = 'color';
String kCategoriesText12 = "body's part";
String kCategoriesText13 = "sport team";
String kCategoriesText14 = "singer / band";
String kCategoriesText15 = "flower";
String kCategoriesText16 = "character";
String kCategoriesText17 = "adjective";

// drawer 
String kDrawerHomeText = "Home";
String kDrawerCategoriesText = "Categories";
String kDrawerTimerText = "Timer";

//timer 
String kTimerText = "choose the countdown time";
String kTimerText2 = "(seconds)";


// Main text style
final myTextStyle = GoogleFonts.lato(
        fontSize: 22,
        color: kLetterColor,
        fontWeight: FontWeight.w500,
      ); 

// accent text style
  final mySelectedTextStyle = GoogleFonts.lato(
        fontSize: 22,
        color: kResetColor,
        fontWeight: FontWeight.w500,
      ); 