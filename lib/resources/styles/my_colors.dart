import 'package:flutter/material.dart';

import './hex_color.dart';

class MyColors {
  static final HexColor darkPurple = HexColor('#411530');
  static final HexColor red10Color = HexColor('#D1512D');
  static final HexColor cream10Color = HexColor('#F5E8E4');
  static final HexColor cream20Color = HexColor('#F5C7A9');
  static List<Color> redOrangeGradient(bool isSelected) {
    return [
      HexColor('#DD2476').withOpacity(isSelected ? 1 : 0.7),
      HexColor('#FF512F').withOpacity(isSelected ? 1 : 0.7),
    ];
  }
}
