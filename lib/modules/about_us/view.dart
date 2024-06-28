import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class AboutUsPage extends StatelessWidget {
  AboutUsPage({super.key});

  final logic = Get.put(AboutUsLogic());
  final state = Get.find<AboutUsLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
