import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets/utilities/color.dart';
import 'package:widgets/widgets/formating.dart';
import 'package:widgets/widgets/input_form_field.dart';

import 'logic.dart';

class AddTechnologyPage extends StatelessWidget {
  AddTechnologyPage({super.key});

  final logic = Get.put(AddTechnologyLogic());
  final state = Get.find<AddTechnologyLogic>().state;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: customTitle('Techonology'),
      alignment: Alignment.center,
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sizeBox(10),
            customHeading("Logo"),
            sizeBox(10),
            Center(
              child: SizedBox(
                height: 80,
                width: 80,
                child: InkWell(
                  onTap: () => logic.getImage(),
                  splashColor: AppColors.light,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  borderRadius: BorderRadius.circular(15),
                  child: Obx(() {
                    return logic.widgetImg.value == ''
                        ? const SizedBox(
                            height: 80,
                            child: Icon(
                              Icons.image,
                              color: Colors.grey,
                              size: 60,
                            ),
                          )
                        : Image.file(
                            File(logic.widgetImg.value),
                            fit: BoxFit.contain,
                          );
                  }),
                ),
              ),
            ),
            sizeBox(10),
            InputFormFieldApp(
                label: "Name",
                hint: 'Enter language name',
                controller: state.widgetTitle,
                inputType: TextInputType.name),
            sizeBox(10),
            InputFormFieldApp(
                label: "Color Theme",
                hint: '#FF00FF00',
                controller: state.widgetCode,
                inputType: TextInputType.name),
            sizeBox(10),
            sizeBox(15),
            ElevatedButton(
                onPressed: () {
                  state.addWidget();
                  Navigator.pop(context);
                },
                style: const ButtonStyle(
                  minimumSize:
                      WidgetStatePropertyAll(Size(double.infinity, 50)),
                  elevation: WidgetStatePropertyAll(1),
                  backgroundColor: WidgetStatePropertyAll(AppColors.primary),
                ),
                child: customHeading('Add', AppColors.white)),
          ],
        ),
      ),
    );
  }
}
