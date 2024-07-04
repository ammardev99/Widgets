import 'package:flutter/material.dart';

class SignupState {
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
