import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app.dart';

Future<void> main() async {
  String _sharedPrefKey = "onBoard";
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? viewed = prefs.getBool(_sharedPrefKey);

  if (viewed == null || viewed == false) {
    await prefs.setBool(_sharedPrefKey, true);
  }
  runApp(
    GoTourApp(
      isOnboardViewed: viewed == null ? false : viewed,
    ),
  );
}
