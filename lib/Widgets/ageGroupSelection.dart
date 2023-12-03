import 'package:flutter/material.dart';

class AgeGroupSelection extends StatefulWidget {
  @override
  _AgeGroupSelectionState createState() => _AgeGroupSelectionState();
}

class _AgeGroupSelectionState extends State<AgeGroupSelection> {
  Map<String, bool> _ageGroups = {
    'Kids (6-12)': false,
    'Teenagers (13-18)': false,
    'Young Adults (19-30)': false,
    'Adults (31-50)': false,
    'Seniors (50+)': false,
  };

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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _ageGroups.keys.map((String ageGroup) {
            return CheckboxListTile(
              title: Text(ageGroup),
              value: _ageGroups[ageGroup],
              onChanged: (bool? value) {
                setState(() {
                  _ageGroups[ageGroup] = value ?? false;
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
