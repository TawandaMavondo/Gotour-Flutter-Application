import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gotour/Model/create_user.dart';
import 'package:gotour/constants.dart';
import 'package:gotour/providers/auth_provider.dart';
import 'package:gotour/utils/check.dart';
import 'package:gotour/utils/validators.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  static const String id = "/signup";
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _key = GlobalKey<FormState>();
  bool _obscureText = true;
  TextEditingController _firstnameController = new TextEditingController();
  TextEditingController _lastnameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  late Gender _gender;
  @override
  void initState() {
    this._gender = Gender.None;
    super.initState();
  }

  @override
  void dispose() {
    _firstnameController.dispose();
    _lastnameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  //  _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: _buildAppBar(context),
      body: SafeArea(
        child: PageContainer(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  buildAuthHeader(context: context, headingText: "Sign Up"),
                  Form(
                    key: _key,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          _buildGenderSelector(width),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: _firstnameController,
                            onEditingComplete: () {
                              _key.currentState?.validate();
                            },
                            keyboardType: TextInputType.text,
                            decoration: formInputDecoration.copyWith(
                                labelText: "First Name"),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: _lastnameController,
                            onEditingComplete: () {
                              _key.currentState?.validate();
                            },
                            keyboardType: TextInputType.text,
                            decoration: formInputDecoration.copyWith(
                                labelText: "Last Name"),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                              controller: _emailController,
                              validator: emailValidator,
                              onEditingComplete: () {
                                _key.currentState?.validate();
                              },
                              keyboardType: TextInputType.emailAddress,
                              decoration: formInputDecoration.copyWith(
                                  labelText: "Email Address")),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: _phoneController,
                            onEditingComplete: () {
                              _key.currentState?.validate();
                            },
                            keyboardType: TextInputType.phone,
                            decoration: formInputDecoration.copyWith(
                                labelText: "Phone Number"),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: this._obscureText,
                            keyboardType: TextInputType.visiblePassword,
                            validator: passwordValidator,
                            decoration: formInputDecoration.copyWith(
                              labelText: "Password",
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                                icon: Icon(_obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3.0),
                            ),
                            child: ElevatedButton(
                              onPressed: () async {
                                if (_key.currentState!.validate()) {
                                  showLoadingDialog(context, "Signing Up");
                                  var firstname = _firstnameController.text;
                                  var lastname = _lastnameController.text;
                                  var email = _emailController.text;
                                  var phone = _phoneController.text;
                                  var password = _passwordController.text;
                                  checkNotNull(firstname);
                                  checkNotNull(lastname);

                                  CreateUserModel newUsermodel =
                                      new CreateUserModel(
                                    firstname,
                                    lastname,
                                    email,
                                    password,
                                    phone,
                                  );

                                  try {
                                    await Provider.of<AuthenticationService>(
                                            context,
                                            listen: false)
                                        .createUser(newUsermodel);
                                  } on FirebaseAuthException catch (e) {
                                    Navigator.of(context).pop();
                                    Fluttertoast.showToast(
                                      msg: e.message!,
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      textColor: Colors.white,
                                      fontSize: 16.0,
                                    ).timeout(Duration(seconds: 5));
                                  }
                                }
                              },
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                ),
                              ),
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all<double>(2),
                                padding: MaterialStateProperty.all(
                                  EdgeInsets.symmetric(vertical: 14),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row _buildGenderSelector(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
              border: Border.all(
                color: Colors.grey,
                width: 1.5,
              ),
            ),
            width: width * 0.75,
            child: CheckboxListTile(
              title: Text("Male"),
              value: _gender == Gender.Male,
              onChanged: (value) {
                setState(() {
                  _gender = Gender.Male;
                });
              },
            ),
          ),
        ),
        SizedBox(
          width: width * 0.065,
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
              border: Border.all(
                color: Colors.grey,
                width: 1.5,
              ),
            ),
            width: width * 0.75,
            child: CheckboxListTile(
              title: Text("Female"),
              value: _gender == Gender.Female,
              onChanged: (value) {
                setState(() {
                  _gender = Gender.Female;
                });
              },
            ),
          ),
        )
      ],
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back_ios_sharp)),
    );
  }
}
