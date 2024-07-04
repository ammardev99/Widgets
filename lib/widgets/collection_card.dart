import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets/widgets/formating.dart';

// collection card
Widget collectionCard(String title, int count, int i, Color color,
    [String? componentsPage]) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 4),
    child: InkWell(
      splashColor: color.withOpacity(0.3),
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
            color: color.withOpacity(0.1),
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
