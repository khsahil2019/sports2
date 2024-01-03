import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports2/NewScreen/playLearn/Coaches/bookingCoach.dart';
import 'package:sports2/Testing/Coach/bookingScreen.dart';

import 'package:sports2/Widgets/customIconText.dart';
import 'package:sports2/helper/theme.dart';

class CoachDetailScreen extends StatefulWidget {
  const CoachDetailScreen({super.key});

  @override
  State<CoachDetailScreen> createState() => _CoachDetailScreenState();
}

class _CoachDetailScreenState extends State<CoachDetailScreen> {
  // var data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    String phoneNumber = "9978664546";

// Masking the phone number with 'X' characters

    String maskPhoneNumber(String phoneNumber) {
      // Define the number of visible digits at the end (e.g., last 4 digits)
      int visibleDigits = 4;

      // Check if the phone number is long enough to be masked
      if (phoneNumber.length > visibleDigits) {
        // Get the portion of the phone number to be masked
        String maskedPortion =
            phoneNumber.substring(0, phoneNumber.length - visibleDigits);

        // Replace each digit in the masked portion with 'X'
        String maskedDigits = maskedPortion.replaceAll(RegExp(r'\d'), 'X');

        // Get the visible part of the phone number
        String visiblePart =
            phoneNumber.substring(phoneNumber.length - visibleDigits);

        // Combine masked and visible parts
        return maskedDigits + visiblePart;
      } else {
        // If the phone number is too short, return the original number
        return phoneNumber;
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.orange,
        foregroundColor: Colors.white,
        title: Text("Coach Profile"),
      ),
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: ListView(
              children: [
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5), // Shadow color
                            spreadRadius: 5, // Spread radius
                            blurRadius: 7, // Blur radius
                            offset: Offset(0, 3), // Changes position of shadow
                          ),
                        ],
                      ),
                      child: CarouselSlider(
                        options: CarouselOptions(
                          height: 200.0,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          aspectRatio: 16 / 9,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                          viewportFraction: 1,
                        ),
                        items: [
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVaywK6zU53kNX8sIgMRXw77fc9BGa5tGKrQ&usqp=CAU',
                          'https://i0.wp.com/www.thesportscol.com/wp-content/uploads/2017/11/youth-sports-coach.jpg'
                          //'https://i0.wp.com/www.thesportscol.com/wp-content/uploads/2017/11/youth-sports-coach.jpg'
                          // 'https://kabiatravels.com/admin/packageimage/' +
                          //     authController.exoticplaceList[data]
                          //         ["PackageImage"],
                        ]
                            .map((item) => Container(
                                  child: Center(
                                    child: Image.network(
                                      item,
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                    ),
                                    //     Image.asset(
                                    //   item,
                                    //   fit: BoxFit.cover,
                                    //   height: 200.0,
                                    //   width: double.infinity,
                                    // ),
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Manmohan singh",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomIconTextWidget(
                      Icons.location_on,
                      AppColors.orange,
                      30,
                      "Lucknow", // Address text
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomIconTextWidget(Icons.location_city, AppColors.orange,
                        30, "Patel Nagar purvi"),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomIconTextWidget(Icons.currency_rupee_rounded,
                        AppColors.orange, 30, "charges_per_hour"),
                    const SizedBox(
                      height: 15,
                    ),
                    const Row(
                      children: [
                        Text(
                          "Contact",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomIconTextWidget(
                      Icons.phone,
                      AppColors.orange,
                      30,
                      maskPhoneNumber(phoneNumber), // Address text
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomIconTextWidget(
                      Icons.person_3,
                      AppColors.orange,
                      30,
                      "sahil khan", // Address text
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomIconTextWidget(
                      Icons.person_3_outlined,
                      AppColors.orange,
                      30,
                      "Male", // Address text
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomIconTextWidget(
                      Icons.email,
                      AppColors.orange,
                      30,
                      "sahl@gmail.com", // Address text
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    heading("Facilities"),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomIconTextWidget(
                      Icons.folder_special,
                      AppColors.orange,
                      30,
                      "facilitise", // Address text
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomIconTextWidget(
                      Icons.agriculture,
                      AppColors.orange,
                      30,
                      "20 -30", // Address text
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomIconTextWidget(
                      Icons.wheelchair_pickup,
                      AppColors.orange,
                      30,
                      "yes", // Address text
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomIconTextWidget(
                      Icons.explore_outlined,
                      AppColors.orange,
                      30,
                      "Experienece ", // Address text
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomIconTextWidget(
                      Icons.person,
                      AppColors.orange,
                      30,
                      "Male/Female", // Address text
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    heading("Skills"),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomIconTextWidget(
                      Icons.folder_special,
                      AppColors.orange,
                      30,
                      "Hockey", // Address text
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomIconTextWidget(
                      Icons.folder_special,
                      AppColors.orange,
                      30,
                      "Extra comedy", // Address text
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Availibilty",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "See Availibilty",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: AppColors.orange),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomIconTextWidget(
                      Icons.calendar_month,
                      AppColors.orange,
                      30,
                      "Schedule", // Address text
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomIconTextWidget(
                      Icons.lock_clock,
                      AppColors.orange,
                      30,
                      "12:30 PM - 01:45 PM", // Address text
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomIconTextWidget(Icons.app_registration,
                        AppColors.orange, 30, "12/12/2023"
                        // Address text
                        ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Courses",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "See Availibilty",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: AppColors.orange),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 15,
                    ),
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [courseSet(), courseSet(), courseSet()],
                        )),

                    // Text(data.toString()),
                    /**First Column End */
                  ],
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GestureDetector(
          onTap: () {
            String startTime = "12:00"; // Replace with actual start time
            String endTime = "23:45";
            Map<String, String> scheduleData = {
              'time_schedule': startTime,
              'endtime_schedule': endTime,
            };
            print(scheduleData);
            Get.to(() => CoachBookingScreen(), arguments: scheduleData);
          },
          child: Container(
            height: 40,
            // padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(38.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  offset: Offset(0, 4),
                  blurRadius: 10.0,
                ),
              ],
              color: AppColors.orange,
            ),
            child: Material(
              color: Colors.transparent,
              child: Center(
                child: Text(
                  'Book',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget courseSet() {
    return SizedBox(
      height: 350,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            height: 400,
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
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.blue,
                        Colors.green,
                        Colors.orange,
                        Colors.red,
                      ],
                      stops: [
                        0.0,
                        0.3,
                        0.7,
                        1.0
                      ], // Adjust the color stops as needed
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxnkwslNktO5dTDmwa-d7He5moxbAJx-5eo2EMk0VLvw&s"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child: Center(
                    child: Text(
                      "Course Name",
                      style: const TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "This is sport xiaching ehere we start from basic",
                    style: const TextStyle(fontSize: 13.0, color: Colors.black),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, right: 10.0, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Duration : 12 Days",
                        style: const TextStyle(
                            color: Colors.orange, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, right: 10.0, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Price :  120",
                        style: const TextStyle(
                            color: Colors.orange, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, right: 10.0, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Start Date : 12/11/2023",
                        style: const TextStyle(
                            color: Colors.orange, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),

                // SizedBox(
                //   width: double.infinity,
                //   child: ElevatedButton(
                //     style: ElevatedButton.styleFrom(
                //       primary: Colors
                //           .white, // Change the background color here
                //       // Other properties you might want to adjust:
                //       onPrimary:
                //           Colors.purple, // Foreground color
                //       // padding: EdgeInsets.all(16.0), // Padding around the button
                //       // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)), // Border shape
                //     ),
                //     //  style: ButtonStyle(iconColor: white),
                //     onPressed: () {
                //       // print(coach);
                //       // Get.to(() => CoachDetailScreen(),
                //       //     arguments: coach);
                //     },
                //     child: Text(
                //       'View Details',
                //       style: TextStyle(color: Colors.blue),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget heading(String text) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
