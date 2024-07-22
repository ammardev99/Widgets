import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets/models/dummy.dart';
import 'package:widgets/utilities/color.dart';
import 'package:widgets/widgets/formating.dart';

Widget componentCard(MyWidget widget, Color color, [String? widgetsInfo]) {
  return // widget card
      Container(
    margin: const EdgeInsets.symmetric(vertical: 5),
    child: InkWell(
      splashColor: color.withOpacity(0.3),
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: () {
        if (widgetsInfo != null) {
          Get.toNamed(widgetsInfo, arguments: widget.id);
        }
      },
      borderRadius: BorderRadius.circular(10),
      child: Container(
          padding: const EdgeInsets.only(right: 10, bottom: 10, left: 10),
          width: 340,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              ListTile(
                contentPadding: const EdgeInsets.all(0),
                title: customHeading(widget.title),
                trailing: IconButton(onPressed: () {
                  widget.favorite.value = !widget.favorite.value;
                }, icon: Obx(() {
                  return widget.favorite.value == true
                      ? Icon(
                          Icons.bookmark,
                          color: color,
                        )
                      : const Icon(
                          Icons.bookmark_add_outlined,
                          color: AppColors.grey,
                        );
                })),
              ),
              Image.asset(
                widget.img,
                fit: BoxFit.contain,
              ),
            ],
          )),
    ),
  );
}

//
Widget showWidgetCard(
  String title,
  String img,
  String code,
  String description,
) {
  return // widget card
      Container(
    margin: const EdgeInsets.symmetric(vertical: 5),
    child: InkWell(
      // splashColor: color.withOpacity(0.3),
      splashColor: AppColors.splashColor,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      // onTap: () {
      //   if (widgetsInfo != null) {
      //     Get.toNamed(widgetsInfo, arguments: widget.id);
      //   }
      // },
      borderRadius: BorderRadius.circular(10),
      child: Container(
          padding: const EdgeInsets.only(right: 10, bottom: 10, left: 10),
          width: 340,
          decoration: BoxDecoration(
            // color: color.withOpacity(0.1),
            color: AppColors.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              ListTile(
                contentPadding: const EdgeInsets.all(0),
                title: customHeading(title),
                // trailing: IconButton(onPressed: () {
                //   widget.favorite.value = !widget.favorite.value;
                // }, icon: Obx(() {
                //   return widget.favorite.value == true
                //       ? Icon(
                //           Icons.bookmark,
                //           color: color,
                //         )
                //       : const Icon(
                //           Icons.bookmark_add_outlined,
                //           color: AppColors.grey,
                //         );
                // })),
              ),
              Image.network(
                img,
                fit: BoxFit.contain,
              ),
            ],
          )),
    ),
  );
}
