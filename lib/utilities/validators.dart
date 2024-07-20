import 'package:get/get_utils/src/get_utils/get_utils.dart';

String? validatePassword6digit(String? value) {
  if ((value ?? "").isEmpty) {
    return 'Password is required';
  }
  if (value!.length < 8) {
    return 'Password must be at least 8 characters long';
  }
  return null;
}

String? validateFullName(String? value) {
  if ((value ?? "").isEmpty) {
    return 'Full Name is required';
  }
  if (value!.length < 3) {
    return 'Full Name must be at least 3 characters long';
  }
  if (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(value)) {
    return 'Full Name can only contain letters and spaces';
  }
  return null;
}

String? validateEmail(String? value) {
  if ((value ?? "").isEmpty) {
    return 'Email is required';
  } else if (!GetUtils.isEmail(value!)) {
    return 'Invalid email';
  }
  return null;
}


String? validateTitle(String? value) {
  if ((value ?? "").isEmpty) {
    return 'Title is required';
  }
  if (value!.length < 3) {
    return 'Title must be at least 3 characters long';
  }
  if (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(value)) {
    return 'Title can only contain letters and spaces';
  }
  return null;
}


String? validateColorCode(String? value) {
  if ((value ?? "").isEmpty) {
    return 'Color code is required';
  }
  if (!RegExp(r'^#FF[0-9A-Fa-f]{6}$').hasMatch(value!)) {
    return 'Color code must be in the format #FF******';
  }
  return null;
}


String? validateRequiredField(String? value) {
  if ((value ?? "").isEmpty) {
    return 'required';
  }
  return null;
}
