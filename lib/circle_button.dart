// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:stop/constants.dart';

GestureDetector Circle_Button(onTap, color, icon) {
  return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.all(30),
        decoration:
            BoxDecoration(color: color, shape: BoxShape.circle),
        child: Icon(icon, color: kLetterColor,),
      ));
}
