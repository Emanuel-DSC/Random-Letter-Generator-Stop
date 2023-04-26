import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:stop/constants.dart';
import 'package:stop/screens/categories.dart';
import 'package:stop/screens/home.dart';
import 'package:stop/screens/settings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SideDrawer extends StatefulWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  List<ScreenHiddenDrawer> _pages = [];
  String name1 = kDrawerHomeText;
  String name2 = kDrawerSettingsText;
  String name3 = kDrawerCategoriesText;

  @override
  void initState() {
    super.initState();

    _pages = [
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              colorLineSelected: kResetColor,
              baseStyle: myTextStyle,
              name: name1,
              selectedStyle: myTextStyle),
          const MyHomePage()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              colorLineSelected: kResetColor,
              baseStyle: myTextStyle,
              name: name2,
              selectedStyle: myTextStyle),
          const Settings()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              colorLineSelected: kResetColor,
              baseStyle: myTextStyle,
              name: name3,
              selectedStyle: myTextStyle),
          const Categories()),
    ];

    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        name1 = AppLocalizations.of(context)!.kDrawerHomeText;
        name2 = AppLocalizations.of(context)!.kDrawerSettingsText;
        name3 = AppLocalizations.of(context)!.kDrawerCategoriesText;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      elevationAppBar: 0,
      backgroundColorAppBar: kBgColor,
      backgroundColorMenu: kDrawerColor,
      screens: _pages,
      initPositionSelected: 0,
      slidePercent: 40,
      contentCornerRadius: 30,
    );
  }
}
