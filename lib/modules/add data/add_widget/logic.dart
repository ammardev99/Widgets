import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:widgets/widgets/show_snack_bar.dart';

import 'state.dart';

class AddWidgetLogic extends GetxController {
  final AddWidgetState state = AddWidgetState();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  get formKey => _formKey;

  File? imagePick;
  final _picker = ImagePicker();
  Future getImage() async {
    final pickedFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    if (pickedFile != null) {
      imagePick = File(pickedFile.path);
      state.widgetImg.value = imagePick!.path;
    }
  }
  Future addNewWidget() async {
    final fireStore = FirebaseFirestore.instance.collection('widget');
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    try {
      await fireStore.doc(id).set({
        'technology': state.selectedTechonology,
        'collection': state.selectedCollection,
        'image': state.widgetImg.trim(),
        'title': state.widgetTitle.text.trim(),
        'code': state.widgetCode.text.trim(),
        'description': state.widgetDescription.text.trim(),
      });
      debugPrint('widget added');
      showSnackBar('Message', 'added successfully');
      // Clear the fields
      state.widgetImage.clear();
      state.widgetTitle.clear();
      state.widgetCode.clear();
      state.widgetDescription.clear();
      update();
    } catch (error) {
      debugPrint('error');
      showSnackBar('Message', 'Failed to add');
      // showSnackBar('Message', error.toString());
      debugPrint(error.toString());
      log(error.toString());
    } finally {
      update();
    }
  }
}
