import 'package:flutter/material.dart';
import 'package:sports2/helper/theme.dart';

class CustomDropPlayGround extends StatelessWidget {
  final String heading;
  final String subHeading;
  final List<String> options;
  final String? selectedValue;
  final void Function(String?)? onChanged;

  CustomDropPlayGround({
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
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              constraints: BoxConstraints(
                maxHeight: 60,
                // maxWidth: 200 // Set the maximum height for the dropdown list
              ),
              child: DropdownButtonFormField<String>(
                icon: Icon(
                  Icons.arrow_drop_down,
                  size: 40,
                  color: AppColors.orange,
                ),
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
                    borderSide: BorderSide(
                      color: Colors.orange, // Color when activated
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  hintText: 'Select $subHeading',
                  border: OutlineInputBorder(),
                  // suffixIcon: Icon(
                  //   // Include a custom icon here
                  //   Icons.arrow_drop_down, // Replace this with your custom icon
                  //   color: AppColors.orange, // Color of the custom icon
                  // ),
                ),
                isExpanded:
                    true, // Allows the dropdown to expand to its parent's width
                itemHeight: 60, // Set the height of each dropdown item
                onTap: () {
                  FocusScope.of(context)
                      .requestFocus(FocusNode()); // Close keyboard on tap
                },
                selectedItemBuilder: (BuildContext context) {
                  return options.map<Widget>((String item) {
                    return Text(item);
                  }).toList();
                },
                dropdownColor:
                    Colors.white, // Set the background color of the dropdown
              ),
            );
          },
        ),
      ],
    );
  }
}
