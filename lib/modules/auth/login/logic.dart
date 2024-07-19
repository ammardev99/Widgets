import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets/routes/routes_name.dart';
import 'package:widgets/widgets/show_snack_bar.dart';

import 'state.dart';

class LoginLogic extends GetxController {
  final LoginState state = LoginState();
  FirebaseAuth auth = FirebaseAuth.instance;
  bool dataloading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  get formKey => _formKey;
  void login() {
    if (!formKey.currentState!.validate()) {
      return;
    }
    dataloading = true;
    update();
    auth
        .signInWithEmailAndPassword(
            email: state.userEmail!.text,
            password: state.userPassword!.text.toString())
        .then((value) {
      dataloading = false;

      showSnackBar('Message', 'Login Successful!');
      update();
      Get.offAllNamed(RouteName.widgetApp);

      dataloading = false;
      update();
    }).onError((error, stackTrace) {
      // Utils().toastMessage(error.toString());
      showSnackBar('Message', 'Server Error');
      log(error.toString());
      update();
      dataloading = false;
      update();
    });
    showSnackBar('App', 'Wellcom');
  }
}
