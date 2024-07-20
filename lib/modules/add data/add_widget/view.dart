import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets/models/dummy.dart';
import 'package:widgets/utilities/color.dart';
import 'package:widgets/utilities/validators.dart';
import 'package:widgets/widgets/back_icon_button.dart';
import 'package:widgets/widgets/dropdown_input_field.dart';
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
                DropdownFormFieldApp(
                  label: "Technology",
                  hint: "Select language",
                  items: [
                    myTechonology[0].title.toString(),
                    myTechonology[1].title.toString(),
                    myTechonology[2].title.toString(),
                    myTechonology[3].title.toString(),
                    myTechonology[4].title.toString(),
                    myTechonology[5].title.toString(),
                  ],
                  value: state.selectedTechonology,
                  onChanged: (value) {
                    state.selectedTechonology = value;
                  },
                ),
                sizeBox(15),
                DropdownFormFieldApp(
                  label: "Collection",
                  hint: "Select category",
                  items: [
                    myCollection[0].title,
                    myCollection[1].title,
                    myCollection[2].title,
                    myCollection[3].title,
                    myCollection[4].title,
                    myCollection[5].title,
                  ],
                  value: state.selectedCollection,
                  onChanged: (value) {
                    state.selectedCollection = value;
                  },
                ),
                sizeBox(15),
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
                sizeBox(15),
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
                ElevatedButton(
                    onPressed: () async {
                      if (logic.formKey.currentState!.validate()) {
                        await logic.addNewWidget();
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
