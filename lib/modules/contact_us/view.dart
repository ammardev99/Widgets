import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class ContactUsPage extends StatelessWidget {
  ContactUsPage({super.key});

  final logic = Get.put(ContactUsLogic());
  final state = Get.find<ContactUsLogic>().state;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(), body: const Center(child: Text('Contact us'))),
    );
  }
}
