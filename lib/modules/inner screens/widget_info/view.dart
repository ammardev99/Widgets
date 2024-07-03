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
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: backPop(),
          title: customHeading(collection[Get.arguments].title),
          actions: [
            IconButton(onPressed: () {
              collection[Get.arguments].favorite.value =
                  !collection[Get.arguments].favorite.value;
            }, icon: Obx(() {
              return collection[Get.arguments].favorite.value == true
                  ? const Icon(
                      Icons.favorite,
                      color: AppColors.red,
                    )
                  : const Icon(Icons.favorite_border);
            })),
            sizeBox(5),
          ],
          bottom: const TabBar(
            indicatorColor: AppColors.primary,
            dividerColor: AppColors.grey,
            labelColor: AppColors.primary,
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
              SingleChildScrollView(
                  child: customInfo(collection[Get.arguments].code.toString())),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            copyIt(collection[Get.arguments].code);
            showSnackBar("Copy", collection[Get.arguments].title);
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
