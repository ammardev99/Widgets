import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets/utilities/color.dart';
import 'package:widgets/utilities/validators.dart';
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
        child: Form(
          key: logic.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sizeBox(10),
              customHeading("Icon"),
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
                    child: SizedBox(
                      height: 80,
                      width: 80,
                      child: Obx(() {
                        return state.technologyIcon.value == ''
                            ? const CircleAvatar(
                                backgroundColor: AppColors.splashColor,
                                child: Icon(
                                  Icons.image,
                                  color: AppColors.white,
                                ),
                              )
                            : CircleAvatar(
                                backgroundColor: AppColors.primary,
                                child: ClipOval(
                                  child: Image(
                                    image: FileImage(
                                        File(state.technologyIcon.value)),
                                    fit: BoxFit.cover,
                                    height: 80,
                                    width: 80,
                                  ),
                                ),
                              );
                      }),
                    ),
                  ),
                ),
              ),
              sizeBox(10),
              InputFormFieldApp(
                label: "Title",
                hint: 'Enter technology name',
                controller: state.techonologyTitle,
                inputType: TextInputType.name,
                validator: validateTechnologyTitle,
              ),
              sizeBox(10),
              InputFormFieldApp(
                label: "Color Theme",
                hint: '#FF00FF00',
                controller: state.techonologyColor,
                inputType: TextInputType.name,
                validator: validateColorCode,
              ),
              sizeBox(10),
              sizeBox(15),
              ElevatedButton(
                  onPressed: () async {
                    if (logic.formKey.currentState!.validate()) {
                      await logic.addNewTechnology();
                      // ignore: use_build_context_synchronously
                      Navigator.pop(context);
                    }
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
      ),
    );
  }
}
