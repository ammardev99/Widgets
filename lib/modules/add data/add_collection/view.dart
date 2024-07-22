import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets/utilities/color.dart';
import 'package:widgets/utilities/validators.dart';
import 'package:widgets/widgets/formating.dart';
import 'package:widgets/widgets/input_form_field.dart';
import 'package:widgets/widgets/technology_dropdown.dart';

import 'logic.dart';

class AddCollectionPage extends StatelessWidget {
  AddCollectionPage({super.key});

  final logic = Get.put(AddCollectionLogic());
  final state = Get.find<AddCollectionLogic>().state;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: customTitle('New Collection'),
      alignment: Alignment.center,
      content: SingleChildScrollView(
        child: Form(
          key: logic.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sizeBox(10),
              TechnologyDropdown(onSelected: (value) {
                state.selectedTechonology = value;
              }),
              sizeBox(10),
              InputFormFieldApp(
                  label: "Collection",
                  hint: 'Enter collection title',
                  controller: state.collectionName,
                  inputType: TextInputType.name,
                  validator: validateTitle),
              sizeBox(10),
              sizeBox(15),
              Obx(() {
                if (logic.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return ElevatedButton(
                      onPressed: () async {
                        if (logic.formKey.currentState!.validate()) {
                          await logic.addNewCollection();
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
            ],
          ),
        ),
      ),
    );
  }
}
