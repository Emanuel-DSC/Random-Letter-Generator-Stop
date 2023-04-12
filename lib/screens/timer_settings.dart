import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:stop/constants.dart';
import 'package:stop/widgets/lato_text.dart';

class TimerSettings extends StatefulWidget {
   const TimerSettings({super.key});
   
  @override
  State<TimerSettings> createState() => TimerSettingsState();
}

class TimerSettingsState extends State<TimerSettings> {
 // create TimeOfDay variable
  static int currentHorizontalIntValue = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          LatoText(size: 22, text: kTimerText.toUpperCase()),
          const SizedBox(height: 5),
          LatoText(size: 22, text: kTimerText2.toUpperCase()),
          const SizedBox(height: 30),
          NumberPicker(
            textStyle: myTextStyle,
            selectedTextStyle: mySelectedTextStyle,
            value: currentHorizontalIntValue,
            minValue: 0,
            maxValue: 180,
            step: 30,
            itemHeight: 100,
            axis: Axis.horizontal,
            onChanged: (value) =>
                setState(() => currentHorizontalIntValue = value),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: kButtonColor),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ],
      ),
    );
  }
}