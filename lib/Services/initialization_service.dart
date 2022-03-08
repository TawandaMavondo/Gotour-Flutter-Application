import 'package:flutter/material.dart';

class InitializationService {
  // @TODO: Precache images of the while app

  static _precacheImageAssets(BuildContext context) {
    List<Future> _precacheImageFutures = [];
    List<String> _images = [
      "assets/boat_large.png",
      "assets/boat_small.png",
      "assets/church.png",
      "assets/avatar.png",
      "assets/logo.png",
      "assets/google.png",
      "assets/splash.png",
      "assets/splash1.png",
      "assets/splash2.png",
      "assets/splash3.png",
    ];

    for (String imagePath in _images) {
      _precacheImageFutures.add(precacheImage(AssetImage(imagePath), context));
    }
    // _precacheImageFutures.add(Future.delayed(Duration(seconds: 45)));
    return Future.wait(_precacheImageFutures);
  }

  static init(BuildContext context) async {
    await _precacheImageAssets(context);
  }
}
