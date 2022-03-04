import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:gotour/Model/create_user.dart';
import 'package:gotour/utils/check.dart';

enum AuthStatus {
  Uninitialized,
  Authenticated,
  Authenticating,
  Unauthenticated
}

class AuthenticationService extends ChangeNotifier {
  FirebaseAuth _auth;
  User? _user;
  GoogleSignIn _googleSignIn;
  User? get user => _user;
  Stream<User?> get userStream => this._auth.authStateChanges();

  AuthenticationService.instance()
      : _auth = FirebaseAuth.instance,
        _googleSignIn = GoogleSignIn() {
    _auth.authStateChanges().listen(_onAuthStateChanged);
  }

// ignore: close_sinks
  final StreamController<User> _onAuthStateChangesController =
      StreamController<User>.broadcast();

  Stream<User> get onAuthStateChanged => _onAuthStateChangesController.stream;

  Future<UserCredential> signIn(String email, String password) async {
    checkNotNull<String>(email, "Email should not be null");
    checkNotNull<String>(password, "Password should not be null");
    
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (_) {
      notifyListeners();
      rethrow;
    }
  }

  Future<UserCredential?> createUser(CreateUserModel model) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: model.emailAddress, password: model.password);
      var firstname = model.firstname;
      var lastname = model.lastname;
      await userCredential.user!.updateDisplayName("$firstname $lastname");
      this._user = userCredential.user;
     // notifyListeners();
      return userCredential;
    } on FirebaseAuthException catch (_) {
      notifyListeners();
      rethrow;
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    try {
      notifyListeners();
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      return userCredential;
    } catch (e) {
      print(e);
      notifyListeners();
      rethrow;
    }
  }

  Future signOut() async {
    await _auth.signOut();
    notifyListeners();
    await _googleSignIn.signOut();
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  Future<void> _onAuthStateChanged(User? firebaseUser) async {
    if (firebaseUser == null) {
    } else {
      _user = firebaseUser;
      _onAuthStateChangesController.add(firebaseUser);
    }
    notifyListeners();
  }
}
