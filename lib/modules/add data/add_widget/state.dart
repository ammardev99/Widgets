import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddWidgetState {
  RxString widgetImg = ''.obs;
  TextEditingController widgetImage = TextEditingController();
  TextEditingController widgetTitle = TextEditingController();
  TextEditingController widgetCode = TextEditingController();
  TextEditingController widgetDescription = TextEditingController();
  String selectedTechonology = '';
  String? selectedCollection;

  AddWidgetState() {
    ///Initialize variables
  }
}
