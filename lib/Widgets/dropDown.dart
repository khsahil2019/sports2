import 'package:flutter/material.dart';
import 'package:sports2/helper/theme.dart';

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
          style: TextStyle(
              color: AppColors.orange,
              fontSize: 16,
              fontWeight: FontWeight.bold),
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
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.orange), // Color when activated
              borderRadius: BorderRadius.circular(8.0),
            ),
            hintText: 'Select $subHeading',
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
