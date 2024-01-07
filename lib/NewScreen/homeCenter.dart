import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports2/NewScreen/playGroundScreen.dart';
import 'package:sports2/NewScreen/Event/createEvent.dart';
import 'package:sports2/NewScreen/playLearn/Both/coachesPlay.dart';
import 'package:sports2/NewScreen/playLearn/Coaches/coaches.dart';
import 'package:sports2/NewScreen/playLearn/PlayGround/playground.dart';
import 'package:sports2/NewScreen/profileScreen.dart';
import 'package:sports2/Registration/studentReg.dart';
import 'package:sports2/helper/theme.dart';

class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeContent(),
    AllCoachScreen(),
    PlayGroundScreen(),
    CoachProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //     // Your app bar content
      //     ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey[400],
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Events',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Play Learn',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            const CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8AvpQOT8GJ_W1LjoMHfv1GSsFMnSVLJ4hWncZH1vSbQ&s'),
            ),
            const SizedBox(width: 10),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Hey!',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18.0,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      ' Sahil',
                      style: TextStyle(
                        color: AppColors.orange, //
                        fontSize: 20.0,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Good Morning!',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            const Spacer(), // Spaces out the widgets
            IconButton(
              icon: const Icon(Icons.notifications_active),
              onPressed: () {
                // Handle notifications
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.to(() => StudentRegScreen());
                },
                child: const Text("test")),
            GestureDetector(
              onTap: () {
                Get.to(() => CoachPlayScreen());
              },
              child: const ContainerWithArrow(
                imageUrl: 'assets/img/play.png', // Replace with your image path
                text: 'Container 1',
                index: 1, type: "play & Learn",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // Container 2
            GestureDetector(
              onTap: () {
                Get.to(() => AllPlayGroundScreen());
              },
              child: const ContainerWithArrow(
                imageUrl: 'assets/img/create.png',
                text: 'Container 2',
                index: 2,
                type: "PlayGround / Game Facilities",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // Container 2
            GestureDetector(
              onTap: () {
                Get.to(() => CreateEventScreen());
              },
              child: const ContainerWithArrow(
                imageUrl: 'assets/img/create.png',
                text: 'Container 2',
                index: 3,
                type: "Create Event",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class ContainerWithArrow extends StatelessWidget {
  final String imageUrl;
  final int index;
  final String text;
  final String type;

  const ContainerWithArrow({
    required this.imageUrl,
    required this.index,
    required this.text,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Container(
            height: 190,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(16),
                        bottom: Radius.circular(14),
                      ),
                      image: DecorationImage(
                        image:
                            AssetImage(imageUrl), // Replace with your image URL
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(8)),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      FittedBox(
                        // Wrap the Text widget with FittedBox
                        fit: BoxFit.scaleDown,
                        child: Text(
                          type,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: AppColors.orange,
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
      ],
    );
  }
}
