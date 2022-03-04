import 'model.dart';

enum Gender { Male, Female, None }

class CreateUserModel extends Model {
  String firstname;
  String lastname;
  String emailAddress;
  String phonenumber;
  String password;
  Gender? gender;

  CreateUserModel(
    this.firstname,
    this.lastname,
    this.emailAddress,
    this.password,
    this.phonenumber, {
    this.gender,
  });
}
