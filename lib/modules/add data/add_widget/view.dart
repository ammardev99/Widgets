import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets/utilities/color.dart';
import 'package:widgets/widgets/back_icon_button.dart';
import 'package:widgets/widgets/formating.dart';
import 'package:widgets/widgets/input_form_field.dart';

import 'logic.dart';

class AddWidgetPage extends StatelessWidget {
  AddWidgetPage({super.key});

  final logic = Get.put(AddWidgetLogic());
  final state = Get.find<AddWidgetLogic>().state;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            leading: backPop(),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customHeading("Widget Image"),
                sizeBox(10),
                InkWell(
                  onTap: () => logic.getImage(),
                  splashColor: AppColors.light,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  borderRadius: BorderRadius.circular(15),
                  child: Obx(() {
                    return logic.wisgetImg.value == ''
                        ? const SizedBox(
                            height: 80,
                            child: Icon(
                              Icons.image,
                              color: Colors.grey,
                              size: 60,
                            ),
                          )
                        : Image.file(
                            File(logic.wisgetImg.value),
                            fit: BoxFit.contain,
                          );
                  }),
                ),
                sizeBox(15),
                InputFormFieldApp(
                    label: "Title",
                    hint: 'Enter widget name',
                    controller: state.widgetTitle,
                    inputType: TextInputType.name),
                InputFormFieldApp(
                    label: "Code",
                    hint: 'Enter widget code',
                    controller: state.widgetCode,
                    inputType: TextInputType.name),
                sizeBox(10),
                ElevatedButton(
                    onPressed: () => state.addWidget(),
                    style: const ButtonStyle(
                      elevation: WidgetStatePropertyAll(1),
                      backgroundColor: WidgetStatePropertyAll(AppColors.primary),
                    ),
                    child: customHeading('Add', AppColors.white)),
              ],
            ),
          )),
    );
  }
}
