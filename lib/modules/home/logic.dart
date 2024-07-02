import 'package:get/get.dart';

import 'state.dart';

class HomeLogic extends GetxController {
  RxBool layoutGrid = true.obs;
  void changeLayOut() {
    layoutGrid.value = !layoutGrid.value;
  }

  final HomeState state = HomeState();
}
