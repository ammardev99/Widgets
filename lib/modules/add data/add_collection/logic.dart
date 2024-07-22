import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets/widgets/show_snack_bar.dart';

import 'state.dart';

class AddCollectionLogic extends GetxController {
  final AddCollectionState state = AddCollectionState();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  get formKey => _formKey;
  RxBool isLoading = false.obs;

  Future addNewCollection() async {
    isLoading.value = true;
    final fireStore = FirebaseFirestore.instance.collection('collections');
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    try {
      await fireStore.doc(id).set({
        'technology': state.selectedTechonology,
        'collection': state.collectionName.text.trim(),
      });
      debugPrint('collection added');
      showSnackBar('Message', 'Collection added successfully');
      // Clear the fields
      state.collectionName.clear();
      update();
    } catch (error) {
      debugPrint('error');
      showSnackBar('Message', 'Failed to add new collection');
      // showSnackBar('Message', error.toString());
      debugPrint(error.toString());
      log(error.toString());
    } finally {
      update();
    }
    isLoading.value = false;
  }
}
