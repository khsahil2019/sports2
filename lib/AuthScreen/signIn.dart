import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sports2/Registration/userChoice.dart';
import 'package:sports2/Services/apiService.dart';

class signinScreen extends StatefulWidget {
  const signinScreen({super.key});

  @override
  State<signinScreen> createState() => _signinScreenState();
}

class _signinScreenState extends State<signinScreen> {
  bool rememberMe = false;
  bool _isPasswordHidden = true;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  String? username;
  String? email;
  String? password;
  String? number;
  String? address;
  String? usertype;

  @override
  void initState() {
    super.initState();
    _retrieveSavedCredentials(); // Retrieve saved credentials when the screen initializes
  }

  void _retrieveSavedCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _emailController.text = prefs.getString('savedEmail') ?? '';
      _passController.text = prefs.getString('savedPassword') ?? '';
      rememberMe = prefs.getBool('rememberMe') ?? false;
    });
  }

  void _saveCredentials(String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('savedEmail', email);
    prefs.setString('savedPassword', password);
    prefs.setBool('rememberMe', true);
  }

  bool _isLoading = false;

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });

    final String email = _emailController.text;
    final String password = _passController.text;

    final Map<String, dynamic>? response =
        await ApiService.loginUser(email, password);

    setState(() {
      _isLoading = false;
    });

    if (response != null) {
      // Successful login
      if (rememberMe) {
        _saveCredentials(email, password);
      }
      // Map<String, dynamic> responseBody = json.decode(response.toString());

      // // Access specific fields and print them
      // if (responseBody.containsKey('id')) {
      // print('User ID: ${responseBody['id'].toString()}');
      // }
      // if (responseBody.containsKey('username')) {
      //   print('Username: ${responseBody['username'].toString()}');
      // }
      // if (responseBody.containsKey('email')) {
      //   print('Email: ${responseBody['email'].toString()}');
      // }
      print('Login successful! User ID: ${response['id']}');
      // Navigate to the home screen or perform necessary actions
    } else {
      // Handle login failure
      print('Login failed!');
      // Show error message or perform appropriate action
    }
  }

  // Future<void> loadUserData() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     username = prefs.getString('name');
  //     email = prefs.getString('email');
  //     password = prefs.getString('password');
  //     number = prefs.getString('number');
  //     address = prefs.getString('address');
  //     usertype = prefs.getString('usertype');
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white, // Set back button color to white
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        iconTheme: const IconThemeData(
            color: Colors.white), // Set general icon color to white
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/img/sportfootball.jpeg', // replace with your logo asset
                height: 100,
              ),
              const SizedBox(height: 20),
              if (username != null) Text('Username: $username'),
              if (email != null) Text('Email: $email'),
              if (password != null) Text('Password: $password'),
              if (password != null) Text('UserType: $usertype'),
              if (password != null) Text('number: $number'),
              if (password != null) Text('address: $address'),
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily:
                      'MyFlutterApp', // Replace 'YourCustomFont' with your desired font family
                ),
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: Colors.grey,
                  ),
                ),
                child: TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.email),
                    border: InputBorder.none,
                    labelText: 'Email',
                    hintText: 'Enter your email',
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: Colors.grey,
                  ),
                ),
                child: TextFormField(
                  controller: _passController,
                  obscureText: _isPasswordHidden,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordHidden
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordHidden = !_isPasswordHidden;
                        });
                      },
                    ),
                    icon: const Icon(Icons.security),
                    border: InputBorder.none,
                    labelText: 'Password',
                    hintText: 'Enter your Password',
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Switch(
                        value: rememberMe,
                        onChanged: (value) {
                          setState(() {
                            rememberMe = value;
                          });
                        },
                      ),
                      const Text('Remember Me'),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      // navigate to forgot password screen
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width - 180,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                  ),
                  onPressed: _isLoading ? null : _login,
                  child: _isLoading
                      ? const CircularProgressIndicator() // Show loading indicator when loading
                      : Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text('Login',
                              style: TextStyle(color: Colors.white)),
                        ),
                ),
              ),

              /****************************/
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("OR")],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? "),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => UserChoiceScreen());
                    },
                    child: const Text(
                      "Register Now",
                      style: TextStyle(color: Colors.blue),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
