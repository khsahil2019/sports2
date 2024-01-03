import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:sports2/NewScreen/playLearn/Coaches/detailCoach.dart';
import 'package:sports2/helper/theme.dart';

class AllCoachScreen extends StatefulWidget {
  @override
  _AllCoachScreenState createState() => _AllCoachScreenState();
}

class _AllCoachScreenState extends State<AllCoachScreen> {
  double _rating = 2.0; // State for the rating
  bool isFavorite = false; // State for the favorite icon

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop(); // This line navigates back one step
          },
        ),
        backgroundColor: AppColors.orange,
        title: Center(
          child: Text(
            'Coaches',
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Found 10 Coaches around you',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            buildCoachList(),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSeeAllButton(String label, VoidCallback onPressed) {
    return Container(
      height: 50,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(0, 4),
            blurRadius: 10.0,
          ),
        ],
        color: AppColors.orange,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(28.0),
          onTap: onPressed,
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCoachList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return buildCoachItem(index);
      },
    );
  }

  /*******************************************************************/

  /*********************************************************/
  Widget buildCoachItem(int index) {
    return GestureDetector(
      onTap: () {
        Get.to(() => CoachDetailScreen());
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
              offset: Offset(0, 3),
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
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRU4OhRYtS2y_sQp4Hc6saUEDcfzfQeXEYPA6NmMHsreg&s',
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Coach Name $index',
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
                      // Additional details can be added here
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
