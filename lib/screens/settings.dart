import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:stop/constants.dart';
import 'package:stop/widgets/lato_text.dart';
import 'package:stop/widgets/my_timer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => SettingsState();
}

class SettingsState extends State<Settings> {
  static int currentHorizontalIntValue = 60;
  bool isSwitched = false;
  final switchData = GetStorage();

  @override
  void initState() {
    super.initState();
    if (switchData.read('isSwitched') != null) {
      setState(() {
        isSwitched = switchData.read('isSwitched');
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: kBgColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          LatoText(size: 22, text:AppLocalizations.of(context)!.kSettingsText.toUpperCase()),
          const SizedBox(height: 5),
          LatoText(size: 22, text: AppLocalizations.of(context)!.kSettingsText2.toUpperCase()),
          const SizedBox(height: 30),
          NumberPicker(
            textStyle: myTextStyle,
            selectedTextStyle: mySelectedTextStyle,
            value: currentHorizontalIntValue,
            minValue: 30,
            maxValue: 300,
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
          const SizedBox(height: 50),
           LatoText(size: 22, text: AppLocalizations.of(context)!.kSettingsText3.toUpperCase()),
          const SizedBox(height: 5),
          Switch(
            activeColor: kResetColor,
            inactiveTrackColor: kButtonColor,
            value: isSwitched,
            onChanged: (value) {
              setState(() {
                isSwitched = value;
                switchData.write('isSwitched', isSwitched);
                if (isSwitched == false) {
                  MyTimer.vol = 1;
                } else {
                  MyTimer.vol = 0;
                }
              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ],
      ),
    );
  }
}