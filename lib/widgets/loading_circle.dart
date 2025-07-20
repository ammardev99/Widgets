import 'package:flutter/material.dart';

Widget loadingCircle(double size, [color]) {
  return SizedBox(
    height: size,
    width: size,
    child: CircularProgressIndicator(
      color: color ?? Colors.white,
      strokeWidth: size/10,
    ),
  );
}
