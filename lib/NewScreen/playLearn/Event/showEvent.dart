import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_share/social_share.dart';
import 'package:sports2/NewScreen/playLearn/Event/test.dart';
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

  ScreenshotController screenshotController = ScreenshotController();

  /*************************************************************************/
  // Example event details
  String eventName = 'Event Name';
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
                  Center(
                    child: Text(
                      eventName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 15.0),
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
                        ' $eventLocation',
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Participants Age Group',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          // fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        '18 - 40 years',
                        style: TextStyle(
                            fontSize: 18.0,
                            color: AppColors.orange,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Participants Weight Group',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          // fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        '60 -70 KG',
                        style: TextStyle(
                            fontSize: 18.0,
                            color: AppColors.orange,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Participants Height Group',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          // fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        '146 -147 CM',
                        style: TextStyle(
                            fontSize: 18.0,
                            color: AppColors.orange,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Participants Gender',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          // fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        'Male / Female',
                        style: TextStyle(
                            fontSize: 18.0,
                            color: AppColors.orange,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Participants Level',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          // fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        'Begginer',
                        style: TextStyle(
                            fontSize: 18.0,
                            color: AppColors.orange,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Icon(
                      //   Icons.,
                      //   color: AppColors.orange,
                      // ),
                      Text(
                        'Facilities',
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),

                  // Card(
                  //   elevation: 4,
                  //   margin: EdgeInsets.all(8),
                  //   child: ListTile(
                  //     leading: Icon(Icons.confirmation_num_sharp, size: 40),
                  //     title: Text("facility"),
                  //   ),
                  // ),
                  // Card(
                  //   elevation: 4,
                  //   margin: EdgeInsets.all(8),
                  //   child: ListTile(
                  //     leading: Icon(Icons.confirmation_num_sharp, size: 40),
                  //     title: Text("facility"),
                  //   ),
                  // ),
                  SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: GestureDetector(
                      onTap: () {
                        _getImage();
                      },
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 233, 205, 163),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: _imageFile != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image.file(
                                      _imageFile!,
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: 200,
                                    ),
                                  )
                                : const Center(
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 60,
                                      child: Icon(
                                        Icons.person,
                                        size: 60,
                                        color: Colors.orange,
                                      ),
                                    ),
                                  ),
                          ),
                          Positioned(
                            bottom: 16,
                            right: 16,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 200, 243, 239),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.edit,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Twitter",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      SizedBox(width: 40),
                      ElevatedButton(
                        child: Icon(Icons.text_fields),
                        onPressed: () async {
                          if (_selectedImagePath != null) {
                            SocialShare.shareTwitter(
                              "Your tweet content here", // Tweet text
                              // imagePath:
                              //     _selectedImagePath!, // Use the selected image path
                              hashtags: [
                                "Crux",
                                "InvestingStartup",
                                "Startup",
                                "University"
                              ],
                              url: "https://crux.center/Team.html",
                              trailingText: "Cool way to get in touch",
                            ).then((data) {
                              print(data);
                            });
                          } else {
                            // Handle the case when no image is selected
                            print("No image selected");
                          }
                        },
                      ),
                    ],
                  ),

                  SizedBox(height: 24.0),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => MyApp());
                      },
                      child: Text('Register'),
                    ),
                  ),
                  SizedBox(
                    height: 20,
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
}
