import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets/modules/auth/login/view.dart';
import 'package:widgets/widgets/show_snack_bar.dart';

import 'state.dart';

class SignupLogic extends GetxController {
  final SignupState state = SignupState();
  bool dataloading = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  get formKey => _formKey;
  Future<void> signup() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    state.isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1));
    dataloading = true;
    update();
    auth
        .createUserWithEmailAndPassword(
            email: state.userEmail!.text.toString(),
            password: state.userPassword!.text.toString())
        .then((value) {
      dataloading = false;
      state.isLoading.value = false;
      showSnackBar('Message', 'Account Create Successful!');
      Get.offAll(() => LoginPage());
      update();
    }).onError((error, stackTrace) {
      showSnackBar('Message', 'Server Error');
      log(error.toString());
      // Utils().toastMessage(error = error.toString());
      dataloading = false;
      update();
    });
    state.isLoading.value = false;
  }
}
