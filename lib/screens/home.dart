import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
  void _incrementCounter() {
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
                supportList.toString(),
                style: Theme.of(context).textTheme.headline4,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.3),
              Text(
                letter.toUpperCase(),
                style: GoogleFonts.anton(
                  fontSize: 64,
                ),
              ),
              GestureDetector(
                  onTap: () {
                    reset();
                  },
                  child: Container(
                    padding:  const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                    color: Colors.red,
                    child:  
                       Text("Reset", style: TextStyle(color: Colors.white)),
                  )),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
