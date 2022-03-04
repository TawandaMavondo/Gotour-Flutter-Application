import 'package:form_field_validator/form_field_validator.dart';

String? emailValidator(String? value) {
  if (value!.isEmpty) {
    return "Email address should mot be empty";
  } else {
    return EmailValidator(errorText: "Please enter a valid email address")
        .call(value);
  }
}

String? passwordValidator(String? value) {
  List<FieldValidator> validators = [
    RequiredValidator(errorText: "Password should not be empty "),
    MinLengthValidator(8,
        errorText: 'Password must be at least 8 characters long '),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])',
        errorText: 'Passwords must have at least one special character'),
    PatternValidator(r'(?=.*[0-9])',
        errorText: 'Passwords must have at least one number')
  ];
  return MultiValidator(validators).call(value);
}


