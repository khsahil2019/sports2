import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports2/Testing/Coach/bookingScreen.dart';

import 'package:sports2/Widgets/customIconText.dart';

class CoachDetailScreen extends StatefulWidget {
  const CoachDetailScreen({super.key});

  @override
  State<CoachDetailScreen> createState() => _CoachDetailScreenState();
}

class _CoachDetailScreenState extends State<CoachDetailScreen> {
  var data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    String phoneNumber = data["number"];

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
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: ListView(
              children: [
                Column(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 200.0,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        aspectRatio: 16 / 9,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        viewportFraction: 0.7,
                      ),
                      items: [
                        'assets/img/sportfootball.jpeg',
                        'assets/img/sportfootball.jpeg'
                        // 'https://kabiatravels.com/admin/packageimage/' +
                        //     authController.exoticplaceList[data]
                        //         ["PackageImage"],
                      ]
                          .map((item) => Container(
                                child: Center(
                                  child:
                                      //  Image.network(
                                      //   item,
                                      //   width: double.infinity,
                                      // ),
                                      Image.asset(
                                    item,
                                    fit: BoxFit.cover,
                                    height: 400.0,
                                    width: double.infinity,
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          data["name"].toString(),
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
                      Colors.blue,
                      30,
                      data["address"].toString(), // Address text
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomIconTextWidget(
                        Icons.location_city,
                        Colors.blue,
                        30,
                        data["location"].toString() +
                            " - " +
                            data["city"].toString() +
                            " , " +
                            data["state"].toString() +
                            " , " +
                            data["country"].toString() + // Address text
                            " , " +
                            data["pincode"].toString() // Address text
                        ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomIconTextWidget(
                      Icons.currency_rupee_rounded,
                      Colors.blue,
                      30,
                      data["charges_per_hour"].toString() +
                          " /hours", // Address text
                    ),
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
                      Colors.blue,
                      30,
                      maskPhoneNumber(phoneNumber), // Address text
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomIconTextWidget(
                      Icons.person_3,
                      Colors.blue,
                      30,
                      data["name"].toString(), // Address text
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomIconTextWidget(
                      Icons.person_3_outlined,
                      Colors.blue,
                      30,
                      data["gender"].toString(), // Address text
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomIconTextWidget(
                      Icons.email,
                      Colors.blue,
                      30,
                      data["email"].toString(), // Address text
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
                      Colors.blue,
                      30,
                      data["sport_speciality"].toString(), // Address text
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomIconTextWidget(
                      Icons.agriculture,
                      Colors.blue,
                      30,
                      data["age_group"].toString(), // Address text
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomIconTextWidget(
                      Icons.wheelchair_pickup,
                      Colors.blue,
                      30,
                      data["pickdrop_facility"].toString(), // Address text
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomIconTextWidget(
                      Icons.explore_outlined,
                      Colors.blue,
                      30,
                      data["exp_level"].toString(), // Address text
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomIconTextWidget(
                      Icons.person,
                      Colors.blue,
                      30,
                      "Preferred gender " +
                          data["pref_gender"].toString(), // Address text
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
                      Colors.blue,
                      30,
                      data["specific_skills"].toString(), // Address text
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomIconTextWidget(
                      Icons.folder_special,
                      Colors.blue,
                      30,
                      data["extra"].toString(), // Address text
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
                              color: Colors.blue),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomIconTextWidget(
                      Icons.calendar_month,
                      Colors.blue,
                      30,
                      data["day_schedule"].toString(), // Address text
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomIconTextWidget(
                      Icons.lock_clock,
                      Colors.blue,
                      30,
                      data["time_schedule"] +
                          " - " +
                          data["endtime_schedule"], // Address text
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomIconTextWidget(Icons.app_registration, Colors.blue,
                        30, data["registration_date"]
                        // Address text
                        ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Text(data.toString()),
                    /**First Column End */
                  ],
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        // color: Colors.grey[200],
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              Colors.blue, // Replace with your desired color
            ),
          ),
          onPressed: () {
            Map<String, String> scheduleData = {
              'time_schedule': data["time_schedule"],
              'endtime_schedule': data["endtime_schedule"],
            };
            print(scheduleData);
            Get.to(() => BookingScreen(), arguments: scheduleData);
          },
          child: const Text(
            'Book Now',
            style: TextStyle(color: Colors.white),
          ),
        ),
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
