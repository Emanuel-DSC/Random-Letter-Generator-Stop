import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stop/screens/settings.dart';
import 'package:stop/widgets/alert_dialog/reset_dialog.dart';
import 'package:stop/widgets/animated_raffle.dart';
import 'package:stop/widgets/circle_button.dart';
import 'package:stop/constants.dart';
import 'package:stop/widgets/lato_text.dart';
import 'package:stop/widgets/alert_dialog/my_alert_dialog.dart';
import 'package:stop/widgets/my_timer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  static bool reset = false;
  static bool playAnimation = false;

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  final CountDownController _controller = CountDownController();
  bool isButtonEnabled = true;
  String letter = '';
  String supportLetter = '';
  List supportList = [];
  final supportListData = GetStorage();

  @override
  void initState() {
    super.initState();
    if (Settings.switchData.read('isSwitched') != null) {
      setState(() {
        Settings.isSwitched = Settings.switchData.read('isSwitched');
      });
    }
    if (supportListData.read('supportList') != null) {
      setState(() {
        supportList = Settings.switchData.read('supportList');
      });
    }
  }

  void shuffle() async {
    if (isButtonEnabled) {
      setState(() {
        isButtonEnabled = false;
        MyHomePage.playAnimation = true;
        if (Settings.isSwitched == false) {
          FlutterRingtonePlayer.play(
              fromAsset: "assets/raffleSound2.mp3", volume: 1);
        }
        supportLetter = (list..shuffle()).first;
        supportList.add(supportLetter);
        supportListData.write('supportList', supportList);
        letter = supportLetter;
        list.remove(supportLetter);

        if (list.isEmpty) {
          showDialog(
            context: context,
            builder: (context) {
              return MyAlertDialog(onTap: () => Navigator.of(context).pop());
            },
          );
          setState(() {
            _controller.reset();
            isButtonEnabled = true;
            FlutterRingtonePlayer.stop();
            MyHomePage.playAnimation = false;
            letter = '';
            supportLetter = '';
            list.addAll(supportList);
            supportList = [];
            supportListData.write('supportList', supportList);
          });
        }
        waitAnimation();
      });
    }
  }

  void reset() {
    MyHomePage.reset = true;
    showDialog(
      context: context,
      builder: (context) {
        return ResetAlertDialog(
          onTap: () {
            Navigator.of(context).pop();
            if (MyHomePage.playAnimation) {
              _controller.reset();
            }
          },
          onTap2: () {
            setState(() {
              _controller.reset();
              isButtonEnabled = true;
              FlutterRingtonePlayer.stop();
              MyHomePage.playAnimation = false;
              letter = '';
              supportLetter = '';
              list.addAll(supportList);
              supportList = [];
              supportListData.write('supportList', supportList);
            });
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  void waitAnimation() async {
    _controller.pause();
    if (MyHomePage.playAnimation) {
      await Future.delayed(const Duration(seconds: 5));
      setState(() {
        MyHomePage.playAnimation = false;
        _controller.start();
        isButtonEnabled = true;

        if (MyHomePage.reset) {
          _controller.reset();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: LatoText(
                      size: 26,
                      text: AppLocalizations.of(context)!
                          .kUsedLettersText
                          .toUpperCase()),
                ),
                const SizedBox(height: 12),
                Visibility(
                  maintainState: true,
                  visible: MyHomePage.playAnimation ? false : true,
                  child: LatoText(
                      size: 22, text: supportList.toString().toUpperCase()),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Raffle(isVisible: MyHomePage.playAnimation),
                Visibility(
                    maintainState: true,
                    visible: MyHomePage.playAnimation ? false : true,
                    child: LatoText(size: 92, text: letter.toUpperCase())),
                const SizedBox(height: 50),
                MyTimer(controller: _controller),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Circle_Button(shuffle, kResetColor, FontAwesomeIcons.play),
                    const SizedBox(width: 10),
                    Circle_Button(
                        reset, kButtonColor, FontAwesomeIcons.trashCan),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
