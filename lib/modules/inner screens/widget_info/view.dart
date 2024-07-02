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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: backPop(),
          title: customHeading('Widget info'),
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.favorite_border)),
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
              const Center(
                  child: Image(
                    image: AssetImage('assets/png/app_icon.png'),
                    fit: BoxFit.contain,
                  )),
              Center(
                child: SingleChildScrollView(
                    child: customInfo(
                        "code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  code code code 122 12 21 code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  code code code 122 12 21 1231123 123123  1231123 123123  ")),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
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
