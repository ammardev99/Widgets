import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets/utilities/color.dart';
import 'package:widgets/widgets/formating.dart';

// Option card
Widget optionCard(IconData icon, String label, [String? page]) {
  return InkWell(
    onTap: () {
      if (page != null) {
        Get.toNamed(page);
      }
    },
    splashColor: AppColors.primaryLight,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,
    borderRadius: BorderRadius.circular(5),
    child: Container(
        margin: const EdgeInsets.symmetric(vertical: 3),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: 340,
        decoration: BoxDecoration(
          color: AppColors.primaryLight,
          borderRadius: BorderRadius.circular(5),
        ),
        child: ListTile(
            leading: Icon(
              icon,
              color: AppColors.black.withOpacity(0.6),
            ),
            contentPadding: const EdgeInsets.all(0),
            title: customHeading(label, AppColors.black.withOpacity(0.8)))),
  );
}
