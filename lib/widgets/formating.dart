import 'package:flutter/material.dart';
import 'package:widgets/utilities/color.dart';

Widget sizeBox(double w, [double? h]) {
  return SizedBox(
    width: w,
    height: h ?? w,
  );
}

Widget customTitle(String text, [Color? color]) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: color ?? AppColors.black,
    ),
    textAlign: TextAlign.center,
  );
}

Widget customHeading(String text, [Color? color]) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: color ?? AppColors.black,
    ),
  );
}
Widget customText(String text, [Color? color]) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: color ?? AppColors.black,
    ),
  );
}

Widget customInfo(String text, [Color? color]) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: color ?? AppColors.grey,
    ),
    textAlign: TextAlign.justify,
  );
}



