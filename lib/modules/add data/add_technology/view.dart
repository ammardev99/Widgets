import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class AddTechnologyPage extends StatelessWidget {
  AddTechnologyPage({super.key});

  final logic = Get.put(AddTechnologyLogic());
  final state = Get.find<AddTechnologyLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
