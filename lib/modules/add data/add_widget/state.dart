import 'package:flutter/material.dart';
import 'package:widgets/widgets/show_snack_bar.dart';

class AddWidgetState {
  TextEditingController widgetImage = TextEditingController();
  TextEditingController widgetTitle = TextEditingController();
  TextEditingController widgetCode = TextEditingController();
  String? selectedTechonology;
  String? selectedCollection;

  addWidget() {

    debugPrint(selectedTechonology);
    debugPrint(selectedCollection);
    debugPrint(widgetImage.toString());
    debugPrint(widgetTitle.text);
    debugPrint(widgetCode.text);
    showSnackBar('added', widgetTitle.text);
  }

  AddWidgetState() {
    ///Initialize variables
  }
}
