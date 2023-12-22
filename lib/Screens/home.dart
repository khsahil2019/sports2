import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports2/Controller/authCotroller.dart';
import 'package:sports2/Screens/Event/createEvent.dart';
import 'package:sports2/Screens/Profile/coachProfile.dart';
import 'package:sports2/Screens/Profile/stuProfile.dart';
import 'package:sports2/Screens/bookmark.dart';
import 'package:sports2/Screens/homeScreen.dart';
import 'package:sports2/Screens/searchScreen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    SearchSportsScreen(),
    CreateEventScreen(),
    BookmarkScreen(),
    // ProfileEightPage(),
    StudentProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    // final userData = Get.arguments;
    double screenWidth = MediaQuery.of(context).size.width - 40;
    return Scaffold(
      // appBar: AppBar(
      //     // title: Text('Bottom Navigation Demo'),
      //     ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Colors.black,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            if (index == 4) {
              // Navigate to ProfileScreen and pass arguments
              Map<String, dynamic> userData = Get.arguments;

              if (userData["usertype"] == "std") {
                Get.to(() => StudentProfile(), arguments: userData);
              }

              if (userData["usertype"] == "coach") {
                Get.to(() => CoachProfileScreen(), arguments: userData);
              }

              // Navigate to the profile screen and pass userData
            }
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Event',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookmark',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],

        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
      ),
    );
  }
}

class SearchTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Search Tab'),
    );
  }
}

class BookmarkTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Bookmark Tab'),
    );
  }
}

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Profile Tab'),
    );
  }
}
