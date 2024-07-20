import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF5290F0);
  static Color light = AppColors.primary.withOpacity(0.03);
  static const Color splashColor = Color(0xFFB9D5FF);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF374151);
  static const Color grey = Color(0xFFB2B2B2);
  static const Color red = Color(0xFFFF0000);
}



  // Function to convert hex string to Color
  Color hexToColor(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return Color(int.parse(hexColor, radix: 16));
  }
