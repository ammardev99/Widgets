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
              technologyListCard(myTechonology[0]),
              sizeBox(10),
              // layout option
              ListTile(
                contentPadding: const EdgeInsets.all(0),
                title: customHeading("Technologies"),
                trailing: IconButton(
                    onPressed: () => logic.changeLayOut(),
                    icon: logic.layoutGrid == true
                        ? const Icon(Icons.list, color: AppColors.grey)
                        : const Icon(Icons.grid_view, color: AppColors.grey)),
              ),
              sizeBox(10),
              logic.layoutGrid == true
                  ? GridView.builder(
                      itemCount: myTechonology.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        mainAxisExtent: 170,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                      ),
                      itemBuilder: (context, index) =>
                          technologyGridCard(myTechonology[index]),
                    )
                  : ListView.builder(
                    itemCount: myTechonology.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) =>
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            child: technologyListCard(myTechonology[index]),
                          ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
