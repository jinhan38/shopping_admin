import 'package:flutter/material.dart';

class Button {
  static final outlineNormal = OutlinedButton.styleFrom(
    primary: Colors.orange,
    side: const BorderSide(width: 0, color: Colors.transparent),
  );
  static final outlineBorder1 = OutlinedButton.styleFrom(
    primary: Colors.orange,
    side: const BorderSide(width: 1, color: Colors.grey),
  );


  static MaterialStateProperty<Color> getColor(
      Color backgroundColor, Color colorPressed) {
    styleColor(Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return colorPressed;
      } else {
        return backgroundColor;
      }
    }
    return MaterialStateProperty.resolveWith(styleColor);
  }
}
