import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:widgets/widgets/show_snack_bar.dart';

import 'state.dart';

class AddTechnologyLogic extends GetxController {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  get formKey => _formKey;

  File? imagePick;
  final _picker = ImagePicker();
  Future getImage() async {
    final pickedFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    if (pickedFile != null) {
      imagePick = File(pickedFile.path);
      state.technologyIcon.value = imagePick!.path;
    }
  }

  Future addNewTechnology() async {
    final fireStore = FirebaseFirestore.instance.collection('technology');
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    try {
      await fireStore.doc(id).set({
        'icon': state.technologyIcon.trim(),
        'title': state.techonologyTitle.text.trim(),
        'color': state.techonologyColor.text.trim(),
      });
      debugPrint('added');
      showSnackBar('Message', 'Technology added successfully');
      // Clear the fields
      state.technologyIcon.value = '';
      state.techonologyTitle.clear();
      state.techonologyColor.clear();
      imagePick = null;
      update();
    } catch (error) {
      debugPrint('error');
      showSnackBar('Message', 'Failed to add new technology');
      // showSnackBar('Message', error.toString());
      debugPrint(error.toString());
      log(error.toString());
    } finally {
      update();
    }
  }

  final AddTechnologyState state = AddTechnologyState();
}
