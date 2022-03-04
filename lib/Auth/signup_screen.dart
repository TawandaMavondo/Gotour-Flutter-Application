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
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SafeArea(
        child: PageContainer(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  buildAuthHeader(context: context, headingText: "Sign Up"),
                  Form(
                    key: _key,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          _buildGenderSelector(width),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row _buildGenderSelector(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
            border: Border.all(
              color: Colors.grey,
              width: 1.5,
            ),
          ),
          width: width * 0.75,
          child: CheckboxListTile(
            title: Text("Male"),
            value: true,
            onChanged: (value) {},
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
            border: Border.all(
              color: Colors.grey,
              width: 1.5,
            ),
          ),
          width: width * 0.75,
          child: CheckboxListTile(
            title: Text("Female"),
            value: false,
            onChanged: (value) {},
          ),
        )
      ],
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back_ios_sharp)),
    );
  }
}
