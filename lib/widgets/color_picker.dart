import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:widgets/utilities/color.dart';
import 'package:widgets/widgets/formating.dart';

Future<Color> pickColor(BuildContext context, Color currentColor) async {
  Color pickedColor = currentColor;
  TextEditingController hexController = TextEditingController();

  String colorToHex(Color color) {
    return '#${color.value.toRadixString(16).padLeft(8, '0').toUpperCase()}';
  }

  Color hexToColor(String hex) {
    return Color(int.parse(hex.replaceFirst('#', ''), radix: 16));
  }

  hexController.text = colorToHex(currentColor);

  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Pick a color'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: TextField(
                  controller: hexController,
                  decoration: const InputDecoration(
                    labelText: 'Hex Color',
                  ),
                  onChanged: (String value) {
                    try {
                      final color = hexToColor(value);
                      pickedColor = color;
                    } catch (e) {
                      // Handle invalid hex input
                    }
                  },
                ),
              ),
              ColorPicker(
                pickerColor: currentColor,
                onColorChanged: (Color color) {
                  pickedColor = color;
                  hexController.text = colorToHex(color);
                },
                pickerAreaHeightPercent: 0.8,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          Center(
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.blue),
              ),
              child: customHeading('Got it', AppColors.white),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      );
    },
  );

  return pickedColor;
}
