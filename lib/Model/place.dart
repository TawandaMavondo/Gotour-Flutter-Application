import 'package:gotour/Model/model.dart';

class Place extends Model {
  String title;
  String city;
  String country;
  String imagePath;
  double price;

  Place({
    required this.title,
    required this.city,
    required this.country,
    required this.imagePath,
    required this.price
  });
}
