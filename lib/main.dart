import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stop/constants.dart';
import 'package:stop/screens/drawer.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
  Animate.restartOnHotReload = true;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(secondary: kResetColor),
        ),
      home: const SideDrawer(),
    );
  }
}
