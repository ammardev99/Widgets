import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets/models/dummy.dart';
import 'package:widgets/routes/routes_name.dart';
import 'package:widgets/utilities/color.dart';
import 'package:widgets/widgets/component_cart.dart';

import 'logic.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({super.key});

  final logic = Get.put(FavoriteLogic());
  final state = Get.find<FavoriteLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() {
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount:
                    collection.where((item) => item.favorite.value).length,
                itemBuilder: (BuildContext context, int index) {
                  var filteredCollection =
                      collection.where((item) => item.favorite.value).toList();
                  return componentCard(filteredCollection[index],
                      AppColors.light, RouteName.widgetsInfo);
                },
              );
            })
          ],
        ),
      ),
    );
  }
}
