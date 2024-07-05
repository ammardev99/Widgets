import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets/models/dummy.dart';
import 'package:widgets/routes/routes_name.dart';
import 'package:widgets/widgets/back_icon_button.dart';
import 'package:widgets/widgets/component_cart.dart';
import 'package:widgets/widgets/formating.dart';
import 'package:widgets/widgets/technology_card.dart';

import 'logic.dart';

class ComponentsPage extends StatelessWidget {
  ComponentsPage({super.key});

  final logic = Get.put(ComponentsLogic());
  final state = Get.find<ComponentsLogic>().state;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widgets.length,
                itemBuilder: (BuildContext context, int index) =>
                    componentCard(widgets[index],myTechonology[Get.arguments].color,RouteName.widgetsInfo),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
