import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    return Scaffold(
      appBar: AppBar(
        leading: backPop(),
        title: customHeading('Collection Name'),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_border,
                color: AppColors.grey,
              ))
        ],
      ),
      body: const SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ui view card
          ],
        ),
      ),
      floatingActionButton: IconButton(
        style: const ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(AppColors.primary),
        ),
        onPressed: () {},
        icon: const Icon(
          Icons.copy,
          size: 20,
          color: AppColors.white,
        ),
      ),
    );
  }
}
