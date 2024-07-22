import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets/utilities/color.dart';
import 'package:widgets/utilities/validators.dart';
import 'package:widgets/widgets/back_icon_button.dart';
import 'package:widgets/widgets/collection_dropdown.dart';
import 'package:widgets/widgets/formating.dart';
import 'package:widgets/widgets/input_form_field.dart';
import 'package:widgets/widgets/technology_dropdown.dart';

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
          title: customHeading('New Widget'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(20),
          child: Form(
            key: logic.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sizeBox(10),
                customHeading('Select Technology'),
                sizeBox(5),
                TechnologyDropdown(onSelected: (value) {
                  state.selectedTechonology = value;
                }),
                sizeBox(10),
                customHeading('Select Collection'),
                sizeBox(5),
                CollectionDropdown(
                  onSelected: (value) {
                    state.selectedCollection = value;
                  },
                ),
                sizeBox(10),
                InputFormFieldApp(
                  label: "Title",
                  hint: 'Enter widget name',
                  controller: state.widgetTitle,
                  inputType: TextInputType.text,
                  validator: validateTitle,
                ),
                sizeBox(10),
                InputFormFieldApp(
                  label: "Code",
                  hint: 'Enter widget code',
                  controller: state.widgetCode,
                  inputType: TextInputType.text,
                  validator: validateRequiredField,
                ),
                sizeBox(10),
                InputFormFieldApp(
                  label: "Description",
                  hint: 'Enter widget description',
                  controller: state.widgetDescription,
                  inputType: TextInputType.text,
                  validator: validateRequiredField,
                ),
                sizeBox(10),
                customHeading("UI Image"),
                sizeBox(10),
                Center(
                  child: InkWell(
                    onTap: () => logic.getImage(),
                    splashColor: AppColors.light,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    borderRadius: BorderRadius.circular(15),
                    child: Obx(() {
                      return state.widgetImg.value == ''
                          ? const SizedBox(
                              height: 80,
                              child: Icon(
                                Icons.image,
                                color: Colors.grey,
                                size: 60,
                              ),
                            )
                          : Image.file(
                              File(state.widgetImg.value),
                              fit: BoxFit.contain,
                            );
                    }),
                  ),
                ),
                sizeBox(30),
                Obx(() {
                  if (logic.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return ElevatedButton(
                        onPressed: () async {
                          if (logic.formKey.currentState!.validate()) {
                            await logic.addNewWidget(
                              state.widgetImg.value,
                            );
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
                        child: customHeading('Add', AppColors.white));
                  }
                }),
                sizeBox(30)
              ],
            ),
          ),
        ),
      ),
    );
  }
}




//           ],
//         ),
//       ),
//     );
//   }
// }
