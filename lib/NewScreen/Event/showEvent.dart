import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports2/NewScreen/Event/test.dart';
import 'package:sports2/Services/app_deeplink.dart';
import 'package:sports2/helper/theme.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'package:screenshot/screenshot.dart';

class EventDetailScreen extends StatefulWidget {
  @override
  _EventDetailScreenState createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {
  String facebookId = "xxxxxxxx";

  var imageBackground = "image-background.jpg";
  var videoBackground = "video-background.mp4";
  String imageBackgroundPath = "";
  String videoBackgroundPath = "";

  @override
  void initState() {
    super.initState();
    copyBundleAssets();
  }

  File? _imageFile;
  String? _selectedImagePath; // Variable to store the selected image path

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
        _selectedImagePath = pickedFile.path; // Set the selected image path
      });
    }
  }

  Future<void> copyBundleAssets() async {
    imageBackgroundPath = await copyImage(imageBackground);
    videoBackgroundPath = await copyImage(videoBackground);
  }

  Future<String> copyImage(String filename) async {
    final tempDir = await getTemporaryDirectory();
    ByteData bytes = await rootBundle.load("assets/$filename");
    final assetPath = '${tempDir.path}/$filename';
    File file = await File(assetPath).create();
    await file.writeAsBytes(bytes.buffer.asUint8List());
    return file.path;
  }

  Future<String?> pickImage() async {
    final file = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    var path = file?.path;
    if (path == null) {
      return null;
    }
    return file?.path;
  }

  Future<String?> screenshot() async {
    var data = await screenshotController.capture();
    if (data == null) {
      return null;
    }
    final tempDir = await getTemporaryDirectory();
    final assetPath = '${tempDir.path}/temp.png';
    File file = await File(assetPath).create();
    await file.writeAsBytes(data);
    return file.path;
  }

  Future<String?> captureScreen() async {
    try {
      final imageFile = await screenshotController.capture();
      if (imageFile != null) {
        final directory = (await getApplicationDocumentsDirectory()).path;
        final imagePath = '$directory/screenshot.png';
        File(imagePath).writeAsBytesSync(imageFile);
        return imagePath;
      } else {
        return null;
      }
    } catch (e) {
      print("Error capturing the screen: $e");
      return null;
    }
  }

  ScreenshotController screenshotController = ScreenshotController();

  /*************************************************************************/
  // Example event details
  String eventName = 'Cricket Tournament';
  String eventStartDate = '01/01/2023';
  String eventEndDate = '04/01/2023';
  String eventTime = '10:00 AM';
  String eventLocation = 'Your Event Location';
  String eventDescription =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Event Details',
          style:
              TextStyle(color: AppColors.orange, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1501281668745-f7f57925c3b4?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8ZXZlbnR8ZW58MHx8MHx8fDA%3D'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      "Cricket Tournament",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Start Date: ',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          // fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        '$eventStartDate',
                        style: TextStyle(
                            fontSize: 18.0,
                            color: AppColors.orange,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'End Date: ',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          // fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        '$eventEndDate',
                        style: TextStyle(
                            fontSize: 18.0,
                            color: AppColors.orange,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.location_pin,
                        color: AppColors.orange,
                      ),
                      Text(
                        'Ekana Stadium Lucknow',
                        style: const TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Participant Details',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  buildParticipantDetail(
                    Icons.person,
                    'Age Group',
                    '18 -40 Years',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  buildParticipantDetail(
                    Icons.line_weight,
                    'Weight Group',
                    '60 -70 KG',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  buildParticipantDetail(
                    Icons.height,
                    'Height Group',
                    '146-147 CM',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  buildParticipantDetail(
                    Icons.people,
                    'Gender',
                    'Male/Female',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  buildParticipantDetail(
                    Icons.accessibility_new,
                    'Level',
                    'Beginner',
                  ),

                  SizedBox(
                    height: 30,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'More Details',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  buildMoreDetail(
                    Icons.emoji_events,
                    'Awards',
                    'Winners will get Certificate with cash prize Winners will get Certificate with cash prize',
                  ),
                  SizedBox(height: 20),
                  buildMoreDetail(
                    Icons.info,
                    'Event Purpose',
                    'This is a Community based event',
                  ),
                  SizedBox(height: 20),
                  buildMoreDetail(
                    Icons.people,
                    'Who Can Attend',
                    'Anyone until venue is full(free)',
                  ),
                  SizedBox(height: 20),
                  buildMoreDetail(
                    Icons.wb_sunny,
                    'Dress Code for Participant',
                    'Formal events, choose a dark-colored suit or tuxedo for men and an elegant evening gown or cocktail dress for women',
                  ),
                  SizedBox(height: 20),
                  buildMoreDetail(
                    Icons.wb_sunny,
                    'Dress Code for Attendees',
                    'Not any Specific',
                  ),
                  SizedBox(height: 20),
                  buildMoreDetail(
                    Icons.food_bank_outlined,
                    'Refreshment for the Participant',
                    'Free Snacks',
                  ),
                  SizedBox(height: 20),
                  buildMoreDetail(
                    Icons.food_bank_outlined,
                    'Refreshment for the Attendees',
                    'Energy Drink',
                  ),
                  SizedBox(height: 20),
                  buildMoreDetail(
                    Icons.security,
                    'Security Measures',
                    'CCTV Survelliance\nMetal Detector\nAssisted Exit',
                  ),
                  SizedBox(height: 20),
                  buildMoreDetail(
                    Icons.confirmation_number,
                    'Book Your Ticket/Pass From',
                    'BookMyShow\nAtTheVenue',
                  ),

/************************************************************************************************************/

                  // SizedBox(
                  //   height: 200,
                  //   width: double.infinity,
                  //   child: GestureDetector(
                  //     onTap: () {
                  //       _getImage();
                  //     },
                  //     child: Stack(
                  //       children: [
                  //         Container(
                  //           decoration: BoxDecoration(
                  //             color: const Color.fromARGB(255, 233, 205, 163),
                  //             borderRadius: BorderRadius.circular(16),
                  //           ),
                  //           child: _imageFile != null
                  //               ? ClipRRect(
                  //                   borderRadius: BorderRadius.circular(16),
                  //                   child: Image.file(
                  //                     _imageFile!,
                  //                     fit: BoxFit.cover,
                  //                     width: double.infinity,
                  //                     height: 200,
                  //                   ),
                  //                 )
                  //               : const Center(
                  //                   child: CircleAvatar(
                  //                     backgroundColor: Colors.white,
                  //                     radius: 60,
                  //                     child: Icon(
                  //                       Icons.person,
                  //                       size: 60,
                  //                       color: Colors.orange,
                  //                     ),
                  //                   ),
                  //                 ),
                  //         ),
                  //         Positioned(
                  //           bottom: 16,
                  //           right: 16,
                  //           child: Container(
                  //             padding: const EdgeInsets.all(8),
                  //             decoration: const BoxDecoration(
                  //               color: Color.fromARGB(255, 200, 243, 239),
                  //               shape: BoxShape.circle,
                  //             ),
                  //             child: const Icon(
                  //               Icons.edit,
                  //               color: Colors.black,
                  //             ),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: Text(
                  //         "Twitter",
                  //         style: TextStyle(fontSize: 16),
                  //       ),
                  //     ),
                  //     SizedBox(width: 40),
                  //     ElevatedButton(
                  //       child: Icon(Icons.text_fields),
                  //       onPressed: () async {
                  //         if (_selectedImagePath != null) {
                  //           SocialShare.shareTwitter(
                  //             "Your tweet content here", // Tweet text
                  //             // Use the selected image path
                  //             hashtags: [
                  //               "Crux",
                  //               "InvestingStartup",
                  //               "Startup",
                  //               "University"
                  //             ],
                  //             url: "https://crux.center/Team.html",
                  //             trailingText: "Cool way to get in touch",
                  //           ).then((data) {
                  //             print(data);
                  //           });
                  //         } else {
                  //           // Handle the case when no image is selected
                  //           print("No image selected");
                  //         }
                  //       },
                  //     ),
                  //   ],
                  // ),
                  // // SizedBox(height: 24.0),
                  // Center(
                  //   child: ElevatedButton(
                  //     onPressed: () {
                  //       Get.to(() => DemoApp());
                  //     },
                  //     child: Text('Register'),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  // Center(
                  //   child: ElevatedButton(
                  //     onPressed: () async {
                  //       // Capture the current screen as an image
                  //       String? capturedImagePath = await captureScreen();
                  //       //String? imagePath;

                  //       if (capturedImagePath != null) {
                  //         // Share the captured image on Twitter
                  //         SocialShare.shareTwitter(
                  //           "Your tweet content here", // Tweet text
                  //           // imagePath:
                  //           //     capturedImagePath, // Use the captured image path
                  //           hashtags: [
                  //             "Crux",
                  //             "InvestingStartup",
                  //             "Startup",
                  //             "University"
                  //           ],
                  //           url: "https://crux.center/Team.html",
                  //           trailingText: "Cool way to get in touch",
                  //         ).then((data) {
                  //           print(data);
                  //         });
                  //       } else {
                  //         // Handle the case when capturing the screen fails
                  //         print("Failed to capture the screen");
                  //       }
                  //     },
                  //     child: Text('Share on Twitter'),
                  //   ),
                  // ),
                  /************************************************************************************************************/

                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          print("Press");
                          Map<String, dynamic> url = {
                            "key": "https://www.google.com"
                          };

                          AppDeepLinkService().generateDeepLink(url); //
                          //Get.to(() => EventDetailScreen());
                          //sendCoachRegDataToServer(context);
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                return Colors.orangeAccent;
                              }
                              return AppColors.orange;
                            },
                          ),
                          elevation: MaterialStateProperty.all<double>(5),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                              side: BorderSide(
                                width: 1,
                                color: Colors.grey.shade400,
                              ),
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            'Share Invite',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          print("Press");

                          Get.to(() => DemoApp());
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                return Colors
                                    .orangeAccent; // Adjust color when pressed
                              }
                              return AppColors.orange; // Default color
                            },
                          ),
                          elevation: MaterialStateProperty.all<double>(
                              5), // Elevation for 3D effect
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                              side: BorderSide(
                                width: 1,
                                color: Colors.grey
                                    .shade400, // Border color for 3D effect
                              ),
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            'Social Post',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

/*************************************************************/
  Widget buildParticipantDetail(IconData icon, String text, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              icon,
              color: AppColors.orange,
            ),
            SizedBox(width: 10),
            Text(
              text,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
              ),
            ),
          ],
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 18.0,
            color: AppColors.orange,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

/*************************************************************/
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
