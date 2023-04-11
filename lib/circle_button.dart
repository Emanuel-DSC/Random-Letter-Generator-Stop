import 'package:flutter/material.dart';

GestureDetector Circle_Button(onTap, color, text) {
  return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.all(30),
        decoration:
            BoxDecoration(color: color, shape: BoxShape.circle),
        child: Text(text, style: const TextStyle(color: Colors.white)),
      ));
}
