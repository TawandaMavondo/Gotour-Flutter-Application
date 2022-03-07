import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gotour/Model/place.dart';
import 'package:gotour/constants.dart';
import 'package:gotour/widgets/location_card.dart';

class MainScreen extends StatefulWidget {
  static const String id = '/main';
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isLiked = true;
  List<Place> places = [
    Place(
      title: "Sesimbra e Arrabida",
      country: "Lisbon",
      city: "Sesimbra",
      imagePath: "assets/boat_large.png",
    ),
    Place(
      title: "Harare City",
      country: "Zimbabwe",
      city: "Harare",
      imagePath: "assets/church.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: PageContainer(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                "Get Ready For \nThe Travel Trip!",
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 35,
              ),
              _buildLocationSearch(context),
              SizedBox(
                height: 30,
              ),
              Text(
                "My Location",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              LocationCard(
                width: width,
                imagePath: 'assets/boat_small.png',
                isLiked: isLiked,
                location: 'Lisbon',
                title: 'Winter in Portugal',
                description:
                    "Portugal there's so much more to discover. Read about the Azores' new wave of eco-travel.",
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Best Places",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "See All",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              _buildBestPlaces(),
            ],
          ),
        )),
      ),
      bottomNavigationBar: _buildFloatingNavBar(context),
    );
  }

  _buildBestPlaces() {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        itemCount: 2,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) {
          return _buildPlaceCard(places[i]);
        },
      ),
    );
  }

  _buildPlaceCard(Place place) {
    const textStyle = TextStyle(
      color: Colors.white,
    );
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(12.0),
        child: Stack(
          children: [
            Image.asset(place.imagePath),
            Positioned(
              bottom: 10,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          place.title,
                          style: textStyle,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text.rich(
                          TextSpan(children: [
                            WidgetSpan(
                              child: Icon(
                                Icons.place,
                                color: Colors.white,
                              ),
                            ),
                            TextSpan(
                              text: '${place.city}, ${place.country}',
                              style: textStyle,
                            )
                          ]),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    TextButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Theme.of(context).primaryColor,
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        "\$3 000",
                        style: textStyle,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildLocationSearch(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: TextField(
            decoration: formInputDecoration.copyWith(
              label: Text('Find Your Location'),
            ),
          )),
          SizedBox(
            width: 25,
          ),
          Container(
            child: TextButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(
                    Theme.of(context).primaryColor),
              ),
              onPressed: () {},
              child: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      leading: Center(
        child: InkWell(
          onTap: () {},
          child: SizedBox(
            width: 30,
            height: 30,
            child: SvgPicture.asset(
              'assets/menu_bar.svg',
            ),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: CircleAvatar(
            child: Image.asset('assets/avatar.png'),
          ),
        )
      ],
    );
  }

  FloatingNavbar _buildFloatingNavBar(BuildContext context) {
    return FloatingNavbar(
      backgroundColor: greyColor,
      unselectedItemColor: Colors.grey,
      selectedBackgroundColor: greyColor,
      selectedItemColor: Theme.of(context).primaryColor,
      currentIndex: 0,
      onTap: (index) {},
      borderRadius: 10,
      items: [
        FloatingNavbarItem(icon: Icons.explore),
        FloatingNavbarItem(icon: Icons.notifications),
        FloatingNavbarItem(
          icon: Icons.sms,
        ),
        FloatingNavbarItem(icon: Icons.place),
        FloatingNavbarItem(
          icon: Icons.person,
        ),
      ],
    );
  }
}
