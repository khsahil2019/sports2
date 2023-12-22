import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sports2/helper/theme.dart';

class PlaygroundDetailScreen extends StatefulWidget {
  @override
  _PlaygroundDetailScreenState createState() => _PlaygroundDetailScreenState();
}

class _PlaygroundDetailScreenState extends State<PlaygroundDetailScreen> {
  double _rating = 2.5;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Playground Detail',
          style:
              TextStyle(color: AppColors.orange, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Container(
                  height: 200, // Set the desired height for the image
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://www.shutterstock.com/image-photo/colorful-children-playground-activities-public-260nw-480258076.jpg', // Replace with actual image URL
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Austin cricket ground',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      RatingBar.builder(
                        initialRating: _rating,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 20,
                        itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
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
                      Text(
                        "(47 Review)",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  SizedBox(height: 20),
                  Text(
                    'About',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.orange),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'A brief description of the playground and its amenities.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Location',
                    style: TextStyle(
                        fontSize: 16,
                        color: AppColors.orange,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: screenWidth / 2,
                    child: Text(
                      'No: 33 Cross Road, D Blcok, Thousand Lights chennai',
                      style: TextStyle(
                          fontSize: 16,
                          //  color: AppColors.orange,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Amenities',
                    style: TextStyle(
                        fontSize: 16,
                        color: AppColors.orange,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Wrap(
                    spacing: 10,
                    children: [
                      _buildAmenity(
                          'https://domf5oio6qrcr.cloudfront.net/medialibrary/7909/conversions/b8a1309a-ba53-48c7-bca3-9c36aab2338a-thumb.jpg',
                          'Drinking Water'),
                      _buildAmenity(
                          'https://www.facilitiesnet.com/resources/editorial/2021/19266-Main.jpg',
                          'Cafeteria'),
                      _buildAmenity(
                          'https://i.pinimg.com/736x/7e/0f/a8/7e0fa8e40440ec3409ee08eb747126cc.jpg',
                          'Parking'),
                      _buildAmenity(
                          'https://www.barbourproductsearch.info/WashroomDesign%20copy-file097545.jpg',
                          'Washroom')
                      // Add more amenities using _buildAmenity function
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(3.0),
        child: Material(
          elevation: 8, // Adjust elevation as needed
          shadowColor: AppColors.orange
              .withOpacity(0.3), // Replace with shadow color and opacity
          borderRadius:
              BorderRadius.circular(8), // Adjust border radius as needed
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                AppColors.orange, // Replace with your desired color
              ),
            ),
            onPressed: () {
              // Add onPressed functionality here
            },
            child: const Text(
              'Book Now',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildAmenity(String imageUrl, String name) {
  return Column(
    children: [
      Container(
        width: 80, // Adjust as needed
        height: 80, // Adjust as needed
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
      SizedBox(height: 4),
      Text(
        name,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}
