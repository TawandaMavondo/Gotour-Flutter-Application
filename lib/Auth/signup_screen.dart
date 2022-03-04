import 'package:flutter/material.dart';
import 'package:gotour/constants.dart';

class SignUpScreen extends StatefulWidget {
  static const String id = "/signup";
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  buildAuthHeader(context: context, headingText: "Sign Up"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
