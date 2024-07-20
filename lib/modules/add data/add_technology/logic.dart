import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:widgets/widgets/show_snack_bar.dart';

import 'state.dart';

class AddTechnologyLogic extends GetxController {
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
      state.technologyIcon.value = imagePick!.path;
    }
  }

// Function to upload image to Firebase Storage and return the download URL
  Future<String> uploadImage(File image) async {
    try {
      String fileName =
          '${state.techonologyTitle.text} ${DateTime.now().millisecondsSinceEpoch}';
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref().child("technologies/$fileName.png");
      UploadTask uploadTask = ref.putFile(image);
      TaskSnapshot taskSnapshot = await uploadTask;
      String downloadURL = await taskSnapshot.ref.getDownloadURL();
      showSnackBar('Message', 'added');
      return downloadURL;
    } catch (e) {
      // ignore: avoid_print
      print('Error uploading image: $e');
      showSnackBar('Message', e.toString());
      rethrow;
    }
  }

// Function to add a new technology, uploading image first
  Future<void> addNewTechnology(
      String imagePath, String technologyTitle, String themeColor) async {
    final fireStore = FirebaseFirestore.instance.collection('technologies');
    isLoading.value = true;
    debugPrint("loading ... s");
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    try {
      // Convert image path to File
      File imageFile = File(imagePath);

      // Upload the image and get the URL
      String imageUrl = await uploadImage(imageFile);

      // Store the image URL and other technology details in Firestore
      await fireStore.doc(id).set({
        'icon': imageUrl,
        'title': technologyTitle.trim(),
        'color': themeColor,
      });
      // print("added");
    } catch (e) {
      // print('Error adding new technology: $e');
      showSnackBar('Message', e.toString());
    }
    isLoading.value = false;
    debugPrint("loading ... e");
  }

  final AddTechnologyState state = AddTechnologyState();
}
