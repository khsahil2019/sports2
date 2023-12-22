import 'package:flutter/material.dart';

class GamesScreen extends StatelessWidget {
  // static const String path = "lib/src/pages/travel/travel_home.dart";

  const GamesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[const HomeScreenTop(), homeScreenBottom],
      ),
    );
  }
}

class HomeScreenTop extends StatefulWidget {
  const HomeScreenTop({super.key});

  @override
  _HomeScreenTopState createState() => _HomeScreenTopState();
}

class _HomeScreenTopState extends State<HomeScreenTop> {
  final TextStyle dropdownMenuLabel =
      const TextStyle(color: Colors.white, fontSize: 16);
  final TextStyle dropdownMenuItem =
      const TextStyle(color: Colors.black, fontSize: 18);
  List<String> locations = ['Cricket', 'VolleyBall'];
  var selectedLocationIndex = 0;
  bool isSportSelected = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: WaveClipper(),
          child: Container(
            height: 350,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromARGB(255, 240, 130, 66),
              Color.fromARGB(255, 233, 108, 41)
            ])),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: <Widget>[
                      // GestureDetector(
                      //   onTap: () {
                      //     Navigator.of(context).pop();
                      //   },
                      //   child: const Icon(
                      //     Icons.arrow_back,
                      //     color: Colors.white,
                      //   ),
                      // ),
                      const SizedBox(
                        width: 16,
                      ),
                      PopupMenuButton(
                        onSelected: (dynamic index) {
                          setState(() {
                            selectedLocationIndex = index;
                          });
                        },
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Play",
                              style: dropdownMenuLabel,
                            ),
                            // Text(
                            //   locations[selectedLocationIndex],
                            //   style: dropdownMenuLabel,
                            // ),
                            // const Icon(
                            //   Icons.keyboard_arrow_down,
                            //   color: Colors.white,
                            // )
                          ],
                        ),
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuItem<int>>[
                          // PopupMenuItem(
                          //   value: 0,
                          //   child: Text(
                          //     locations[0],
                          //     style: dropdownMenuItem,
                          //   ),
                          // ),
                          // PopupMenuItem(
                          //   value: 1,
                          //   child: Text(
                          //     locations[1],
                          //     style: dropdownMenuItem,
                          //   ),
                          // ),
                        ],
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.notification_important,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const SizedBox(
                    width: 250,
                    child: Text(
                      "What game would you like to play?",
                      style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.normal),
                      textAlign: TextAlign.center,
                    )),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    child: TextField(
                      controller: TextEditingController(text: locations[0]),
                      cursorColor: Theme.of(context).primaryColor,
                      style: dropdownMenuItem,
                      decoration: const InputDecoration(
                          suffixIcon: Material(
                            elevation: 2.0,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            child: Icon(Icons.search),
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 13)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // Row(
                //   mainAxisSize: MainAxisSize.min,
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: <Widget>[
                //     InkWell(
                //         onTap: () {
                //           setState(() {
                //             isSportSelected = true;
                //           });
                //         },
                //         child: ChoiceChip(
                //             Icons.sports, "Sports", isSportSelected)),
                //     const SizedBox(
                //       width: 20,
                //     ),
                //     InkWell(
                //         onTap: () {
                //           setState(() {
                //             isSportSelected = false;
                //           });
                //         },
                //         child: ChoiceChip(
                //             Icons.landscape, "Property", !isSportSelected)),
                //   ],
                // )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ChoiceChip extends StatefulWidget {
  final IconData icon;
  final String text;
  final bool isSportSelected;
  const ChoiceChip(this.icon, this.text, this.isSportSelected, {super.key});
  @override
  _ChoiceChipState createState() => _ChoiceChipState();
}

class _ChoiceChipState extends State<ChoiceChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: widget.isSportSelected
          ? BoxDecoration(
              color: Colors.white.withOpacity(.15),
              borderRadius: const BorderRadius.all(Radius.circular(20)))
          : null,
      child: Row(
        children: <Widget>[
          Icon(
            widget.icon,
            size: 20,
            color: Colors.white,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(widget.text,
              style: const TextStyle(color: Colors.white, fontSize: 14))
        ],
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height);

    var firstEndPoint = Offset(size.width / 2, size.height - 30);
    var firstControlPoint = Offset(size.width / 4, size.height - 53);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    var secondEndPoint = Offset(size.width, size.height - 90);
    var secondControlPoint = Offset(size.width * 3 / 4, size.height - 14);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

final Widget homeScreenBottom = Column(
  children: <Widget>[
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          const Text("Popular Games",
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 15,
                  fontWeight: FontWeight.w700)),
          const Spacer(),
          Builder(
              builder: (BuildContext context) => Text(
                    "View All",
                    style: TextStyle(
                        fontSize: 14, color: Theme.of(context).primaryColor),
                  ))
        ],
      ),
    ),
    SingleChildScrollView(
      child: SizedBox(
        height: 300,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: (cityCards.length / 2).ceil(),
          itemBuilder: (context, index) {
            final startIndex = index * 2;
            final endIndex = startIndex + 2;
            return Row(
              children: cityCards
                  .sublist(startIndex,
                      endIndex < cityCards.length ? endIndex : cityCards.length)
                  .map((cityCard) => Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: cityCard,
                        ),
                      ))
                  .toList(),
            );
          },
        ),
      ),
    ),
    // SizedBox(
    //   height: 210,
    //   child: ListView(scrollDirection: Axis.horizontal, children: cityCards),
    // )
  ],
);

List<CityCard> cityCards = [
  const CityCard(
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrivba5xeSPMS1KXh_ue7ras0NzG0yFcKnOw&usqp=CAU",
      "Cricket",
      "",
      "10",
      "500",
      '440'),
  const CityCard(
      "https://i.pinimg.com/236x/63/9c/7b/639c7be5f3ebe958d761cb2c614884dc.jpg",
      "Foot Ball",
      "",
      "10",
      "500",
      '440'),
  const CityCard(
      "https://previews.123rf.com/images/djmilic/djmilic1810/djmilic181000125/111129300-golden-crown-on-volleyball-ball-3d-render-illustration-isolated-on-white-background.jpg",
      "Volley Ball",
      "",
      "10",
      "500",
      '440'),
];

class CityCard extends StatelessWidget {
  final String imagePath, cityName, monthYear, discount, oldPrice, newPrice;
  const CityCard(this.imagePath, this.cityName, this.monthYear, this.discount,
      this.oldPrice, this.newPrice,
      {super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: Stack(
          children: <Widget>[
            SizedBox(
              width: 160,
              height: 200,
              child: Image.network(
                imagePath,
                fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child; // If the image is fully loaded, display it
                  } else {
                    return Center(
                      child:
                          CircularProgressIndicator(), // Display a loading spinner while the image is loading
                    );
                  }
                },
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return Center(
                    child: Icon(Icons
                        .error), // Display an error icon if the image fails to load
                  );
                },
              ),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              width: 160,
              height: 60,
              child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [Colors.black, Colors.black12])),
              ),
            ),
            Positioned(
              left: 10,
              bottom: 10,
              width: 145,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        cityName,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1),
                      ),
                      Text(
                        monthYear,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 2),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Text(
                        "$discount%",
                        style:
                            const TextStyle(color: Colors.black, fontSize: 14),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
