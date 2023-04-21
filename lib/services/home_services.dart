// // import 'package:flutter/material.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
// import 'package:stop/screens/home.dart';
// import 'package:stop/widgets/alert_dialog/my_alert_dialog.dart';
// import 'package:stop/widgets/my_timer.dart';

// class AnimationHelper {

//   static shuffle(Function setState, context, supportLetter, list, letter, supportList, controller) async {
//     if (MyHomePage.isButtonEnabled) {
//       setState(() async {
//         MyHomePage.isButtonEnabled = false;
//         MyHomePage.playAnimation = true;
//         FlutterRingtonePlayer.play(
//             fromAsset: "assets/raffleSound2.mp3", volume: MyTimer.vol);
//         supportLetter = (list..shuffle()).first;
//         supportList.add(supportLetter);
//         letter = supportLetter;
//         list.remove(supportLetter);

//         if (list.isEmpty) {
//           showDialog(
//             context: context,
//             builder: (context) {
//               return MyAlertDialog(onTap: () => Navigator.of(context).pop());
//             },
//           );
//           setState(() {
//             MyHomePage.playAnimation = false;
//             letter = '';
//             supportLetter = '';
//             supportList = [];
//             list = [
//               'a',
//               'b',
//               'c',
//               'd',
//               'e',
//               'f',
//               'g',
//               'h',
//               'i',
//               'j',
//               'k',
//               'l',
//               'm',
//               'n',
//               'o',
//               'p',
//               'q',
//               'r',
//               's',
//               't',
//               'u',
//               'v',
//               'x',
//               'w',
//               'y',
//               'z'
//             ];
//           });
//         }
        
//       controller.pause();
//     if (MyHomePage.playAnimation) {
//       await Future.delayed(const Duration(seconds: 5));
//       setState(() {
//         MyHomePage.playAnimation = false;
//         controller.start();
//         MyHomePage.isButtonEnabled = true;

//         if (MyHomePage.reset) {
//           controller.reset();
//         }
//       });
//     }
//         // waitAnimation();
//       });
//     }
//   }

// }
