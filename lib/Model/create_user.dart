import 'model.dart';

class CreateUserModel extends Model {
  String firstname;
  String lastname;
  String emailAddress;
  String phonenumber;
  String password;

  CreateUserModel(
    this.firstname,
    this.lastname,
    this.emailAddress,
    this.password,
    this.phonenumber,
  );
}