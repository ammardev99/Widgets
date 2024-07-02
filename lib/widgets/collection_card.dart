import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets/utilities/color.dart';
import 'package:widgets/widgets/formating.dart';

// collection card
Widget collectionCard(String title, int count, int i,
    [String? componentsPage]) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 3),
    child: InkWell(
      onTap: () {
        if (componentsPage != null) {
          Get.toNamed(componentsPage, arguments: i);
        }
      },
      splashColor: AppColors.primaryLight,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      borderRadius: BorderRadius.circular(5),
      child: Container(
          width: 340,
          decoration: BoxDecoration(
            color: AppColors.primaryLight,
            border: Border.all(
              color: AppColors.grey,
              width: 1,
            ),
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
