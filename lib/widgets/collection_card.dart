import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets/utilities/color.dart';
import 'package:widgets/widgets/formating.dart';

// collection card
Widget collectionCard(String title, int count, int i,
    [String? componentsPage]) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 4),
    child: InkWell(
      splashColor: AppColors.splashColor,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: () {
        if (componentsPage != null) {
          Get.toNamed(componentsPage, arguments: i);
        }
      },
      borderRadius: BorderRadius.circular(5),
      child: Container(
          decoration: BoxDecoration(
            color: AppColors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
              child: ListTile(
            title: customHeading(title),
            subtitle: customInfo('$count\tComponents'),
          ))),
    ),
  );
}
