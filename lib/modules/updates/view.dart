import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class UpdatesPage extends StatelessWidget {
  UpdatesPage({super.key});

  final logic = Get.put(UpdatesLogic());
  final state = Get.find<UpdatesLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}



