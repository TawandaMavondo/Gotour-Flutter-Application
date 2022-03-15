import 'package:flutter/material.dart';
import 'package:gotour/constants.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'Auth/login_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  static String id = '/';
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

 
  Widget _buildImage(String assetName, [double width = 370]) {
    return Image.asset('assets/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    final _pageDecoration = const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.w700,
        ),
        bodyTextStyle: TextStyle(fontSize: 19.0),
        descriptionPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        imagePadding: EdgeInsets.all(0),
        imageFlex: 2);

    final List<PageViewModel> _pages = [
      PageViewModel(
        title: "Explore",
        body: "Explore your favourite destination around the world.",
        image: _buildImage("splash1.png"),
        decoration: _pageDecoration,
      ),
      PageViewModel(
        title: "Easy Peasy",
        body: "Make your travel experince very easy & peasy.",
        decoration: _pageDecoration,
        image: _buildImage("splash2.png"),
      ),
      PageViewModel(
        title: "Enjoy Tour",
        body: "Enjoy your favourite destination with your love one.",
        image: _buildImage("splash3.png"),
        decoration: _pageDecoration,
      )
    ];
    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          key: introKey,
          pages: _pages,
          showSkipButton: true,
          skipFlex: 0,
          nextFlex: 0,
          onDone: () async {
            // Navigator to the login screen
            Navigator.pushNamed(context, LoginScreen.id);
          },
          onSkip: () {
            introKey.currentState!.previous();
          },
          initialPage: 0,
          isTopSafeArea: true,
          skip: PrevButton(),
          next: NextButton(),
          globalFooter: Container(),
          done: Text(
            'Done',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          curve: Curves.fastLinearToSlowEaseIn,
          controlsPadding: EdgeInsets.fromLTRB(15, 10, 15, 45),
          dotsDecorator: DotsDecorator(
            size: Size(13.0, 13.0),
            color: Color(0xFFBDBDBD),
            activeColor: primaryColor,
            activeSize: Size(13.0, 13.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
          ),
        ),
      ),
    );
  }
}

class NextButton extends StatelessWidget {
  const NextButton({
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
      child: Icon(
        Icons.play_arrow_sharp,
        color: Colors.white,
        size: 30,
      ),
    );
  }
}
