import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets/models/dummy.dart';
import 'package:widgets/modules/add%20data/add_widget/view.dart';
import 'package:widgets/routes/routes_name.dart';
import 'package:widgets/utilities/color.dart';
import 'package:widgets/widgets/feed_card.dart';
import 'package:widgets/widgets/formating.dart';
import 'package:widgets/widgets/show_page_dialog.dart';

import 'logic.dart';

class UpdatesPage extends StatelessWidget {
  UpdatesPage({super.key});

  final logic = Get.put(UpdatesLogic());
  final state = Get.find<UpdatesLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: customHeading('Feed'),
        centerTitle: true,
        actions: [
          IconButton(
              style: const ButtonStyle(
                  iconColor: WidgetStatePropertyAll(AppColors.primary)),
              onPressed: () {
                showPageDialog(context, AddWidgetPage());
                debugPrint('add new');
              },
              icon: const Icon(Icons.add)),
        ],
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(15),
          child: ListView.builder(
            itemCount: myTechonology.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: feedCard(widgets[index], myTechonology[index].color,
                  RouteName.widgetsInfo),
            ),
          )),
    );
  }
}
