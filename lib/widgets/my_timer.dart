import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stop/constants.dart';

class MyTimer extends StatelessWidget {
  const MyTimer({
    Key? key,
    required CountDownController controller,
  }) : _controller = controller, super(key: key);

  final CountDownController _controller;

  @override
  Widget build(BuildContext context) {
    return CircularCountDownTimer(
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
        onComplete: () {
          
        },
        );
  }
}
