import 'package:flutter/material.dart';

class LocationSelectionWidget extends StatefulWidget {
  final ValueChanged<String>? onStateSelected;
  final ValueChanged<String>? onCitySelected;
  final ValueChanged<String>? onAreaSelected;

  const LocationSelectionWidget({
    Key? key,
    this.onStateSelected,
    this.onCitySelected,
    this.onAreaSelected,
  }) : super(key: key);

  @override
  _LocationSelectionWidgetState createState() =>
      _LocationSelectionWidgetState();
}

class _LocationSelectionWidgetState extends State<LocationSelectionWidget> {
  String _selectedState = '';
  String _selectedCity = '';
  String _selectedArea = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Select State:'),
        DropdownButton<String>(
          value: _selectedState,
          onChanged: (newValue) {
            setState(() {
              _selectedState = newValue!;
              widget.onStateSelected?.call(newValue);
            });
          },
          items: <String>[
            'State 1',
            'State 2',
            'State 3'
          ] // Replace with your states list
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        SizedBox(height: 20),
        Text('Select City:'),
        DropdownButton<String>(
          value: _selectedCity,
          onChanged: (newValue) {
            setState(() {
              _selectedCity = newValue!;
              widget.onCitySelected?.call(newValue);
            });
          },
          items: <String>[
            'City 1',
            'City 2',
            'City 3'
          ] // Replace with your cities list
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        SizedBox(height: 20),
        Text('Select Area:'),
        DropdownButton<String>(
          value: _selectedArea,
          onChanged: (newValue) {
            setState(() {
              _selectedArea = newValue!;
              widget.onAreaSelected?.call(newValue);
            });
          },
          items: <String>[
            'Area 1',
            'Area 2',
            'Area 3'
          ] // Replace with your areas list
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }
}
