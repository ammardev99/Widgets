import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets/models/dummy.dart';
import 'package:widgets/utilities/color.dart';
import 'package:widgets/widgets/formating.dart';
import 'package:widgets/widgets/technology_card.dart';

import 'logic.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final logic = Get.put(HomeLogic());
  final state = Get.find<HomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              sizeBox(20),
              technologyListCard(myTechonology[5]),
              sizeBox(10),
              // layout option
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customHeading("Technologies"),
                  Obx(() {
                    return IconButton(
                        onPressed: () => logic.changeLayOut(),
                        icon: logic.layoutGrid.value == true
                            ? Icon(Icons.view_agenda,
                                color: AppColors.grey.withOpacity(0.6))
                            : Icon(Icons.grid_view_rounded,
                                color: AppColors.grey.withOpacity(0.6)));
                  }),
                ],
              ),
              sizeBox(3),
              Obx(() {
                return
                logic.layoutGrid.value == true
                    ?
                    GridView.builder(
                        itemCount: myTechonology.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 250,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) =>
                            technologyGridCard(myTechonology[index]),
                      )
                    : GridView.builder(
                        itemCount: myTechonology.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 540,
                          mainAxisExtent: 120,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 1.0,
                        ),
                        itemBuilder: (context, index) =>
                            technologyListCard(myTechonology[index]),
                      );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
