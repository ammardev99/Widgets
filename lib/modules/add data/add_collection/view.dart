import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets/models/dummy.dart';
import 'package:widgets/utilities/color.dart';
import 'package:widgets/widgets/dropdown_input_field.dart';
import 'package:widgets/widgets/formating.dart';
import 'package:widgets/widgets/input_form_field.dart';

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sizeBox(10),
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
            sizeBox(10),
            sizeBox(10),
            InputFormFieldApp(
                label: "Collection",
                hint: 'Enter collection title',
                controller: state.collectionName,
                inputType: TextInputType.name),
            sizeBox(10),
            sizeBox(15),
            ElevatedButton(
                onPressed: () {
                  state.addCollection();
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
