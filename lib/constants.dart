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

Map<int, Color> color = {
  50: Color.fromRGBO(255, 125, 13, .1),
  100: Color.fromRGBO(255, 125, 13, .2),
  200: Color.fromRGBO(255, 125, 13, .3),
  300: Color.fromRGBO(255, 125, 13, .4),
  400: Color.fromRGBO(255, 125, 13, .5),
  500: Color.fromRGBO(255, 125, 13, .6),
  600: Color.fromRGBO(255, 125, 13, .7),
  700: Color.fromRGBO(255, 125, 13, .8),
  800: Color.fromRGBO(255, 125, 13, .9),
  900: Color.fromRGBO(255, 125, 13, 1),
};

MaterialColor colorCustom = MaterialColor(0xffFF7D0D, color);

ThemeData theme = ThemeData(
  fontFamily: GoogleFonts.marcellus().fontFamily,
  primaryColor: colorCustom,
  primarySwatch: colorCustom,
  textTheme: textTheme,
  accentColor: colorCustom,
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

Widget PageContainer({required Widget child}) {
  return Container(
    child: child,
    width: double.infinity,
    padding: EdgeInsets.symmetric(
      horizontal: 16.0,
      vertical: 10.0,
    ),
  );
}
