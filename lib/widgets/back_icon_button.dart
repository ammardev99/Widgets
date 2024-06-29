import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget backPop() {
  return IconButton(
      onPressed: () {
        Get.back();
      },
      icon: const Icon(
        Icons.keyboard_arrow_left,
      ));
}
