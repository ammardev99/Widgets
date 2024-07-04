import 'package:flutter/material.dart';
import 'package:widgets/utilities/color.dart';
import 'package:widgets/widgets/formating.dart';

Widget nextButton(String label, action) {
  return Container(
    margin: const EdgeInsets.all(10),
    width: double.infinity,
    height: 50,
    child: ElevatedButton(
        onPressed: () => action,
        style: const ButtonStyle(
          elevation: WidgetStatePropertyAll(1),
          backgroundColor: WidgetStatePropertyAll(AppColors.primary),
        ),
        child: customHeading(label, AppColors.white)),
  );
}
