// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:stop/screens/home.dart';
import 'package:stop/widgets/lato_text.dart';

class Raffle extends StatelessWidget {
  const Raffle({super.key});

  static bool isRaffled = false;

  @override
  Widget build(BuildContext context) {
    int duration = 200;

    return Scaffold(
      body: Center(
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
                                      Navigator.pushReplacement(
                                        context,
                                        PageRouteBuilder(
                                          pageBuilder: (context, animation1,
                                                  animation2) =>
                                              const MyHomePage(),
                                          transitionDuration: Duration.zero,
                                          reverseTransitionDuration:Duration.zero,
                                        ),
                                      );
                                      
                                    },
                                  ))))),
    );
  }
}
