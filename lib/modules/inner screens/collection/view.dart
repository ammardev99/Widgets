import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets/models/dummy.dart';
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
            technologyListCard(myTechonology[Get.arguments]),
            sizeBox(20),
            collectionCard('App Bar', 235,Get.arguments,myTechonology[Get.arguments].color, RouteName.components, ),
            collectionCard('Buttons', 561,Get.arguments,myTechonology[Get.arguments].color, RouteName.components, ),
            collectionCard('Inputs', 512, Get.arguments,myTechonology[Get.arguments].color,RouteName.components, ),
            collectionCard('Sliders', 123,Get.arguments,myTechonology[Get.arguments].color, RouteName.components, ),
            collectionCard('Cards', 32, Get.arguments,myTechonology[Get.arguments].color,RouteName.components, ),
            collectionCard('Bottom Bar', 135, Get.arguments,myTechonology[Get.arguments].color,RouteName.components, ),
          ],
        ),
      ),
    );
  }
}
