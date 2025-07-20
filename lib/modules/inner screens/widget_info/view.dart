import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets/models/dummy.dart';
import 'package:widgets/utilities/color.dart';
import 'package:widgets/widgets/back_icon_button.dart';
import 'package:widgets/widgets/copy_it.dart';
import 'package:widgets/widgets/formating.dart';
import 'package:widgets/widgets/show_snack_bar.dart';

import 'logic.dart';

class WidgetInfoPage extends StatelessWidget {
  WidgetInfoPage({super.key});

  final logic = Get.put(WidgetInfoLogic());
  final state = Get.find<WidgetInfoLogic>().state;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: backPop(),
            title: customHeading(widgets[Get.arguments].title),
            actions: [
              IconButton(onPressed: () {
                widgets[Get.arguments].favorite.value =
                    !widgets[Get.arguments].favorite.value;
              }, icon: Obx(() {
                return widgets[Get.arguments].favorite.value == true
                    ? const Icon(
                        Icons.bookmark,
                        color: AppColors.primary,
                      )
                    : const Icon(
                        Icons.bookmark_add_outlined,
                        color: AppColors.grey,
                      );
              })),
              sizeBox(5),
            ],
            bottom: const TabBar(
              indicatorColor: AppColors.primary,
              dividerColor: AppColors.grey,
              labelColor: AppColors.primary,
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
                Tab(
                  text: 'Info',
                  // icon: Icon(Icons.image),
                ),
                Tab(
                  text: 'Help',
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
                  image: AssetImage(widgets[Get.arguments].img),
                  fit: BoxFit.contain,
                ),
                SingleChildScrollView(
                    child: SelectableText(
                  widgets[Get.arguments].code,
                )),
                const Text("Code Description"),
                const Text("Community Messages"),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              copyIt(widgets[Get.arguments].code);
              showSnackBar("Copy", widgets[Get.arguments].title);
            },
            backgroundColor: AppColors.primary,
            child: const Icon(
              Icons.copy,
              size: 20,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
