import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports2/Controller/authCotroller.dart';
import 'package:sports2/Screens/Coach/detailPage.dart';
import 'package:sports2/Screens/notification.dart';
import 'package:sports2/Screens/searchScreen.dart';

class Hotel {
  String? imageUrl;
  String? title;
  String? description;
  int? price;
  double? rating;

  Hotel({this.description, this.imageUrl, this.price, this.rating, this.title});
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
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
                    Text(
                      "sahil khan",
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
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
              children: const <Widget>[
                Text(
                  'Recommended Lands',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                ),
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
