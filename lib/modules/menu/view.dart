import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets/modules/add%20data/add_collection/view.dart';
import 'package:widgets/modules/add%20data/add_technology/view.dart';
import 'package:widgets/modules/add%20data/add_widget/view.dart';
import 'package:widgets/routes/routes_name.dart';
import 'package:widgets/widgets/optioncard.dart';
import 'package:widgets/widgets/profile.dart';

import 'logic.dart';

class MenuPage extends StatelessWidget {
  MenuPage({super.key});

  final logic = Get.put(MenuLogic());
  final state = Get.find<MenuLogic>().state;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          profileCard(
            'assets/png/app_icon.png',
            'User',
            'useremail@gmail.com',
          ),
          optionPageCard(Icons.add_box_outlined, 'Add Techonology', context,
              AddTechnologyPage()),
          optionPageCard(Icons.view_agenda_outlined, 'Add Collection', context,
              AddCollectionPage()),
          optionPageCard(Icons.playlist_add_rounded, 'Add Widget', context,
              AddWidgetPage()),
          optionCard(Icons.info_outline, 'About us', RouteName.aboutus),
          optionCard(Icons.message_outlined, 'Contact us', RouteName.contactus),
          optionCard(Icons.star_border, 'Rate App'),
          optionCard(Icons.logout, 'Log out', RouteName.login),
        ],
      ),
    );
  }
}
