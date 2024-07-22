import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets/models/technologylogic.dart'; // Updated import path

class TechnologyDropdown extends StatefulWidget {
  final Function(String) onSelected;

  const TechnologyDropdown({super.key, required this.onSelected});

  @override
  // ignore: library_private_types_in_public_api
  _TechnologyDropdownState createState() => _TechnologyDropdownState();
}

class _TechnologyDropdownState extends State<TechnologyDropdown> {
  final TechnologyController logic = Get.find<TechnologyController>(); // Retrieve the controller
  String? _selectedTechnology; // To hold the selected technology

  @override
  void initState() {
    super.initState();
    // Fetch technologies when the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      logic.fetchTechnologies();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (logic.technologyList.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      }

      List<DropdownMenuItem<String>> dropdownItems = logic.technologyList.map((tech) {
        return DropdownMenuItem<String>(
          value: tech.title,
          child: Text(tech.title),
        );
      }).toList();

      // Ensure the selected value is in the list of items
      if (_selectedTechnology != null && !logic.technologyList.any((tech) => tech.title == _selectedTechnology)) {
        _selectedTechnology = null;
      }

      return DropdownButtonFormField<String>(
        decoration: const InputDecoration(
          // labelText: 'Select Technology',
          border: OutlineInputBorder(),
          errorBorder:OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(),
        ),
        hint: _selectedTechnology == null ? const Text('Select Technology') : Text(_selectedTechnology!),
        onChanged: (value) {
          setState(() {
            _selectedTechnology = value; // Update the selected value
          });
          if (value != null) {
            widget.onSelected(value); // Call the callback with the selected value
          }
        },
        value: _selectedTechnology, // Set the selected value
        items: dropdownItems,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please select a technology';
          }
          return null;
        },
      );
    });
  }
}
