import 'package:get/get.dart';

import 'state.dart';

class HomeLogic extends GetxController {
  bool layoutGrid = true;
  void changeLayOut() {
    layoutGrid = !layoutGrid;
    update();
    // ignore: avoid_print
    print(layoutGrid);
  }

  final HomeState state = HomeState();
}
