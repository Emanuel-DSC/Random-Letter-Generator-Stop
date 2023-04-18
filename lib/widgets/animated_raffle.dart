// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:stop/constants.dart';
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
    int delay = 20;
    double end = - 250;

    return Visibility(
      visible: widget.isVisible,
      child: Stack(alignment: AlignmentDirectional.center,
        children: [
        Container(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(
              color: kAlertDialogColor,
              width: 3,
            ), 
            borderRadius: const BorderRadius.all(
            Radius.circular(10.0)),
          ),
        ),
        Center(
          child: const LatoText(size: 92, text: 'A')
              .animate(delay: 500.ms)
              .moveX(end: end)
              .fadeOut()
              .swap(
                  delay: delay.ms,
                  duration: duration.ms,
                  builder: (_, __) => const LatoText(size: 92, text: 'B')
                      .animate()
                      .moveX(begin: MediaQuery.of(context).size.width * 0.1, end: end)
                      .fadeOut()
                      .swap(
                          delay: delay.ms,
                          duration: duration.ms,
                          builder: (_, __) =>
                              const LatoText(size: 92, text: 'C')
                                  .animate()
                                  .moveX(begin: MediaQuery.of(context).size.width * 0.1, end: end)
                                  .fadeOut()
                                  .swap(
                                      delay: delay.ms,
                                      duration: duration.ms,
                                      builder: (_, __) => const LatoText(size: 92, text: 'D')
                                  .animate()
                                  .moveX(begin: MediaQuery.of(context).size.width * 0.1, end: end)
                                  .fadeOut()
                                  .swap(
                                      delay: delay.ms,
                                      duration: duration.ms,
                                      builder: (_, __) =>
                                      const LatoText(size: 92, text: 'E')
                                  .animate()
                                  .moveX(begin: MediaQuery.of(context).size.width * 0.1, end: end)
                                  .fadeOut()
                                  .swap(
                                      delay: delay.ms,
                                      duration: duration.ms,
                                      builder: (_, __) =>
                                      const LatoText(size: 92, text: 'F')
                                  .animate()
                                  .moveX(begin: MediaQuery.of(context).size.width * 0.1, end: end)
                                  .fadeOut()
                                  .swap(
                                      delay: delay.ms,
                                      duration: duration.ms,
                                      builder: (_, __) =>
                                          const LatoText(size: 92, text: '?')
                                              .animate(
                                                  delay: 4.seconds,
                                                  onComplete: (controller) {
                                                    setState(() {
                                                      widget.isVisible = false;
                                                    });
                                                  })))))))),
      ],)
    );
  }
}
