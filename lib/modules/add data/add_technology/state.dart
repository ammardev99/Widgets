import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets/utilities/color.dart';

class AddTechnologyState {
  TextEditingController techonologyTitle = TextEditingController();
  TextEditingController techonologyColor = TextEditingController();
  RxString technologyIcon = ''.obs;
  var themeColor = AppColors.primary.obs;

  printtechnology() {
    debugPrint(techonologyTitle.text);
    debugPrint(techonologyColor.text);
  }

  AddTechnologyState() {
    ///Initialize variables
  }
}
