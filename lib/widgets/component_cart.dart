import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets/utilities/color.dart';
import 'package:widgets/widgets/formating.dart';

Widget componentCard(String title, bool favorite, [String? widgetsInfo]) {
  return // widget card
      Container(
    margin: const EdgeInsets.symmetric(vertical: 3),
    child: InkWell(
      onTap: () {
        if (widgetsInfo != null) {
          Get.toNamed(widgetsInfo);
        }
      },
      borderRadius: BorderRadius.circular(10),
      child: Container(
          padding: const EdgeInsets.only(right: 10, bottom: 10, left: 10),
          width: 340,
          decoration: BoxDecoration(
            color: const Color(0xFFE9F2FF).withOpacity(0.3),
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
                  title: customHeading(title),
                  trailing: IconButton(
                    onPressed: () {
                      favorite = !favorite;
                      // ignore: avoid_print
                      print(favorite);
                    },
                    icon: favorite == true
                        ? const Icon(
                            Icons.favorite,
                            color: AppColors.red,
                          )
                        : const Icon(Icons.favorite_border),
                  )),
              const Divider(),
              Image.asset(
                'assets/png/app_icon.png',
                fit: BoxFit.contain,
              ),
            ],
          )),
    ),
  );
}
