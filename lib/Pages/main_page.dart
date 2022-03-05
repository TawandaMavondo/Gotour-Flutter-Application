import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gotour/constants.dart';

class MainScreen extends StatefulWidget {
  static const String id = '/main';
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
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
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: 30,
              ),
              _buildLocationSearch(context)
            ],
          ),
        )),
      ),
      bottomNavigationBar: _buildFloatingNavBar(context),
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