import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets/utilities/color.dart';
import 'package:widgets/widgets/formating.dart';

void showSnackBar(String title, String message) {
  Get.snackbar(
    title,
    message,
    titleText: customHeading(title),
    messageText: customInfo(message),
    colorText: AppColors.black,
    backgroundColor: AppColors.light,
    snackPosition: SnackPosition.TOP,
    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.all(10),
    borderRadius: 10,
  );
}
