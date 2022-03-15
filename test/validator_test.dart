import 'package:flutter_test/flutter_test.dart';
import 'package:gotour/utils/validators.dart';

void main() {
  group("Email Validator", () {
    test('Should not be empty', () {
      String? result = emailValidator("");
      expect(result, "Email address should not be empty");
    });
    test("Should be a valid email", () {
      String? result = emailValidator("example.email.com");
      expect(result, "Please enter a valid email address");
    });
    test("Should Accept valid email", () {
      String? result = emailValidator("example@email.com");
      expect(result, null);
    });
  });

  group("Password Validator", () {
    test("", () {});
  });
}
