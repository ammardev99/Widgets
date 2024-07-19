import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTechnologyState {
  TextEditingController techonologyTitle = TextEditingController();
  TextEditingController techonologyColor = TextEditingController();
  RxString technologyIcon = ''.obs;

  printtechnology() {
    debugPrint(techonologyTitle.text);
    debugPrint(techonologyColor.text);
  }

  AddTechnologyState() {
    ///Initialize variables
  }
}
