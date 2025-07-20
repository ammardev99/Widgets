import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginState {
  RxBool isLoading = false.obs;
  TextEditingController? userEmail;
  TextEditingController? userPassword;
  TextEditingController? loggedInUserEmail;

  LoginState() {
    userEmail = TextEditingController();
    userPassword = TextEditingController();
  }
}
