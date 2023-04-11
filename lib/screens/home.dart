import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stop/circle_button.dart';
import 'package:stop/colors.dart';
import 'package:stop/screens/topics.dart';

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

  void _shuffle() {
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
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Letters used:',
              ),
              Text(
                supportList.toString().toUpperCase(),
                style: GoogleFonts.lato(
                  fontSize: 22,
                  color: kLetterColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.2),
              Text(
                letter.toUpperCase(),
                style: GoogleFonts.lato(
                  fontSize: 64,
                  color: kLetterColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Circle_Button(reset, kButtonColor, 'te'),
                  const SizedBox(width: 10),
                  Circle_Button(reset, kButtonColor, 'dsa'),
                ],
              ),
              const SizedBox(height: 15),
              GestureDetector(
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
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _shuffle,
        child: const Icon(Icons.add),
      ),
    );
  }
}
