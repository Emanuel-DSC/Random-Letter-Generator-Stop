import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stop/circle_button.dart';
import 'package:stop/constants.dart';
import 'package:stop/lato_text.dart';
import 'package:stop/screens/topics.dart';
import 'package:stop/topics_button.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String letter = '';
  String supportLetter = '';
  List supportList = [];
  List list = [
    'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'x', 'w', 'y',
    'z'
  ];

  void shuffle() {
    setState(() {
      supportLetter = (list..shuffle()).first;
      supportList.add(supportLetter);
      letter = supportLetter;
      list.remove(supportLetter);

      if (list.isEmpty) {
        letter = '';
        supportLetter = '';
        supportList = [];
        list = [
          'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'x', 'w', 'y', 'z'
        ];
      }
    });
  }

  void reset() {
    setState(() {
      letter = '';
      supportLetter = '';
      supportList = [];
      list = [
        'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'x', 'w', 'y', 'z'
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
               LatoText(size: 22, text: supportList.toString().toUpperCase()),
              SizedBox(height: MediaQuery.of(context).size.height * 0.2),
               LatoText(size: 64, text: letter.toUpperCase()),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Circle_Button(shuffle, kButtonColor, FontAwesomeIcons.shuffle),
                  const SizedBox(width: 10),
                  Circle_Button(reset, kResetColor,  FontAwesomeIcons.eraser),
                ],
              ),
              const SizedBox(height: 15),
              TopicsButton(context),
            ],
          ),
        ),
      ),
    );
  }
}

