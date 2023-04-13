import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:stop/screens/drawer.dart';
import 'package:stop/widgets/animated_raffle.dart';

void main() {
  runApp(const MyApp());
  Animate.restartOnHotReload = true;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: SideDrawer(),
    );
  }
}
