import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stop/constants.dart';
import 'package:stop/widgets/lato_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:stop/widgets/timer_picker.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  static bool isSwitched = false;
  static final switchData = GetStorage();

  @override
  State<Settings> createState() => SettingsState();
}

class SettingsState extends State<Settings> {
  static int currentTime = 0;

  @override
  void initState() {
    super.initState();
    if (Settings.switchData.read('isSwitched') != null) {
      setState(() {
        Settings.isSwitched = Settings.switchData.read('isSwitched');
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LatoText(
                size: 26,
                text:
                    AppLocalizations.of(context)!.kSettingsText.toUpperCase()),
            const SizedBox(height: 22),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LatoText(
                    size: 18,
                    text: AppLocalizations.of(context)!.swipe.toUpperCase()),
                const SizedBox(width: 15),
                Icon(
                  (FontAwesomeIcons.arrowDownLong),
                  color: kLetterColor,
                ),
              ],
            ),
            const SizedBox(height: 30),
            const SizedBox(
              height: 200,
              child: TimerPicker(),
            ),
            const SizedBox(height: 50),
            LatoText(
                size: 22,
                text:
                    AppLocalizations.of(context)!.kSettingsText3.toUpperCase()),
            const SizedBox(height: 5),
            Switch(
              activeColor: kResetColor,
              inactiveTrackColor: kButtonColor,
              value: Settings.isSwitched,
              onChanged: (value) {
                if (mounted) {
                  setState(() {
                    Settings.isSwitched = value;
                    Settings.switchData
                        .write('isSwitched', Settings.isSwitched);
                  });
                }
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ),
      ),
    );
  }
}
