import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? viewed = prefs.getBool('onBoard');

  if (viewed == null || viewed == false) {
    await prefs.setBool("onBoard", true);
    viewed = false;
  }
  runApp(GoTourApp(
    isOnboardViewed: viewed,
  ));
}
