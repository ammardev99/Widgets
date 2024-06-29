import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
            technologyListCard('Components', Colors.blue),
            sizeBox(20),
            componentCard('First', true, RouteName.widgetsInfo),
            componentCard('Second', false, RouteName.widgetsInfo),
            componentCard('3rd', false, RouteName.widgetsInfo),
            componentCard('Last', true, RouteName.widgetsInfo),
          ],
        ),
      ),
    );
  }
}
