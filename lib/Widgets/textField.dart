import 'package:flutter/material.dart';
import 'package:sports2/helper/theme.dart';

class TextWidget extends StatelessWidget {
  final String heading;
  final String hint;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final int? maxLength;

  const TextWidget({
    Key? key,
    required this.heading,
    required this.hint,
    required this.keyboardType,
    required this.controller,
    this.maxLength,
  }) : super(key: key);

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
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: Colors.grey), // Outer border color
          ),
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            maxLength: maxLength,
            decoration: InputDecoration(
              counterText: '',
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              hintText: hint,
              border: InputBorder.none, // Remove the default border
            ),
            style: TextStyle(fontSize: 16), // Adjust text style if needed
          ),
        ),
        SizedBox(height: 15),
      ],
    );
  }
}
