import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupState {
  RxBool isLoading = false.obs;

  TextEditingController? userFullName;
  TextEditingController? userEmail;
  TextEditingController? userPassword;
  signup() {
    userFullName = TextEditingController();
    userEmail = TextEditingController();
    userPassword = TextEditingController();
  }

  SignupState() {
    signup();
  }
}
