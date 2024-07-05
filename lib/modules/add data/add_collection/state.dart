import 'package:flutter/material.dart';
import 'package:widgets/widgets/show_snack_bar.dart';

class AddCollectionState {
  String? selectedTechonology;
  TextEditingController collectionName = TextEditingController();
  addCollection() {

    debugPrint(selectedTechonology);
    debugPrint(collectionName.text);
    showSnackBar('added', collectionName.text);
  }


  AddCollectionState() {
    ///Initialize variables
  }
}
