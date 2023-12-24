import 'package:flutter/material.dart';

import 'package:sports2/helper/theme.dart';

class OTPVerificationScreen extends StatefulWidget {
  @override
  _OTPVerificationScreenState createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  List<TextEditingController> _controllers = [];

  @override
  void initState() {
    super.initState();
    // Initialize four controllers for the OTP input fields
    for (int i = 0; i < 4; i++) {
      _controllers.add(TextEditingController());
    }
  }

  @override
  void dispose() {
    // Dispose all the controllers when the widget is disposed
    _controllers.forEach((controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'OTP Verification',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          //  mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Please enter 4 digit code sent to your email',
                    style: TextStyle(color: Colors.black),
                  ),
                ), // Text for the checkbox
              ],
            ),
            // Text(
            //   'Enter 4-digit OTP code',
            //   style: TextStyle(
            //     fontSize: 18.0,
            //     color: Colors.black,
            //   ),
            // ),
            SizedBox(height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                4,
                (index) => Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.orange, width: 2),
                  ),
                  alignment: Alignment.center,
                  child: TextFormField(
                    controller: _controllers[index],
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                      counterText: '', // Hide the character counter
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                    onChanged: (value) {
                      // Implement logic to handle OTP entry
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            // ElevatedButton(
            //   onPressed: () {
            //     // Implement logic to verify OTP
            //     String otp = '';
            //     _controllers.forEach((controller) {
            //       otp += controller.text;
            //     });
            //     print('Entered OTP: $otp');
            //     // Implement your logic to verify the entered OTP here
            //   },
            //   child: Text(
            //     'Verify OTP',
            //     style: TextStyle(color: Colors.white),
            //   ),
            //   style: ElevatedButton.styleFrom(
            //     primary: Colors.orange,
            //     padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(30),
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'If you donot receive the code?',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12.0,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  ' Resend',
                  style: TextStyle(
                    color: AppColors.orange, //
                    fontSize: 14.0,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                String otp = '';
                _controllers.forEach((controller) {
                  otp += controller.text;
                });
                print('Entered OTP: $otp');
                // Logic for forget password button
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.orange,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(
                  child: Text(
                    'Verify',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
