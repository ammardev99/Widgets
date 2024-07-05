import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

Widget textSizeBold(String text, double size, bool bold, [Color? color]) {
  return Text(
    text,
    style: TextStyle(
      fontSize: size,
      fontWeight: bold? FontWeight.bold : FontWeight.w500,
      color: color ?? AppColors.grey,
    ),
    textAlign: TextAlign.justify,
  );
}

Widget actionText(String text, String actionText, String page) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      customText(text),
      sizeBox(5),
      GestureDetector(
          onTap: () => Get.toNamed(page),
          child: customInfo(actionText, AppColors.primary)),
    ],
  );
}
