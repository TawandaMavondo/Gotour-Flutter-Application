import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const primaryColor = Color(0xffFF7D0D);
TextStyle openSans = GoogleFonts.openSans();
var textStyle = TextStyle(
  fontFamily: openSans.fontFamily,
  fontSize: openSans.fontSize,
  fontFeatures: openSans.fontFeatures,
);
var textTheme = GoogleFonts.openSansTextTheme();
ThemeData theme = ThemeData(
  fontFamily: GoogleFonts.marcellus().fontFamily,
  primaryColor: primaryColor,
  primarySwatch: Colors.orange,
  textTheme: textTheme,
  accentColor: primaryColor,
);

class PrevButton extends StatelessWidget {
  const PrevButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: null,
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(7.0)),
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
      ),
      child: RotatedBox(
        quarterTurns: 2,
        child: Icon(
          Icons.play_arrow_sharp,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}

Widget buildAuthHeader(
    {required BuildContext context, required String headingText}) {
  return Column(
    children: [
      Image.asset(
        'assets/logo.png',
        scale: 1.0,
        width: MediaQuery.of(context).size.width - 170,
      ),
      SizedBox(
        height: 25,
      ),
      Text(
        headingText,
        style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        height: 25,
      ),
    ],
  );
}
