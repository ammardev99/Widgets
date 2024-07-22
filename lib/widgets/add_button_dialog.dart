import 'package:flutter/material.dart';
import 'package:widgets/utilities/color.dart';
import 'package:widgets/widgets/show_page_dialog.dart';

Widget addButtonDialog(BuildContext context, page) {
  return GestureDetector(
    onTap: () {
      showPageDialog(context, page);
    },
    child: Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
          // color: AppColors.grey.withOpacity(0.6),
          color: AppColors.primary,
          // border: Border.all(width: 1),
          borderRadius: BorderRadius.circular(5)),
      child: const Center(
          child: Icon(
        Icons.add,
        color: AppColors.white,
      )),
    ),
  );
}
