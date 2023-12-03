import 'package:flutter/material.dart';

Widget buildDatePickerField({
  required TextEditingController controller,
  required BuildContext context,
  String? heading,
}) {
  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null && pickedDate != DateTime.now()) {
      controller.text = pickedDate.toString().split(' ')[0];
    }
  }

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          heading!.isNotEmpty
              ? Text(
                  heading,
                  style: TextStyle(color: Colors.blue),
                )
              : SizedBox(),
          SizedBox(width: 8),
        ],
      ),
      SizedBox(height: 8),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.blue, // border color
            width: 1.0,
          ),
        ),
        child: TextFormField(
          controller: controller,
          readOnly: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Select Date',
            // border: OutlineInputBorder(),
            suffixIcon: GestureDetector(
              onTap: () {
                _selectDate();
              },
              child: Icon(Icons.calendar_today),
            ),
          ),
        ),
      ),
    ],
  );
}
