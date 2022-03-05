import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
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
      body: SafeArea(
        child: Container(),
      ),
      bottomNavigationBar: _buildFloatingNavBar(context),
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
        items: [
          FloatingNavbarItem(icon: Icons.tune),
          FloatingNavbarItem(icon: Icons.notifications),
          FloatingNavbarItem(
            icon: Icons.sms,
          ),
          FloatingNavbarItem(icon: Icons.place),
          FloatingNavbarItem(
            icon: Icons.person,
          ),
        ]);
  }
}
