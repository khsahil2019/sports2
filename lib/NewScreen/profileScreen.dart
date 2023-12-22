import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports2/NewScreen/updateProfile.dart';
import 'package:sports2/helper/theme.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextStyle boldTextStyle =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
  final TextStyle titleTextStyle =
      TextStyle(fontWeight: FontWeight.bold, color: Colors.grey);
  final List<Map<String, dynamic>> clubs = [
    {
      'name': 'Zsquare Team club',
      'image': 'assets/img/onboarding1.png',
      'heading': 'Magansar Besar'
    },
    {
      'name': 'Zsquare Team club',
      'image': 'assets/img/onboarding2.png',
      'heading': 'Magansar Besar'
    },
    {
      'name': 'Zsquare Team club',
      'image': 'assets/img/onboarding3.png',
      'heading': 'Magansar Besar'
    },
    // Add more clubs as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // leading: IconButton(
        //   icon: Icon(
        //     Icons.arrow_back,
        //     color: Colors.white,
        //   ),
        //   onPressed: () {
        //     Navigator.of(context).pop(); // This line navigates back one step
        //   },
        // ),
        backgroundColor: AppColors.orange,
        title: Text(
          'My Profile',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          // IconButton(
          //   icon: Icon(
          //     Icons.edit,
          //     color: Colors.white,
          //   ),
          //   onPressed: () {
          //     // Implement edit functionality
          //   },
          // ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  // Get.to(() => EditProfilePage());
                },
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('assets/img/onboarding1.png'),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'John Doe',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'FootBall is my Dream',
                style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 20),
              ListTile(
                title: Text(
                  'I am a',
                  style: boldTextStyle,
                ),
                subtitle: Text(
                  'Casual player',
                  style: titleTextStyle,
                ),
              ),
              ListTile(
                title: Text(
                  'I play',
                  style: boldTextStyle,
                ),
                subtitle: Text(
                  'Basketball -Beginner skill level \nBadminton -Intermediate skill level',
                  style: titleTextStyle,
                ),
              ),
              ListTile(
                title: Text('Gender', style: boldTextStyle),
                subtitle: Text(
                  'Male',
                  style: titleTextStyle,
                ), // Replace with actual gender
              ),
              ListTile(
                title: Text('Birthday', style: boldTextStyle),
                subtitle: Text(
                  'January 1, 1990',
                  style: titleTextStyle,
                ), // Replace with actual birthday
              ),
              ListTile(
                title: Text('Age', style: boldTextStyle),
                subtitle: Text(
                  '30 years',
                  style: titleTextStyle,
                ), // Replace with actual age
              ),
              ListTile(
                title: Text('Location', style: boldTextStyle),
                subtitle: Text(
                  'Your location',
                  style: titleTextStyle,
                ), // Replace with actual location
              ),
              ListTile(
                title: Text('Joined', style: boldTextStyle),
                subtitle: Text(
                  'Joining date',
                  style: titleTextStyle,
                ), // Replace with actual join date
              ),
              ListTile(
                title: Text('Favorite Sport', style: boldTextStyle),
                subtitle: Text(
                  'Your favorite sport',
                  style: titleTextStyle,
                ), // Replace with actual favorite sport
              ),
              ListTile(
                title: Text('Club', style: boldTextStyle),
                subtitle: Text(
                  'Your club',
                  style: titleTextStyle,
                ), // Replace with actual club
              ),
              // ListTile(
              //   title: Text('Badges', style: boldTextStyle),
              //   subtitle: Text(
              //     'Your badges',
              //     style: titleTextStyle,
              //   ), // Replace with actual badges
              // ),
              // ListTile(
              //   title: Text('Member of', style: boldTextStyle),
              //   subtitle: Text(
              //     'Your memberships',
              //     style: titleTextStyle,
              //   ), // Replace with actual memberships
              // ),
              Row(
                children: [
                  SizedBox(
                    width: 18,
                  ),
                  Text(
                    'Member of Clubs',
                    style: boldTextStyle,
                  ),
                ],
              ),
              SizedBox(height: 10),
              // Container for the list of clubs
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(255, 246, 236, 230),
                      Color.fromARGB(255, 238, 169, 132)
                    ])),

                height: 200, // Adjust the height as needed
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: clubs.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 60,
                              backgroundImage:
                                  AssetImage(clubs[index]['image']),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            clubs[index]['name'],
                            style: boldTextStyle,
                          ),
                          SizedBox(height: 8),
                          Text(
                            clubs[index]['heading'],
                            style: titleTextStyle,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
