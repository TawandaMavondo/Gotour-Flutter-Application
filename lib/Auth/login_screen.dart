import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gotour/Auth/login_screen_view_model.dart';
import 'package:gotour/Auth/signup_screen.dart';
import 'package:gotour/providers/auth_provider.dart';
import 'package:gotour/utils/validators.dart';
import 'package:provider/provider.dart';
import 'package:gotour/constants.dart';

class LoginScreen extends StatefulWidget {
  static const String id = "/login";

  const LoginScreen({Key? key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _key = GlobalKey<FormState>();
  bool _obscureText = true;
  final _viewModel = new LoginScreenViewModel();

  void showLoadingDialog(BuildContext context) {
    showDialog(
      useSafeArea: true,
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: false,
          content: Row(
            children: [
              CircularProgressIndicator(),
              SizedBox(
                width: 20,
              ),
              Text("Logging In")
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      restorationId: LoginScreen.id,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 10.0,
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buildAuthHeader(context: context, headingText: "Login"),
                  Form(
                    key: _key,
                    child: Column(
                      children: [
                        TextFormField(
                          onEditingComplete: () {
                            _key.currentState?.validate();
                          },
                          keyboardType: TextInputType.emailAddress,
                          controller: _viewModel.emailConroller,
                          validator: emailValidator,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Email",
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          obscureText: this._obscureText,
                          controller: _viewModel.passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          validator: passwordValidator,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
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
                          height: 20,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.0),
                          ),
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_key.currentState!.validate()) {
                                this.showLoadingDialog(context);
                                try {
                                  await Provider.of<AuthenticationService>(
                                          context,
                                          listen: false)
                                      .signIn(_viewModel.emailConroller.text,
                                          _viewModel.passwordController.text);
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
                              "Login",
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                              ),
                            ),
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(vertical: 14),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Or",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: <BoxShadow>[
                              // Implement a Box Shadow for the buttons
                              // BoxShadow(
                              //   // color: Colors.grey,
                              //   // blurRadius: 1,
                              //   // offset: Offset.zero,
                              //   // spreadRadius: 0.1
                              // )
                            ],
                          ),
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.white,
                              ),
                              elevation: MaterialStateProperty.all<double>(1),
                              padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(vertical: 14),
                              ),
                            ),
                            onPressed: () async {
                              try {
                                UserCredential userCredential =
                                    await Provider.of<AuthenticationService>(
                                            context,
                                            listen: false)
                                        .signInWithGoogle();
                                Fluttertoast.showToast(
                                  msg:
                                      "Welcome ${userCredential.user?.displayName}",
                                );
                              } on FirebaseAuthException catch (e) {
                                Fluttertoast.showToast(
                                  msg: e.message!,
                                );
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/google.png",
                                  fit: BoxFit.fill,
                                  width: 19,
                                  height: 19,
                                ),
                                SizedBox(width: 10.0),
                                Text(
                                  "Login With Google",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, SignUpScreen.id);
                          },
                          child: Text(
                            "Sign Up Here",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
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
}
