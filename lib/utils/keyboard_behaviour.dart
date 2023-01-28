import 'package:flutter/cupertino.dart';

class KeyboardBehaviour {
  static void keyboardDisappear(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }
}
