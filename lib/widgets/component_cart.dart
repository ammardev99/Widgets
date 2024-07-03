import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets/models/dummy.dart';
import 'package:widgets/utilities/color.dart';
import 'package:widgets/widgets/formating.dart';

Widget componentCard(MyWidget widget, [String? widgetsInfo]) {
  return // widget card
      Container(
    margin: const EdgeInsets.symmetric(vertical: 5),
    child: InkWell(
      splashColor: AppColors.splashColor,
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
            color: AppColors.light,
            border: Border.all(
              color: Colors.grey,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  title: customHeading(widget.title),
                  trailing: IconButton(
                    onPressed: () {
                      widget.favorite.value = !widget.favorite.value;
                      // ignore: avoid_print
                      print(widget.favorite);
                    },
                    icon: Obx((){
                      return widget.favorite.value == true
                        ? const Icon(
                            Icons.favorite,
                            color: AppColors.red,
                          )
                        : const Icon(Icons.favorite_border);
                    })
                  )),
              const Divider(),
              Image.asset(
                widget.img,
                fit: BoxFit.contain,
              ),
            ],
          )),
    ),
  );
}
