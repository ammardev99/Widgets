import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets/utilities/color.dart';
import 'package:widgets/utilities/validators.dart';
import 'package:widgets/widgets/color_picker.dart';
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
                                backgroundColor: AppColors.light,
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
                validator: validateTitle,
              ),
              sizeBox(10),
              customHeading('Theme Color'),
              const SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () async {
                  state.themeColor.value =
                      await pickColor(context, state.themeColor.value);
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: AppColors.black),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customInfo(state.themeColor.value.toString()),
                      Obx(() {
                        return Container(
                          height: 30,
                          width: 30,
                          color: state.themeColor.value,
                        );
                      }),
                    ],
                  ),
                ),
              ),
              sizeBox(15),
              // Display a loading indicator when isLoading is true
              Obx(() {
                if (logic.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return ElevatedButton(
                    onPressed: () async {
                      if (logic.formKey.currentState!.validate()) {
                        await logic.addNewTechnology(
                            state.technologyIcon.value,
                            state.techonologyTitle.text,
                            state.themeColor.string);
                        // ignore: use_build_context_synchronously
                        Navigator.pop(context);
                      }
                    },
                    style: const ButtonStyle(
                      minimumSize:
                          WidgetStatePropertyAll(Size(double.infinity, 50)),
                      elevation: WidgetStatePropertyAll(1),
                      backgroundColor:
                          WidgetStatePropertyAll(AppColors.primary),
                    ),
                    child: customHeading('Add', AppColors.white),
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
