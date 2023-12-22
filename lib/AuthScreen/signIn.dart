import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports2/AuthScreen/forgetScreen.dart';
import 'package:sports2/NewScreen/forgetPassScreen.dart';
import 'package:sports2/NewScreen/homeCenter.dart';
import 'package:sports2/helper/theme.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

final lightGrey = Colors.grey[300]!;
final socialIconList = [
  'assets/img/google_logo.png',
  'assets/img/facebook_logo.png',
  'assets/img/twitter_logo.png',
];

class _SignInScreenState extends State<SignInScreen> {
  // final SocialIconsController controller = Get.put(SocialIconsController());
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = false;
  bool _isChecked = false;

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    // Email format validation using a regular expression
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }

    // Password policy with regex pattern
    final passwordRegExp = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*()_+={}\[\]|;:",.<>?`~]).{8,}$');

    if (!passwordRegExp.hasMatch(value)) {
      return 'Password should be at least 8 characters long and include at least one uppercase letter, one lowercase letter, one digit, and one special character';
    }
    return null;
  }

  void _signIn() {
    String? emailError = validateEmail(_emailController.text);
    String? passwordError = validatePassword(_passwordController.text);

    if (emailError == null && passwordError == null) {
      // Validation successful, proceed with your logic
      Get.to(() => Homescreen());
      // For instance, call a function or navigate to another screen
    } else {
      // Validation failed
      // Handle validation errors or show error messages
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(emailError ??
              passwordError ??
              'Please fill in all required fields correctly.'),
          duration: Duration(seconds: 2),
          backgroundColor: AppColors.orange,
        ),
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Dark white background
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Sign In to ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                // fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'SPORT BUDDY',
              style: TextStyle(
                color: AppColors.orange, //
                fontSize: 20.0,
                // fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white, // Orange app bar
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                'Email', // Heading for Email field
                style: TextStyle(
                  fontSize: 16.0,
                  //fontWeight: FontWeight.bold,
                  color: Colors.black, // Set the color for the heading text
                ),
              ),
              SizedBox(
                  height:
                      8), // Add space between the heading and the TextFormField
              Material(
                elevation: 3, // Elevation for the 3D effect
                borderRadius: BorderRadius.circular(15.0),
                child: TextFormField(
                  validator: validateEmail,
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.orange,
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
              ),

              SizedBox(
                  height:
                      20), // Add space between the email and password fields
              Text(
                'Password', // Heading for Password field
                style: TextStyle(
                  fontSize: 16.0,
                  // fontWeight: FontWeight.bold,
                  color: Colors.black, // Set the color for the heading text
                ),
              ),
              SizedBox(
                  height:
                      8), // Add space between the heading and the TextFormField
              Material(
                elevation: 3, // Elevation for the 3D effect
                borderRadius: BorderRadius.circular(15.0),
                child: TextFormField(
                  validator: validatePassword,
                  controller: _passwordController,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    hintText: 'Enter your password',
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.orange, //
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.orange,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        // Toggle password visibility
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(() => ForgetPasswordScreen());
                    },
                    child: Text(
                      'Forget Password?', // Heading for Password field
                      style: TextStyle(
                        fontSize: 16.0,
                        // fontWeight: FontWeight.bold,
                        color: AppColors
                            .orange, //  // Set the color for the heading text
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),

              //////////////////////////////////////////////////////////////////////
              GestureDetector(
                onTap: () {
                  if (_isChecked) {
                    _signIn();
                  } else {
                    // Show an alert or message prompting the user to accept terms and conditions
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(
                            'Accept T&C',
                            style: TextStyle(color: Colors.black),
                          ),
                          content: Text(
                            'Please accept the terms and conditions.',
                            style: TextStyle(color: Colors.black),
                          ),
                          backgroundColor:
                              Colors.white, // Set the background color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        offset: Offset(0, 4),
                        blurRadius: 10.0,
                      ),
                    ],
                    color: _isChecked ? AppColors.orange : Colors.grey,
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: Center(
                      child: Text(
                        'Sign in',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10),
              Row(
                children: [
                  Checkbox(
                    value: _isChecked,
                    activeColor: AppColors.orange,
                    onChanged: (value) {
                      setState(() {
                        _isChecked = value!;
                      });
                    },
                  ),
                  Text('I accept the terms and conditions'),
                ],
              ),
              //////////////////////////////////////////////////////////////////////
              // GestureDetector(
              //   // onTap: () {
              //   //   // Your logic here
              //   // },
              //   onTap: _signIn,
              //   child: Container(
              //     height: 50,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(8.0),
              //       boxShadow: [
              //         BoxShadow(
              //           color: Colors.black54,
              //           offset: Offset(0, 4),
              //           blurRadius: 10.0,
              //         ),
              //       ],
              //     ),
              //     child: Material(
              //       color: AppColors.orange,
              //       borderRadius: BorderRadius.circular(8.0),
              //       elevation: 10.0,
              //       child: Center(
              //         child: Text(
              //           'Sign in',
              //           style: TextStyle(
              //             color: Colors.white,
              //             fontSize: 18.0,
              //             // fontWeight: FontWeight.bold,
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),

              // SizedBox(
              //   height: 10,
              // ),
              // Row(
              //   children: [
              //     Checkbox(
              //       value: false, // Provide logic to manage this checkbox state
              //       onChanged: (value) {
              //         // Handle checkbox changes
              //       },
              //     ),
              //     Text(
              //         'I accept the terms and conditions'), // Text for the checkbox
              //   ],
              // ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Material(
                      elevation:
                          2, // Adjust the elevation for the highlight effect
                      child: Container(
                        height: 1,
                        color: Colors.grey, // Color of the line
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'or continue with',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Material(
                      elevation:
                          2, // Adjust the elevation for the highlight effect
                      child: Container(
                        height: 1,
                        color: Colors.grey, // Color of the line
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  3,
                  (index) => Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Transform(
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.01) // Depth
                        ..rotateX(0.1) // X-Axis rotation
                        ..rotateY(0.1),
                      child: CircleAvatar(
                        backgroundColor: lightGrey,
                        radius: 25,
                        child: Image.asset(
                          socialIconList[index],
                          width: 30,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //     // Add your social media login buttons here
              //     // Example:
              //     IconButton(
              //       icon: Icon(Icons.facebook), // Facebook icon
              //       onPressed: () {
              //         // Logic for Facebook login
              //       },
              //     ),
              //     IconButton(
              //       icon: Icon(Icons.facebook), // Twitter icon
              //       onPressed: () {
              //         // Logic for Twitter login
              //       },
              //     ),
              //     IconButton(
              //       icon: Icon(Icons.facebook), // Google icon
              //       onPressed: () {
              //         // Logic for Google login
              //       },
              //     ),
              //   ],
              // ), // Add space
            ],
          ),
        ),
      ),
    );
  }
}
