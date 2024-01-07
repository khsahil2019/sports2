import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports2/NewScreen/playLearn/PlayGround/bookingPlay.dart';

import 'package:sports2/Widgets/customIconText.dart';
import 'package:sports2/helper/theme.dart';

class PlayGroundDetailScreen extends StatefulWidget {
  const PlayGroundDetailScreen({super.key});

  @override
  State<PlayGroundDetailScreen> createState() => _PlayGroundDetailScreenState();
}

class _PlayGroundDetailScreenState extends State<PlayGroundDetailScreen> {
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
        title: Text("Playgound Detail"),
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
                          'https://media.istockphoto.com/id/843102872/photo/colorful-playground-on-yard-in-the-park.jpg?s=612x612&w=0&k=20&c=JdH1hwKh5TXtDDJNSU91xAJvgm0N9rAkpyI6M5DXODg=',
                          'https://www.shutterstock.com/image-photo/colorful-children-playground-activities-public-260nw-480258076.jpg'
                          // 'https://kabiatravels.com/admin/packageimage/' +
                          //     authController.exoticplaceList[data]
                          //         ["PackageImage"],
                        ]
                            .map((item) => Container(
                                  child: Center(
                                    child: Image.network(
                                      item,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
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
                          "Sports Facility",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    buildMoreDetail(
                      Icons.location_on,
                      'Address 1',
                      'Lucknow',
                    ),
                    SizedBox(height: 20),
                    buildMoreDetail(
                      Icons.location_on,
                      'Address 2',
                      'Hazratganj',
                    ),
                    SizedBox(height: 20),
                    buildMoreDetail(
                      Icons.location_city,
                      'City',
                      'Lucknow',
                    ),
                    SizedBox(height: 20),
                    buildMoreDetail(
                      Icons.pin,
                      'Pincode',
                      '231425',
                    ),
                    SizedBox(height: 20),
                    buildMoreDetail(
                      Icons.currency_rupee_rounded,
                      'Charges (Rs)',
                      '₹ 500/hr',
                    ),
                    const SizedBox(
                      height: 35,
                    ),

                    const Row(
                      children: [
                        Text(
                          "Contact Detail 1",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 35,
                    ),

                    buildMoreDetail(
                      Icons.person,
                      'Contact person Name',
                      "Robert singh",
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    buildMoreDetail(
                      Icons.design_services_sharp,
                      'Designation',
                      "Cricket coach",
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    buildMoreDetail(
                      Icons.phone,
                      'Phone Number',
                      maskPhoneNumber(phoneNumber),
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    buildMoreDetail(
                      Icons.whatshot,
                      'Whatsapp Number',
                      maskPhoneNumber(phoneNumber),
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    buildMoreDetail(
                      Icons.email,
                      'Email Id',
                      "sahilkh@gmail.com",
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 35,
                    ),

                    const Row(
                      children: [
                        Text(
                          "Contact Detail 2",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 35,
                    ),

                    buildMoreDetail(
                      Icons.person,
                      'Contact person Name',
                      "Seroin singh",
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    buildMoreDetail(
                      Icons.design_services_sharp,
                      'Designation',
                      "Badminton coach",
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    buildMoreDetail(
                      Icons.phone,
                      'Phone Number',
                      maskPhoneNumber(phoneNumber),
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    buildMoreDetail(
                      Icons.whatshot,
                      'Whatsapp Number',
                      maskPhoneNumber(phoneNumber),
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    buildMoreDetail(
                      Icons.email,
                      'Email Id',
                      "sahilkhan786@gmail.com",
                    ),

                    const SizedBox(
                      height: 35,
                    ),

                    const Row(
                      children: [
                        Text(
                          "Distance from various places",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 35,
                    ),

                    buildMoreDetail(
                      Icons.train,
                      'From Railway Station',
                      "12.5 KM",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    buildMoreDetail(
                      Icons.location_city,
                      'From City Center',
                      "2.0 KM",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    buildMoreDetail(
                      Icons.local_airport,
                      'From Airport',
                      "15.7 KM",
                    ),
                    const SizedBox(
                      height: 35,
                    ),

                    const Row(
                      children: [
                        Text(
                          "Various Facilities",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    buildMoreDetail(
                      Icons.area_chart,
                      'Area of Ground',
                      "2000 sq feet",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    buildMoreDetail(
                      Icons.sports,
                      'Type of Activities/Games',
                      "Indoor and OutDoor",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    buildMoreDetail(
                      Icons.campaign,
                      'Indoor Capacity',
                      "2000 people",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    buildMoreDetail(
                      Icons.campaign,
                      'Outdoor Capacity',
                      "1500 people",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    buildMoreDetail(
                      Icons.safety_check,
                      'Safety and Security features',
                      "CCTV Camera\nFire Exit\nPolice Security\nMetal Detector",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    buildMoreDetail(
                      Icons.group,
                      'Facilities for participant',
                      "Snacks\nEnergy Drink\nBurgers\nSweets",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    buildMoreDetail(
                      Icons.face,
                      'Facilities for Attendees',
                      "Snacks\nEnergy Drink\nBurgers\nSweets",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    buildMoreDetail(
                      Icons.schedule,
                      'Avilability Schedule',
                      "Mon - 2:00 PM - 5:00 PM\nTue - 2:00 PM - 5:00 PM\nWed - 2:00 PM - 5:00 PM",
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
            Get.to(() => PlayGroundBookingScreen(), arguments: scheduleData);
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

  Widget buildMoreDetail(IconData icon, String text1, String text2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: AppColors.orange,
            ),
            SizedBox(width: 10),
            Text(
              text1,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          children: [
            SizedBox(width: 35),
            Expanded(
              child: Text(
                text2,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
