import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets/modules/add%20data/add_widget/view.dart';
import 'package:widgets/routes/routes_name.dart';
import 'package:widgets/test/technologylist.dart';
import 'package:widgets/widgets/optioncard.dart';
import 'package:widgets/widgets/profile.dart';

import 'logic.dart';

class MenuPage extends StatelessWidget {
  MenuPage({super.key});

  final logic = Get.put(MenuLogic());
  final state = Get.find<MenuLogic>().state;
  // Function to get the current user's email
  String? getCurrentUserEmail() {
    User? user = FirebaseAuth.instance.currentUser;
    return user?.email;
  }

  @override
  Widget build(BuildContext context) {
    String? userEmail = getCurrentUserEmail();
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          profileCard(
            'assets/png/app_icon.png',
            'User',
            userEmail ?? 'useremail@gmail.com',
          ),
          // optionPageCard(Icons.add_box_outlined, 'Add Techonology', context,
          //     AddTechnologyPage()),
          // optionPageCard(Icons.view_agenda_outlined, 'Create Collection',
          //     context, AddCollectionPage()),
          optionPageCard(Icons.playlist_add_rounded, 'Add Widget', context,
              AddWidgetPage()),
          optionPageCard(Icons.add_box_outlined, 'Techonology List Data',
              context, const WidgetsData()),
          optionCard(Icons.info_outline, 'About us', RouteName.aboutus),
          optionCard(Icons.message_outlined, 'Contact us', RouteName.contactus),
          optionCard(Icons.star_border, 'Rate App'),
          optionCard(Icons.logout, 'Log out', RouteName.login),
        ],
      ),
    );
  }
}
