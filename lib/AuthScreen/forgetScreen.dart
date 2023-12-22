import 'package:flutter/material.dart';
import 'package:sports2/helper/theme.dart';

class ForgetPasswordScreen extends StatefulWidget {
  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Dark white background
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Forgot Password ?',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
          ),
        ),
        backgroundColor: Colors.white, // White app bar
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Please enter your email address to receive verification code',
                    style: TextStyle(color: Colors.grey),
                  ),
                ), // Text for the checkbox
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Email', // Heading for Email field
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black, // Set the color for the heading text
              ),
            ),
            SizedBox(
                height:
                    8), // Add space between the heading and the TextFormField
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'Enter your email',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.orange,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.orange,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              ),
            ),
            SizedBox(
                height: 40), // Add space between the email field and the button
            GestureDetector(
              onTap: () {
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
                    'Send Email',
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
