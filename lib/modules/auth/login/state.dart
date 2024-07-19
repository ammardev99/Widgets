import 'package:flutter/material.dart';

class LoginState {
  TextEditingController? userEmail;
  TextEditingController? userPassword;
  TextEditingController? loggedInUserEmail;

  LoginState() {
    userEmail = TextEditingController();
    userPassword = TextEditingController();
  }
}
