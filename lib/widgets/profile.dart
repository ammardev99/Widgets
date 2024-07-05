import 'package:flutter/material.dart';
import 'package:widgets/utilities/color.dart';
import 'package:widgets/widgets/formating.dart';

Widget profileCard(String img, String user, String email) {
  return InkWell(
    // onTap: () {},
    child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(color: AppColors.splashColor),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40,
              foregroundImage: AssetImage(img),
            ),
            sizeBox(15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customHeading(user),
                sizeBox(0, 5),
                customInfo(email, AppColors.black),
              ],
            )
          ],
        )),
  );
}
