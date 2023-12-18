import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports2/Screens/home.dart';
import 'package:sports2/Screens/homeScreen.dart';

class SearchSportsScreen extends StatefulWidget {
  @override
  _SearchSportsScreenState createState() => _SearchSportsScreenState();
}

class _SearchSportsScreenState extends State<SearchSportsScreen> {
  TextEditingController _searchController = TextEditingController();
  List<String> sports = [
    'Football',
    'Basketball',
    'Tennis',
    'Cricket',
    'Baseball',
    'Golf',
    'Soccer',
    // Add more sports as needed
  ];
  List<String> filteredSports = [];
  bool showHint = false;

  @override
  void initState() {
    super.initState();
    filteredSports = sports; // Initialize with all sports
  }

  void filterSports(String query) {
    setState(() {
      if (query.isNotEmpty) {
        showHint = true; // Show hint only if the query is not empty
        filteredSports = sports
            .where((sport) => sport.toLowerCase().contains(query.toLowerCase()))
            .toList();
      } else {
        showHint = false;
        filteredSports = sports; // Show all sports when query is empty
      }
    });
  }

  void selectSuggestion(String suggestion) {
    setState(() {
      _searchController.text =
          suggestion; // Set selected suggestion to search bar
      showHint = false; // Hide suggestions after selection
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Sports'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              height: 50.0,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFEFEDEE),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0.0, 10.0),
                      blurRadius: 10.0)
                ],
              ),
              child: Row(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Icon(
                      Icons.search,
                      size: 30.0,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 60.0,
                    width: MediaQuery.of(context).size.width * 0.50,
                    child: TextField(
                      controller: _searchController,
                      onChanged: (value) {
                        filterSports(value);
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search for Sport',
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.0,
                          color: Colors.grey.withOpacity(0.8),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(16.0),
          //   child: TextField(
          //     controller: _searchController,
          //     decoration: InputDecoration(
          //       hintText: 'Search sports...',
          //     ),
          //     onChanged: (value) {
          //       filterSports(value);
          //     },
          //   ),
          // ),
          if (showHint)
            Expanded(
              child: ListView.builder(
                itemCount: filteredSports.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(filteredSports[index]),
                    onTap: () {
                      selectSuggestion(filteredSports[index]);
                    },
                  );
                },
              ),
            ),
          if (showHint &&
              filteredSports.isEmpty) // Check if filtered list is empty
            Padding(
              padding: const EdgeInsets.only(bottom: 250),
              child: Text(
                'No sports found',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          // if (showHint && filteredSports.isNotEmpty) // Display filtered sports
          //   Expanded(
          //     child: ListView.builder(
          //       itemCount: filteredSports.length,
          //       itemBuilder: (context, index) {
          //         return ListTile(
          //           title: Text(filteredSports[index]),
          //           onTap: () {
          //             selectSuggestion(filteredSports[index]);
          //           },
          //         );
          //       },
          //     ),
          //   ),
        ],
      ),
    );
  }
}
