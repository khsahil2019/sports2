import 'package:flutter/material.dart';
import 'package:sports2/helper/theme.dart';

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
      heading!.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                heading,
                style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            )
          : SizedBox(),
      SizedBox(height: 8),
      Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.grey, // border color
                width: 1.0,
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white, // Top color
                  Colors.grey.shade200, // Bottom color
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(0, 3), // Shadow position
                ),
              ],
            ),
            child: SizedBox(
              height: 58,
              child: TextFormField(
                controller: controller,
                readOnly: true,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                  border: InputBorder.none,
                  hintText: 'Select Date',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  suffixIcon: Icon(
                    Icons.calendar_today,
                    color: Colors.orange, // active color
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: _selectDate,
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
