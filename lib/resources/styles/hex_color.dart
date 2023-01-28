import 'package:flutter/material.dart';

class HexColor extends Color {
  HexColor(String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    var tempHexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (tempHexColor.length == 6) {
      tempHexColor = 'FF$tempHexColor';
    }

    return int.parse(tempHexColor, radix: 16);
  }
}
