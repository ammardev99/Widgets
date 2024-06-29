import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets/routes/routes_name.dart';
import 'package:widgets/widgets/back_icon_button.dart';
import 'package:widgets/widgets/collection_card.dart';
import 'package:widgets/widgets/formating.dart';
import 'package:widgets/widgets/technology_card.dart';

import 'logic.dart';

class CollectionPage extends StatelessWidget {
  CollectionPage({super.key});

  final logic = Get.put(CollectionLogic());
  final state = Get.find<CollectionLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: backPop(),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            technologyListCard('Collection', Colors.blue),
            sizeBox(20),
            collectionCard('App Bar', 235, RouteName.components),
            collectionCard('Buttons', 561, RouteName.components),
            collectionCard('Inputs', 512, RouteName.components),
            collectionCard('Sliders', 123, RouteName.components),
            collectionCard('Cards', 32, RouteName.components),
            collectionCard('Bottom Bar', 135, RouteName.components),
          ],
        ),
      ),
    );
  }
}
