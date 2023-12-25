import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports2/NewScreen/playLearn/Coaches/coachBooking.dart';
import 'package:sports2/Screens/Coach/bookingScreen.dart';

import 'package:sports2/Widgets/customIconText.dart';
import 'package:sports2/helper/theme.dart';

class ShowEventDetailScreen extends StatefulWidget {
  const ShowEventDetailScreen({super.key});

  @override
  State<ShowEventDetailScreen> createState() => _ShowEventDetailScreenState();
}

class _ShowEventDetailScreenState extends State<ShowEventDetailScreen> {
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
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back)),
        backgroundColor: AppColors.orange,
        foregroundColor: Colors.white,
        title: Text("Event Name"),
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
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmXbY1CmIplTlTiNCFhh3DierKS9-huINC5N5bYCe8Jg&s',
                          'https://img.freepik.com/free-photo/sports-tools_53876-138077.jpg?size=626&ext=jpg&ga=GA1.1.1546980028.1703203200&semt=ais'
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
                          "Cricket Tournament",
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
                        AppColors.orange, 30, "Rs-200/player"),
                    const SizedBox(
                      height: 15,
                    ),
                    const Row(
                      children: [
                        Text(
                          "Details",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomIconTextWidget(
                      Icons.date_range,
                      AppColors.orange,
                      30,
                      "29/12/2023 - 01/01/2023", // Address text
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomIconTextWidget(
                      Icons.event_available_outlined,
                      AppColors.orange,
                      30,
                      "Cricket Tournament", // Address text
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomIconTextWidget(
                      Icons.volunteer_activism,
                      AppColors.orange,
                      30,
                      "Male/Female", // Address text
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomIconTextWidget(
                      Icons.youtube_searched_for,
                      AppColors.orange,
                      30,
                      "Age Group 16-22", // Address text
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomIconTextWidget(
                      Icons.ac_unit,
                      AppColors.orange,
                      30,
                      "Team Size 12", // Address text
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomIconTextWidget(
                      Icons.live_tv,
                      AppColors.orange,
                      30,
                      "Beginner", // Address text
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    heading("Facilities"),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomIconTextWidget(
                      Icons.medical_information,
                      AppColors.orange,
                      30,
                      "Medical Facilities Available", // Address text
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
                  'Participate in Event',
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
