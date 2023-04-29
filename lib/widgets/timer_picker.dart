import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:stop/constants.dart';
import 'package:stop/screens/settings.dart';

class TimerPicker extends StatefulWidget {
  const TimerPicker({super.key});

  @override
  State<TimerPicker> createState() => _TimerPickerState();
}

class _TimerPickerState extends State<TimerPicker> {
  var minutes = 0;
  var seconds = 0;
  final minutesData = GetStorage();
  final secondsData = GetStorage();

  @override
  void initState() {
    super.initState();
    if (minutesData.read('minutes') != null) {
      setState(() {
        minutes = minutesData.read('minutes');
      });
    }
    if (secondsData.read('seconds') != null) {
      setState(() {
        seconds = secondsData.read('seconds');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NumberPicker(
                    minValue: 0,
                    maxValue: 5,
                    value: minutes,
                    zeroPad: true,
                    infiniteLoop: true,
                    itemWidth: 80,
                    itemHeight: 60,
                    onChanged: (value) {
                      setState(() {
                        minutes = value;
                        SettingsState.currentHorizontalIntValue =
                            (minutes * 60) + seconds;
                        minutesData.write('minutes', minutes);
                      });
                    },
                    textStyle:
                        const TextStyle(color: Colors.grey, fontSize: 20),
                    selectedTextStyle:
                        TextStyle(color: kResetColor, fontSize: 30),
                    decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                            color: kButtonColor,
                            width: 2,
                          ),
                          bottom: BorderSide(color: kButtonColor, width: 2)),
                    ),
                  ),
                  NumberPicker(
                    minValue: 0,
                    maxValue: 59,
                    value: seconds,
                    zeroPad: true,
                    infiniteLoop: true,
                    itemWidth: 80,
                    itemHeight: 60,
                    onChanged: (value) {
                      setState(() {
                        seconds = value;
                        SettingsState.currentHorizontalIntValue =
                            (minutes * 60) + seconds;
                        secondsData.write('seconds', seconds);
                      });
                    },
                    textStyle:
                        const TextStyle(color: Colors.grey, fontSize: 20),
                    selectedTextStyle:
                        TextStyle(color: kResetColor, fontSize: 30),
                    decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                            color: kButtonColor,
                            width: 2,
                          ),
                          bottom: BorderSide(color: kButtonColor, width: 2)),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
