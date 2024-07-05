import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets/utilities/color.dart';
import 'package:widgets/widgets/formating.dart';
import 'package:widgets/widgets/show_page_dialog.dart';
import 'package:widgets/widgets/show_snack_bar.dart';

// Option card
Widget optionCard(IconData icon, String label, [String? page]) {
  return Container(
    margin: const EdgeInsets.all(5),
    child: InkWell(
      onTap: () {
        if (page != null) {
          if (page == '/login') {
            Get.offAllNamed(page);
            showSnackBar('Log out', 'succefully');
          } else {
            Get.toNamed(page);
          }
        }
      },
      splashColor: AppColors.splashColor,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      borderRadius: BorderRadius.circular(5),
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: AppColors.light,
            borderRadius: BorderRadius.circular(5),
          ),
          child: ListTile(
              leading: Icon(
                icon,
                color: AppColors.black.withOpacity(0.6),
              ),
              contentPadding: const EdgeInsets.all(0),
              title: customHeading(label, AppColors.black.withOpacity(0.8)))),
    ),
  );
}

Widget optionPageCard(IconData icon,String label,BuildContext context, page, ) {
  return Container(
    margin: const EdgeInsets.all(5),
    child: InkWell(
      onTap: () {
        showPageDialog(context, page);
      },
      splashColor: AppColors.splashColor,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      borderRadius: BorderRadius.circular(5),
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: AppColors.light,
            borderRadius: BorderRadius.circular(5),
          ),
          child: ListTile(
              leading: Icon(icon,
                color: AppColors.black.withOpacity(0.6),
              ),
              contentPadding: const EdgeInsets.all(0),
              title: customHeading(
                  label, AppColors.black.withOpacity(0.8)))),
    ),
  );
}
