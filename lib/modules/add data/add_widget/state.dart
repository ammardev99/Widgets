import 'package:flutter/material.dart';
import 'package:widgets/widgets/show_snack_bar.dart';

class AddWidgetState {
  TextEditingController widgetImage = TextEditingController();
  TextEditingController widgetTitle = TextEditingController();
  TextEditingController widgetCode = TextEditingController();
  addWidget() {
    debugPrint('\nWidget Added');
    debugPrint(widgetImage.toString());
    debugPrint(widgetTitle.text);
    debugPrint(widgetCode.text);
    showSnackBar('added', widgetTitle.text);
  }

  AddWidgetState() {
    ///Initialize variables
  }
}
