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
        child: Container(),
      ),
      bottomNavigationBar: _buildFloatingNavBar(context),
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
