import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
            'data',
          ),
          optionCard(Icons.playlist_add_rounded, 'Add Widget', RouteName.addWidget),
          optionCard(Icons.info_outline, 'About us', RouteName.aboutus),
          optionCard(Icons.message_outlined, 'Contact us', RouteName.contactus),
          optionCard(Icons.star_border, 'Rate App'),
          optionCard(Icons.logout, 'Log out',RouteName.login),
        ],
      ),
    );
  }
}
