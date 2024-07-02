import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:widgets/models/dummy.dart';
import 'package:widgets/utilities/color.dart';
import 'package:widgets/widgets/back_icon_button.dart';
import 'package:widgets/widgets/formating.dart';

import 'logic.dart';

class WidgetInfoPage extends StatelessWidget {
  WidgetInfoPage({super.key});

  final logic = Get.put(WidgetInfoLogic());
  final state = Get.find<WidgetInfoLogic>().state;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: backPop(),
          title: customHeading(collection[Get.arguments].title),
          actions: [
            Obx(() {
              return IconButton(
                  onPressed: () => logic.changeFav(),
                  icon: logic.favoriteWidget.value == true
                      ? const Icon(Icons.favorite, color: AppColors.red)
                      : const Icon(Icons.favorite_border,
                          color: AppColors.grey));
            }),
            sizeBox(5),
          ],
          bottom: const TabBar(
            automaticIndicatorColorAdjustment: true,
            indicatorColor: AppColors.primary,
            dividerColor: AppColors.grey,
            physics: BouncingScrollPhysics(),
            tabs: [
              Tab(
                text: 'Image',
                // icon: Icon(Icons.image),
              ),
              Tab(
                text: 'Code',
                // icon: Icon(Icons.code),
              ),
            ],
          ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 1),
          child: TabBarView(
            physics: const BouncingScrollPhysics(),
            children: [
              Image(
                image: AssetImage(collection[Get.arguments].img),
                fit: BoxFit.contain,
              ),
              Center(
                child: SingleChildScrollView(
                    child:
                        customInfo(collection[Get.arguments].code.toString())),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Clipboard.setData(
                ClipboardData(text: collection[Get.arguments].code));
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  backgroundColor: AppColors.splashColor,
                  content: customInfo(
                      'Code copied to clipboard!', AppColors.primary)),
            );
          },
          backgroundColor: AppColors.primary,
          child: const Icon(
            Icons.copy,
            size: 20,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
