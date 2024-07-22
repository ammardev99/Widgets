import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets/utilities/color.dart';

Widget backPop([Color? color]) {
  return IconButton(
      onPressed: () {
        Get.back();
      },
      icon: Icon(
        Icons.keyboard_arrow_left,
        color: color ?? AppColors.black,
      ));
}
