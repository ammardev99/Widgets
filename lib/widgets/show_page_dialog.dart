import 'package:flutter/material.dart';

void showPageDialog(BuildContext context, page) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return page;
    },
  );
}
