import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gotour/utils/check.dart';

class LoginScreenViewModel {
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  FirebaseAuth _instance = FirebaseAuth.instance;

  TextEditingController get emailConroller => _emailController;
  TextEditingController get passwordController => _passwordController;

  Future<UserCredential?> login() async {
    String email = _emailController.text;
    String password = _passwordController.text;
    checkNotNull<String>(email, "Email should not be null");
    checkNotNull<String>(password, "Password should not be null");
    UserCredential user;
    try {
      user = await this
          ._instance
          .signInWithEmailAndPassword(email: email, password: password);
      return user;
    } on FirebaseAuthException catch (ex) {
      print(ex.message);
    }
    return null;
  }

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
}
