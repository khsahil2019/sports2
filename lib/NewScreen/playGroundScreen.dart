import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:sports2/NewScreen/groundDetail.dart';
import 'package:sports2/helper/theme.dart';

class PlayGroundScreen extends StatefulWidget {
  @override
  _PlayGroundScreenState createState() => _PlayGroundScreenState();
}

class _PlayGroundScreenState extends State<PlayGroundScreen> {
  double _rating = 2.0; // State for the rating
  bool isFavorite = false; // State for the favorite icon

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
        title: Center(
          child: Text(
            'Playground',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
            onPressed: () {
              // Add notification icon functionality here
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            // color: AppColors.orange,
            child: Text(
              'Found 10 playgrounds around you',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount:
                  10, // Replace this number with the actual number of playgrounds or use a dynamic list of playgrounds
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(() => PlaygroundDetailScreen());
                  },
                  child: Container(
                    height: 180,
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Material(
                      borderRadius: BorderRadius.circular(20),
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  'https://img.freepik.com/premium-vector/kids-playground-with-tube-slide-climbing-ladder-seesaw-cartoon-landscape_338371-730.jpg?size=626&ext=jpg&ga=GA1.1.2116175301.1701561600&semt=ais',
                                  fit: BoxFit.cover,
                                  height: double.infinity,
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Playground Name $index',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      IconButton(
                                        icon: isFavorite
                                            ? Icon(
                                                Icons.favorite,
                                                color: AppColors.orange,
                                              )
                                            : Icon(
                                                Icons.favorite_border,
                                                color: AppColors.orange,
                                              ),
                                        onPressed: () {
                                          // Update the state for favorite icon
                                          setState(() {
                                            isFavorite = !isFavorite;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Rating: ',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      RatingBar.builder(
                                        initialRating: _rating,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemSize: 20,
                                        itemPadding: EdgeInsets.symmetric(
                                            horizontal: 1.0),
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {
                                          setState(() {
                                            _rating = rating;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'Location: XYZ Street, City',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  Text(
                                    'Description: A brief description of the playground.',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
