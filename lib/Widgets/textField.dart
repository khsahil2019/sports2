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
              fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          maxLength: maxLength,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.orange), // Color when activated
              borderRadius: BorderRadius.circular(8.0),
            ),
            hintText: hint,
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 15),
      ],
    );
  }
}
