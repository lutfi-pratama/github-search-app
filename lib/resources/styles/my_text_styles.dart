import 'package:flutter/material.dart';

class MyTextStyles {
  static TextStyle headline1Text({Color color = Colors.black}) =>
      TextStyle(color: color, fontWeight: FontWeight.w600, fontSize: 34);
  static TextStyle headline2Text({Color color = Colors.black}) =>
      TextStyle(color: color, fontWeight: FontWeight.w500, fontSize: 24);

  static TextStyle body1Text({Color color = Colors.black}) => TextStyle(
      color: color, fontWeight: FontWeight.w400, fontSize: 12, height: 1.3);
  static TextStyle body2Text({Color color = Colors.black}) => TextStyle(
      color: color, fontWeight: FontWeight.w400, fontSize: 14, height: 1.3);

  static TextStyle menu1Text({Color color = Colors.black}) => TextStyle(
      color: color, fontWeight: FontWeight.w600, fontSize: 14, height: 1.3);
  static TextStyle menu2Text({Color color = Colors.black}) => TextStyle(
      color: color, fontWeight: FontWeight.w600, fontSize: 16, height: 1.3);
}
