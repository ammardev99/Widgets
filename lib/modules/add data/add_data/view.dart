import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class AddDataPage extends StatelessWidget {
  AddDataPage({super.key});

  final logic = Get.put(AddDataLogic());
  final state = Get.find<AddDataLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
