import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final String heading;
  final String subHeading;
  final List<String> options;
  final String? selectedValue;
  final void Function(String?)? onChanged;

  CustomDropdown({
    required this.heading,
    required this.subHeading,
    required this.options,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: TextStyle(color: Colors.blue),
        ),
        SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: selectedValue,
          items: options.map((String option) {
            return DropdownMenuItem<String>(
              value: option,
              child: Text(option),
            );
          }).toList(),
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: 'Select $subHeading',
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
