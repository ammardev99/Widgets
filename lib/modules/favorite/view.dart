import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({super.key});

  final logic = Get.put(FavoriteLogic());
  final state = Get.find<FavoriteLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
