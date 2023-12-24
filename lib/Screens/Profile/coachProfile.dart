import 'package:flutter/material.dart';
import 'package:sports2/helper/theme.dart';

class CoachProfileScreen extends StatefulWidget {
  @override
  _CoachProfileScreenState createState() => _CoachProfileScreenState();
}

class _CoachProfileScreenState extends State<CoachProfileScreen> {
  // Define variables for coach details
  String coachName = 'Mohammad Salim';
  String designation = 'Fitness Coach';
  int age = 30;
  String quotes = 'Success is a journey, not a destination.';
  final double experienceLevel = 6;
  // Define variables for professional details
  String bio =
      'A coach bio is a brief introduction that provides potential clients with insights into a coach\'s expertise, experience, and coaching philosophy.';
  String goalsAndNeeds =
      'As a coach, I aim to inspire people to achieve their fitness goals while addressing their unique needs.';
  String motivations =
      'I am motivated by the progress and achievements of my clients.';
  String technologies =
      'I leverage modern technologies to enhance training sessions.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coach Profile'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Personal details section
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Coach image
                CircleAvatar(
                  backgroundColor: Colors.orange,
                  radius: 50,
                  child: Icon(
                    Icons.person,
                    size: 60,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      coachName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      designation,
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Age: $age',
                    ),
                    SizedBox(height: 5),
                    SizedBox(
                      width: 200,
                      child: Text(
                        '"$quotes"',
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.orange,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Divider(
              height: 1,
              color: Colors.grey,
              indent: 20,
              endIndent: 20,
            ), // Divider between sections
            SizedBox(height: 20),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'About - ',
                    style: TextStyle(
                        color: Colors.orange,
                        fontFamily: "Outfit",
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: bio,
                    style: TextStyle(color: Colors.black, fontFamily: "Outfit"),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            // Professional details section (on the right side)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Speciality',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        bio,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Goals and Needs',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        goalsAndNeeds,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Motivations',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        motivations,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Technologies',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        technologies,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Divider(
              height: 1,
              color: Colors.grey,
              indent: 20,
              endIndent: 20,
            ), // Divider between sections
            SizedBox(height: 20),
            Text(
              'Experience Level: $experienceLevel',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ), // Show value as text
            Slider(
              activeColor: Colors.orange,
              value: experienceLevel,
              min: 0,
              max: 10,
              divisions: 10,
              onChanged: (value) {
                // Implement your logic to update the experience level
                // This function gets called when the slider changes
              },
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CoachProfileScreen(),
  ));
}
