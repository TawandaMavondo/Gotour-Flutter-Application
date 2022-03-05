import 'package:flutter/material.dart';
import 'package:gotour/Auth/login_screen.dart';
import 'package:gotour/Auth/signup_screen.dart';
import 'package:gotour/Pages/main_page.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoginScreen.id:
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
          settings: settings,
          fullscreenDialog: true,
        );
      case SignUpScreen.id:
        return MaterialPageRoute(
          builder: (_) => SignUpScreen(),
          settings: settings,
          fullscreenDialog: true,
        );
      case MainScreen.id:
        return MaterialPageRoute(
          builder: (_) => MainScreen(),
          settings: settings,
          fullscreenDialog: true,
        );
      default:
        return null;
    }
  }
}
