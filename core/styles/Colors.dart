import 'package:flutter/material.dart';

Color bgColor = Color(0xFF292929);
Color whiteColor = Color(0xFFF9F9F9);
Color grayColor = Color(0xFF404040);
Color lightGray = Color(0xFFADADAD);
Color primaryColor = Color(0xFF2B2B2B);
Color orangeColor = Color(0xFFFE5C39);

class ColorsButton {
  static Color enable = Color(0xFFFE5C39);
  static Color disable = Color(0xFF404040);
  static Color outline = whiteColor;
  static Color disOutline = lightGray;
  
}

class ColorsTextField {
  static Color bgColor = grayColor;
  static Color fgColor = lightGray;
  static Color text = bgColor;
}

class TextColors {
  static Color textPrimary = Color(0xFFF9F9F9);
  static Color textSecond = lightGray;
}

class CardColors {
  static Color red = Color(0xFFD54639);
  static Color green = Color(0xFF367059);
}

class TabColors {
  static Color selected = Color(0xFFFE5C39);
  static Color unselected = Color(0xFF292929);
}

class BarColors {
  static Color selected = whiteColor;
  static Color unselected = whiteColor.withOpacity(.5);
  static Color bgColor = grayColor;
}
