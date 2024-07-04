import 'package:flutter/material.dart';

class LoginState {
  TextEditingController? userEmail;
  TextEditingController? userPassword;

  LoginState() {
    userEmail = TextEditingController();
    userPassword = TextEditingController();
  }
}
