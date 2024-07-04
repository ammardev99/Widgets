import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class AddCollectionPage extends StatelessWidget {
  AddCollectionPage({super.key});

  final logic = Get.put(AddCollectionLogic());
  final state = Get.find<AddCollectionLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
