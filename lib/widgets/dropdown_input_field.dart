import 'package:flutter/material.dart';
import 'package:widgets/utilities/color.dart';
import 'package:widgets/widgets/formating.dart';

class DropdownFormFieldApp extends StatelessWidget {
  final String label;
  final String hint;
  final List<String> items;
  final String? value;
  final ValueChanged<String?> onChanged;
  final FormFieldValidator<String>? validator;

  const DropdownFormFieldApp({
    super.key,
    required this.label,
    required this.hint,
    required this.items,
    this.value,
    required this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customHeading(label),
        const SizedBox(
          height: 5,
        ),
        DropdownButtonFormField<String>(
          focusColor: Colors.transparent,
          dropdownColor: AppColors.white,
          value: value,
          hint: Text(hint),
          items: items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: onChanged,
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
          ),
          validator: validator,
        ),
      ],
    );
  }
}
