import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:sports2/NewScreen/playLearn/PlayGround/playgroundDetail.dart';
import 'package:sports2/Widgets/CustomDropDown.dart';
import 'package:sports2/Widgets/dropDown.dart';
import 'package:sports2/helper/theme.dart';

class AllPlayGroundScreen extends StatefulWidget {
  @override
  _AllPlayGroundScreenState createState() => _AllPlayGroundScreenState();
}

class _AllPlayGroundScreenState extends State<AllPlayGroundScreen> {
  double _rating = 2.0; // State for the rating
  bool isFavorite = false; // State for the favorite icon
  final List<String> _sportsList = [
    'Cricket ground',
    'FootBall ground',
    'Hockey ground',
    'polo ground',
    'Stadium',
    'Indoor Court',
    'Swimming pool',
    'scatting rink, Boxing ring',
    'Batmintton Court',
    'Indoor tennis Court',
    'OutDoor tennis Court'
  ];
  String? _selectedSport;
  final List<String> _locationList = [
    'Lucknow',
    'Delhi',
    'Noida',
    'Greater Noida'
  ];
  String? _selectedlocation;

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  right: 12, left: 12, top: 12, bottom: 12),
              child: CustomDropPlayGround(
                heading: 'I want to play', subHeading: "Select Sport",
                options: _sportsList,
                selectedValue:
                    _selectedSport, // Set your initial selected value
                onChanged: (String? value) {
                  setState(() {
                    _selectedSport = value;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 12, left: 12),
              child: CustomDropPlayGround(
                heading: 'Where', subHeading: "Nearest to my current location",
                options: _locationList,
                selectedValue:
                    _selectedlocation, // Set your initial selected value
                onChanged: (String? value) {
                  setState(() {
                    _selectedlocation = value;
                  });
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    'Available Stadium',
                    style: TextStyle(
                        fontSize: 20,
                        color: AppColors.orange,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Icon(
                    Icons.send_and_archive_outlined,
                    color: AppColors.orange,
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Found 10 playgrounds around you',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            buildPlaygroundList(),
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

  /*******************************************************************/
  Widget buildPlaygroundList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return buildPlaygroundItem(index);
      },
    );
  }

  /*********************************************************/
  Widget buildPlaygroundItem(int index) {
    return GestureDetector(
      onTap: () {
        Get.to(() => PlayGroundDetailScreen());
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    // Build coach item...
  }
}
