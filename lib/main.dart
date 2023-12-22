import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports2/Controller/allbindings.dart';
import 'package:sports2/Splash/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: AuthBinding(),
      title: 'My Flutter App',
      theme: ThemeData(
        fontFamily: 'Outfit',
        primarySwatch: Colors.orange,
      ),
      home: SplashScreen(),
    );
  }
}
