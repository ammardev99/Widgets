import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:widgets/widgets/show_snack_bar.dart';

import 'state.dart';

class AddWidgetLogic extends GetxController {
  final AddWidgetState state = AddWidgetState();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  get formKey => _formKey;
  RxBool isLoading = false.obs;
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

// Function to upload image to Firebase Storage and return the download URL
  Future<String> uploadImage(File image) async {
    try {
      String fileName =
          '${state.widgetTitle.text} ${DateTime.now().millisecondsSinceEpoch}';
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref().child("widgets/$fileName.png");
      UploadTask uploadTask = ref.putFile(image);
      TaskSnapshot taskSnapshot = await uploadTask;
      String downloadURL = await taskSnapshot.ref.getDownloadURL();
      showSnackBar('Message', 'img added');
      return downloadURL;
    } catch (e) {
      // ignore: avoid_print
      print('Error uploading image: $e');
      showSnackBar('Message', e.toString());
      rethrow;
    }
  }

  Future addNewWidget(
    String imagePath,
  ) async {
    debugPrint("loading ... s");
    isLoading.value = true;
    final fireStore = FirebaseFirestore.instance.collection('widgets');
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    try {
      File imageFile = File(imagePath);

      //     // Upload the image and get the URL
      String imageUrl = await uploadImage(imageFile);

      await fireStore.doc(id).set({
        'technology': state.selectedTechonology,
        'collection': state.selectedCollection,
        'image': imageUrl,
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
    isLoading.value = false;
  }
}
