import 'package:get/get.dart';

import 'state.dart';

class WidgetInfoLogic extends GetxController {
  final WidgetInfoState state = WidgetInfoState();

  RxBool favoriteWidget = true.obs;
  void changeFav() {
    favoriteWidget.value = !favoriteWidget.value;
  }
}
