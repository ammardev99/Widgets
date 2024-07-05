import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets/models/dummy.dart';
import 'package:widgets/utilities/color.dart';
import 'package:widgets/widgets/formating.dart';

Widget feedCard(MyWidget widget, Color color, [widgetsInfo]) {
  return InkWell(
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
        padding: const EdgeInsets.only(right: 10, bottom: 10, left: 10, ),
        decoration: BoxDecoration(
          color: AppColors.light,
          border: Border.all(
            color: AppColors.grey.withOpacity(0.1),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              leading:  CircleAvatar(
                backgroundColor: Colors.transparent,
                foregroundImage:
                    AssetImage(myTechonology[widget.id].icon),
              ),
              title: textSizeBold(widget.title, 14, true, AppColors.black),
              subtitle: customInfo('App Bar'),
              trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert,
                    color: AppColors.grey,
                  )),
            ),
            Container(
              width: double.infinity,
              color: AppColors.grey,
              child: Image.asset(
                widget.img,
                fit: BoxFit.contain,
              ),
            ),
          ],
        )),
  );
}
