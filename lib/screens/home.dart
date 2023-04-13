import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stop/widgets/animated_raffle.dart';
import 'package:stop/widgets/circle_button.dart';
import 'package:stop/constants.dart';
import 'package:stop/widgets/lato_text.dart';
import 'package:stop/widgets/my_alert_dialog.dart';
import 'package:stop/widgets/my_timer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  static bool reset = false;

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

  @override
  void initState() {
    super.initState();

    //if raffled, then starts automatically the countdown
    if(Raffle.isRaffled == true){
      WidgetsBinding.instance.addPostFrameCallback((_) => shuffle());
    } 
  }

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
      MyHomePage.reset = true;
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

  void startRaffle() {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const Raffle(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                LatoText(size: 28, text: kUsedLettersText),
                const SizedBox(height: 12),
                Visibility(
                    visible: supportList.isEmpty ? false : true,
                    child: LatoText(
                        size: 22, text: supportList.toString().toUpperCase())),
                SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                LatoText(size: 92, text: letter.toUpperCase()),
                const SizedBox(height: 50),
                MyTimer(controller: _controller),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Circle_Button(startRaffle, kButtonColor, FontAwesomeIcons.shuffle),
                    const SizedBox(width: 10),
                    Circle_Button(reset, kResetColor, FontAwesomeIcons.eraser),
                  ],
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
