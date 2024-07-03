import 'package:flutter/services.dart';

Future<void> copyIt(String text) {
  return Clipboard.setData(ClipboardData(text: text));
}
