import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      child: // Grid card
          Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            sizeBox(20),
            technologyListCard('Flutter', AppColors.red),
            sizeBox(10),
            // layout option
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: customHeading("Technologies"),
              trailing: IconButton(
                  onPressed: () => logic.changeLayOut(),
                  icon: logic.layoutGrid == true
                      ? const Icon(Icons.grid_view, color: AppColors.grey)
                      : const Icon(Icons.list,color: AppColors.grey,)),
            ),
            sizeBox(10),
            GridView.count(
              scrollDirection: Axis.vertical,
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 10,
              shrinkWrap: true,
              children: [
                technologyGridCard('Name A', Colors.red),
                technologyGridCard('Name B', Colors.black),
                technologyGridCard('Name C', Colors.green),
                technologyGridCard('Name D', Colors.yellow),
                technologyGridCard('Name E', Colors.pink),
                technologyGridCard('Name F', Colors.teal),
                technologyGridCard('Name G', Colors.deepOrangeAccent),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
