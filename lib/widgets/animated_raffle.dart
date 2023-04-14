// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:stop/screens/drawer.dart';
import 'package:stop/screens/home.dart';
import 'package:stop/widgets/lato_text.dart';

class Raffle extends StatefulWidget {
  bool isVisible;
  Raffle({super.key, required this.isVisible});

  @override
  State<Raffle> createState() => _RaffleState();
}

class _RaffleState extends State<Raffle> {
  @override
  Widget build(BuildContext context) {
    int duration = 200;

    return Visibility(
      visible: widget.isVisible,
      child: Center(
          child: const LatoText(size: 64, text: 'A').animate().swap(
              duration: duration.ms,
              builder: (_, __) => const LatoText(size: 64, text: 'B')
                  .animate()
                  .swap(
                      duration: duration.ms,
                      builder: (_, __) => const LatoText(size: 64, text: 'C')
                          .animate()
                          .swap(
                              duration: duration.ms,
                              builder: (_, __) =>
                                  const LatoText(size: 64, text: 'D').animate(
                                      delay: duration.ms,
                                      onComplete: (controller) {
                                        setState(() {
                                          widget.isVisible = false;
                                          print(MyHomePage.playAnimation);
                                        });
                                      }))))),
    );
  }
}
