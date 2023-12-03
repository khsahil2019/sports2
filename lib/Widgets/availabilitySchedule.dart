import 'package:flutter/material.dart';

class AvailabilityScheduleWidget extends StatefulWidget {
  @override
  _AvailabilityScheduleWidgetState createState() =>
      _AvailabilityScheduleWidgetState();
}

class _AvailabilityScheduleWidgetState
    extends State<AvailabilityScheduleWidget> {
  final Map<String, bool> _daysAvailability = {
    'Monday': false,
    'Tuesday': false,
    'Wednesday': false,
    'Thursday': false,
    'Friday': false,
    'Saturday': false,
    'Sunday': false,
  };

  TimeOfDay _selectedStartTime = TimeOfDay(hour: 8, minute: 0);
  TimeOfDay _selectedEndTime = TimeOfDay(hour: 18, minute: 0);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '',
          style: TextStyle(color: Colors.blue),
        ),
        SizedBox(height: 8),
        // Display checkboxes for days
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _daysAvailability.keys.map((String day) {
            return CheckboxListTile(
              title: Text(day),
              value: _daysAvailability[day],
              onChanged: (bool? value) {
                setState(() {
                  _daysAvailability[day] = value ?? false;
                });
              },
            );
          }).toList(),
        ),
        SizedBox(height: 12),
        // Select start and end timings
        Row(
          children: [
            Text('Start Time: '),
            TextButton(
              onPressed: () async {
                TimeOfDay? selectedTime = await showTimePicker(
                  context: context,
                  initialTime: _selectedStartTime,
                );
                if (selectedTime != null) {
                  setState(() {
                    _selectedStartTime = selectedTime;
                  });
                }
              },
              child: Text(_selectedStartTime.format(context)),
            ),
            SizedBox(width: 20),
            Text('End Time: '),
            TextButton(
              onPressed: () async {
                TimeOfDay? selectedTime = await showTimePicker(
                  context: context,
                  initialTime: _selectedEndTime,
                );
                if (selectedTime != null) {
                  setState(() {
                    _selectedEndTime = selectedTime;
                  });
                }
              },
              child: Text(_selectedEndTime.format(context)),
            ),
          ],
        ),
      ],
    );
  }
}
