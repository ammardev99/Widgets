import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets/models/dummy.dart';
import 'package:widgets/utilities/color.dart';
import 'package:widgets/widgets/formating.dart';

Widget feedCard(BuildContext context, MyWidget widget, Color color,
    [widgetsInfo]) {
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
        padding: const EdgeInsets.only(
          right: 10,
          bottom: 10,
          left: 10,
        ),
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
              leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                foregroundImage: AssetImage(myTechonology[widget.id].icon),
              ),
              title: textSizeBold(widget.title, 14, true, AppColors.black),
              subtitle: customInfo('App Bar'),
              trailing: IconButton(
                  onPressed: () => showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return shareOption(context);
                        },
                      ),
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

AlertDialog shareOption(BuildContext context) {
  return AlertDialog(
      title: Center(child: customHeading('Options', AppColors.primary)),
      content: SingleChildScrollView(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          optionIcon(Icons.bookmark_add_outlined, 'Save',),
          optionIcon(Icons.copy, 'Image',),
          optionIcon(Icons.copy, 'Code',),
          optionIcon(Icons.share_outlined, 'Share',),
        ]),
      ));
}

Widget optionIcon(IconData icon, String label) {
  return Column(
    children: [
      IconButton(
      highlightColor: AppColors.splashColor,
      hoverColor: Colors.transparent,
          style: ButtonStyle(
            minimumSize: const WidgetStatePropertyAll(Size(50, 50)),
              backgroundColor: WidgetStatePropertyAll(
                  AppColors.splashColor.withOpacity(0.3))),
          onPressed: () {},
          icon: Icon(icon, size: 24, color: AppColors.primary)),
      sizeBox(5),
      customInfo(label, AppColors.black)
    ],
  );
}
