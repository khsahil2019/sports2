import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sports2/Controller/authCotroller.dart';
import 'package:sports2/Testing/Coach/detailPage.dart';
import 'package:sports2/Testing/notification.dart';
import 'package:sports2/Testing/searchScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? username;
  String? email;
  String? password;
  String? number;
  String? address;
  String? usertype;

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

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

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Clear the stored token or any other user-related data
    prefs.remove('jwt_token');
    prefs.remove('name');
    prefs.remove('email');
    prefs.remove('address');
    prefs.remove('password');
    // Clear other stored user data if needed
    // prefs.remove('other_data_key');

    // Optionally, navigate back to the login screen or perform any additional actions
    // For example:
    // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final userData = Get.arguments;

    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    userData != null
                        ? Text(
                            'Welcome, ${userData['name']}',
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          )
                        : SizedBox(),
                    SizedBox(height: 5.0),
                    Text(
                      'Lets have fun and be Healthy!',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    // logout();
                    Get.to(() => NotificationScreen());
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    child: Icon(
                      Icons.notifications,
                      size: 30,
                      color: Colors.blue,
                    ),
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(10.0),
                    //   image: const DecorationImage(
                    //     image: NetworkImage(
                    //         'https://cdn.pixabay.com/photo/2015/05/18/23/53/norway-772991__340.jpg'),
                    //     fit: BoxFit.cover,
                    //   ),
                    //   boxShadow: const [
                    //     BoxShadow(
                    //         color: Colors.black54,
                    //         offset: Offset(0.0, 4),
                    //         blurRadius: 10.0)
                    //   ],
                    // ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          //window for search
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: GestureDetector(
              onTap: () {
                Get.to(() => SearchSportsScreen());
              },
              child: Container(
                height: 50.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFEFEDEE),
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0.0, 10.0),
                        blurRadius: 10.0)
                  ],
                ),
                child: Row(
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Icon(
                        Icons.search,
                        size: 30.0,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 60.0,
                      width: MediaQuery.of(context).size.width * 0.50,
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search for Sport',
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16.0,
                            color: Colors.grey.withOpacity(0.8),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          //popular hotel
          const SizedBox(
            height: 30.0,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              'Popular Sportsman',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0),
            ),
          ),
          const SizedBox(
            height: 20,
          ),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              height: 300,
              child: Row(
                children: [
                  for (var coach in authController.coaches)
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10.0),
                      height: 380,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0.0, 4.0),
                            blurRadius: 10.0,
                          )
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: 140.0,
                            width: 170.0,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                              ),
                              image: DecorationImage(
                                image:
                                    AssetImage("assets/img/sportfootball.jpeg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            child: Text(
                              coach["name"].toString(),
                              style: const TextStyle(fontSize: 14.0),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              coach["sport_speciality"].toString(),
                              style: const TextStyle(
                                  fontSize: 13.0, color: Colors.grey),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10.0, right: 10.0, top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  coach["charges_per_hour"].toString() +
                                      " Rs/hours",
                                  style: const TextStyle(color: Colors.blue),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors
                                    .white, // Change the background color here
                                // Other properties you might want to adjust:
                                onPrimary: Colors.purple, // Foreground color
                                // padding: EdgeInsets.all(16.0), // Padding around the button
                                // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)), // Border shape
                              ),
                              //  style: ButtonStyle(iconColor: white),
                              onPressed: () {
                                print(coach);
                                Get.to(() => CoachDetailScreen(),
                                    arguments: coach);
                              },
                              child: Text(
                                'View Details',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                userData["usertype"] == "std"
                    ? Text(
                        'Recommended Lands',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w600),
                      )
                    : SizedBox(),
                Text(
                  'view all',
                  style: TextStyle(fontSize: 18.0, color: Colors.blue),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),

          //Text(authController.lenders.length.toString()),
          //for (var x in authController.lenders)
        ],
      ),
    );
  }
}
