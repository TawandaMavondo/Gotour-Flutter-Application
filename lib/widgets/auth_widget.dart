import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({
    Key? key,
    required this.signedInBuilder,
    required this.nonSignedInBuilder,
    required this.userSnapshot,
    required this.isViewed,
    required this.onboardingBuilder,
  }) : super(key: key);
  final WidgetBuilder nonSignedInBuilder;
  final WidgetBuilder signedInBuilder;
  final AsyncSnapshot<User?> userSnapshot;
  final bool isViewed;
  final WidgetBuilder onboardingBuilder;

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    if (!widget.isViewed) {
      return this.widget.onboardingBuilder(context);
    }

    if (widget.userSnapshot.connectionState == ConnectionState.active) {
      return widget.userSnapshot.hasData
          ? widget.signedInBuilder(context)
          : widget.nonSignedInBuilder(context);
    }
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
