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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _pages = [
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              colorLineSelected: kResetColor,
              baseStyle: myTextStyle,
              name: AppLocalizations.of(context)!.kDrawerHomeText,
              selectedStyle: myTextStyle),
          const MyHomePage()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              colorLineSelected: kResetColor,
              baseStyle: myTextStyle,
              name: AppLocalizations.of(context)!.kDrawerSettingsText,
              selectedStyle: myTextStyle),
          const Settings()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              colorLineSelected: kResetColor,
              baseStyle: myTextStyle,
              name: AppLocalizations.of(context)!.kDrawerCategoriesText,
              selectedStyle: myTextStyle),
          const Categories()),
    ];

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
