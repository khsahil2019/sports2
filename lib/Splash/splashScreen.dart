import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sports2/Controller/authCotroller.dart';

import 'package:sports2/Registration/userChoice.dart';
import 'package:sports2/Screens/home.dart';
import 'package:sports2/Screens/homeScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      // if (authController.user == null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => Home(),
        ),
      );
      //  } else {
      // Navigator.of(context).pushReplacement(
      //   MaterialPageRoute(
      //     builder: (_) => UserChoiceScreen(),
      //   ),
      // );
      //  }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/img/sportfootball.jpeg',
                  width: 150, height: 150),
              const SizedBox(height: 20),
              const Text(
                'Sports Buddy',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
