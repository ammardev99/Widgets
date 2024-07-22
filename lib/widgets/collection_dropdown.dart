import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets/models/fetch%20data/fetch_collection_logic.dart';

class CollectionDropdown extends StatefulWidget {
  final Function(String) onSelected;

  const CollectionDropdown({super.key, required this.onSelected});

  @override
  // ignore: library_private_types_in_public_api
  _CollectionDropdownState createState() => _CollectionDropdownState();
}

class _CollectionDropdownState extends State<CollectionDropdown> {
  final CollectionController logic = Get.find<CollectionController>();
  String? _selectedCollection;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      logic.fetchCollections();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (logic.collectionList.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      }

      List<DropdownMenuItem<String>> dropdownItems = logic.collectionList.map((collection) {
        return DropdownMenuItem<String>(
          value: collection.collection,
          child: Text(collection.collection),
        );
      }).toList();

      if (_selectedCollection != null && !logic.collectionList.any((collection) => collection.collection == _selectedCollection)) {
        _selectedCollection = null;
      }

      return SizedBox(
        width: double.infinity,
        child: DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            // labelText: 'Select Collection',
            border: OutlineInputBorder(),
            errorBorder:OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(),
          ),
          hint: _selectedCollection == null ? const Text('Select Collection') : Text(_selectedCollection!),
          onChanged: (value) {
            setState(() {
              _selectedCollection = value;
            });
            if (value != null) {
              widget.onSelected(value);
            }
          },
          value: _selectedCollection,
          items: dropdownItems,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please select a collection';
            }
            return null;
          },
        ),
      );
    });
  }
}
