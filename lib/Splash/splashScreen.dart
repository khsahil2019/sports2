import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sports2/NewScreen/homeCenter.dart';
import 'package:sports2/NewScreen/playLearn/Coaches/coachDetail.dart';
import 'package:sports2/NewScreen/playLearn/Event/createEvent.dart';
import 'package:sports2/NewScreen/playLearn/Event/showEvent.dart';
import 'package:sports2/NewScreen/playLearn/coachesPlay.dart';
import 'package:sports2/Registration/coachReg.dart';
import 'package:sports2/Registration/placeReg.dart';
import 'package:sports2/Registration/sportsmanReg.dart';
import 'package:sports2/Screens/Event/createEvent.dart';
import 'package:sports2/Screens/Profile/coachProfile.dart';

import 'package:sports2/Screens/home.dart';

import '../OnBoarding/Onboarding.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkLoginStatus();
    loadUserData();
  }

  String? username;
  String? email;
  String? password;
  String? number;
  String? address;
  String? usertype;

  @override
  Future<void> loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('name');
      email = prefs.getString('email');
      password = prefs.getString('password');
      number = prefs.getString('number');
      address = prefs.getString('address');
      usertype = prefs.getString('usertype');
    });
  }

  void checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    Future.delayed(const Duration(seconds: 3), () {
      if (username != null) Text('Username: $username');
      //if(prefs)
      if (isLoggedIn) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => Home(),
          ),
        );
      } else {
        // Navigator.of(context).pushReplacement(
        //   MaterialPageRoute(
        //     builder: (_) => CoachRegistrationScreen(),
        //   ),
        // );
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => CoachDetailScreen(),
          ),
        );
        // Navigator.of(context).pushReplacement(
        //   MaterialPageRoute(
        //     builder: (_) => signinScreen(),
        //   ),
        // );
      }
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
