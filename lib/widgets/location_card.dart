import 'package:flutter/material.dart';
import 'package:gotour/constants.dart';

// ignore: must_be_immutable
class LocationCard extends StatelessWidget {
  bool isLiked;
  double width;
  String description;
  String imagePath;
  String title;
  String location;

  LocationCard(
      {Key? key,
      required this.description,
      required this.width,
      required this.imagePath,
      required this.isLiked,
      required this.title,
      required this.location})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: greyColor,
        borderRadius: BorderRadius.circular(12),
      ),
      width: width * 0.85,
      child: Stack(
        children: [
          Positioned(
            top: -11,
            right: 30,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                isLiked ? Icons.bookmark : Icons.bookmark_outline,
                color: Theme.of(context).primaryColor,
                size: 40,
              ),
            ),
          ),
          Positioned(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        this.imagePath,
                        width: 80,
                        height: 80,
                      ),
                      SizedBox(
                        width: 35,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            this.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.place,
                                color: Theme.of(context).primaryColor,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                this.location,
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text.rich(TextSpan(
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                      text: this.description))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
