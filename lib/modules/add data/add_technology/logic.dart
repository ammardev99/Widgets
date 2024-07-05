import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'state.dart';

class AddTechnologyLogic extends GetxController {
    RxString widgetImg = ''.obs;

  File? imagePick;
  final _picker = ImagePicker();
  Future getImage() async {
    final pickedFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    if (pickedFile != null) {
      imagePick = File(pickedFile.path);
      widgetImg.value = imagePick!.path;
    }
  }
  final AddTechnologyState state = AddTechnologyState();
}
