import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stop/widgets/circle_button.dart';
import 'package:stop/constants.dart';
import 'package:stop/widgets/lato_text.dart';
import 'package:stop/widgets/my_alert_dialog.dart';
import 'package:stop/widgets/categories_button.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final CountDownController _controller = CountDownController();
  String letter = '';
  String supportLetter = '';
  List supportList = [];
  List list = [
    'a',
    'b',
    'c',
    'd',
    'e',
    'f',
    'g',
    'h',
    'i',
    'j',
    'k',
    'l',
    'm',
    'n',
    'o',
    'p',
    'q',
    'r',
    's',
    't',
    'u',
    'v',
    'x',
    'w',
    'y',
    'z'
  ];

  void shuffle() {
    setState(() {
      supportLetter = (list..shuffle()).first;
      supportList.add(supportLetter);
      letter = supportLetter;
      list.remove(supportLetter);
      _controller.start();

      if (list.isEmpty) {
        showDialog(
          context: context,
          builder: (context) {
            return MyAlertDialog(onTap: () => Navigator.of(context).pop());
          },
        );

        letter = '';
        supportLetter = '';
        supportList = [];
        list = [
          'a',
          'b',
          'c',
          'd',
          'e',
          'f',
          'g',
          'h',
          'i',
          'j',
          'k',
          'l',
          'm',
          'n',
          'o',
          'p',
          'q',
          'r',
          's',
          't',
          'u',
          'v',
          'x',
          'w',
          'y',
          'z'
        ];
      }
    });
  }

  void reset() {
    setState(() {
      _controller.reset();
      letter = '';
      supportLetter = '';
      supportList = [];
      list = [
        'a',
        'b',
        'c',
        'd',
        'e',
        'f',
        'g',
        'h',
        'i',
        'j',
        'k',
        'l',
        'm',
        'n',
        'o',
        'p',
        'q',
        'r',
        's',
        't',
        'u',
        'v',
        'x',
        'w',
        'y',
        'z'
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              LatoText(size: 28, text: kUsedLettersText),
              const SizedBox(height: 12),
              Visibility(
                  visible: supportList.isEmpty ? false : true,
                  child: LatoText(
                      size: 22, text: supportList.toString().toUpperCase())),
              SizedBox(height: MediaQuery.of(context).size.height * 0.2),
              LatoText(size: 64, text: letter.toUpperCase()),
              const SizedBox(height: 50),
              CircularCountDownTimer(
                  autoStart: false,
                  isReverse: true,
                  controller: _controller,
                  width: 100,
                  height: 100,
                  duration: 30,
                  fillGradient: LinearGradient(colors: 
                  [Colors.red.shade700, Colors.white, Colors.white]),
                  fillColor: Colors.black, 
                  ringColor: kButtonColor,
                  strokeWidth: 2.5,
                  textStyle: 	GoogleFonts.lato(
                  fontSize: 24,
                  color: kLetterColor,
                  fontWeight: FontWeight.w700),
                  textFormat: CountdownTextFormat.MM_SS,
                  ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Circle_Button(
                      shuffle, kButtonColor, FontAwesomeIcons.shuffle),
                  const SizedBox(width: 10),
                  Circle_Button(reset, kResetColor, FontAwesomeIcons.eraser),
                ],
              ),
              const SizedBox(height: 15),
              CategoriesButton(context),
            ],
          ),
        ),
      ),
    );
  }
}
