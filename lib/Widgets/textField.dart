import 'package:flutter/material.dart';

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
          style: TextStyle(color: Colors.blue),
        ),
        SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          maxLength: maxLength,
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 15),
      ],
    );
  }
}
