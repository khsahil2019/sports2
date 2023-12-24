import 'package:flutter/material.dart';
import 'package:sports2/helper/theme.dart';

class DatePickerField extends StatefulWidget {
  final TextEditingController controller;

  const DatePickerField({Key? key, required this.controller}) : super(key: key);

  @override
  _DatePickerFieldState createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null && pickedDate != DateTime.now()) {
      setState(() {
        widget.controller.text = pickedDate.toString().split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Date of Birth',
              style: TextStyle(
                color: AppColors.orange,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 8),
          ],
        ),
        SizedBox(height: 8),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: TextFormField(
            controller: widget.controller,
            readOnly: true,
            onTap: () {
              _selectDate(context);
            },
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              hintText: 'Select your date of birth',
              border: InputBorder.none,
              suffixIcon: Icon(Icons.calendar_month),
            ),
          ),
        ),
      ],
    );
  }
}
