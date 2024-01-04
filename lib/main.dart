import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sports2/Controller/allbindings.dart';
import 'package:sports2/Services/app_deeplink.dart';
import 'package:sports2/Splash/splashScreen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Permission.storage.request();

  // await Supabase.initialize(
  //   url: 'https://pgdznplcabrkstnyxrzv.supabase.co',
  //   anonKey:
  //       'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBnZHpucGxjYWJya3N0bnl4cnp2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDQzNTM5MTgsImV4cCI6MjAxOTkyOTkxOH0.MKUBiF8TlLe5vMA4BS09ukoJfgoPENFVDNyoOjwdXSI',
  // ).then((value) {
  //   log("superbase setup complete======================");
  //   log(value.client.toString());
  // });

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
/****************************************************************************/
