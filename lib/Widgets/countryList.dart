import 'package:flutter/material.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:sports2/helper/theme.dart';

class CountryPickerWidget extends StatelessWidget {
  final ValueChanged<CountryCode?> onChanged;

  const CountryPickerWidget({Key? key, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Country',
          style: TextStyle(
            color: AppColors.orange,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 60,
                // padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8),
                    CountryListPick(
                      appBar: AppBar(
                        title: Text(
                          'Choose Country',
                          style: TextStyle(
                              color: AppColors.orange,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      theme: CountryTheme(
                        isShowFlag: true,
                        isShowTitle: true,
                        isShowCode: false,
                        isDownIcon: false,
                        showEnglishName: true,
                      ),
                      initialSelection: '+91',
                      onChanged: onChanged,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
