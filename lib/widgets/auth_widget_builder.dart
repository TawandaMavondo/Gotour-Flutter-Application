import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthWidgetBuilder extends StatefulWidget {
  const AuthWidgetBuilder({Key? key, required this.builder}) : super(key: key);
  final Widget Function(BuildContext context, AsyncSnapshot<User?> snapshot)
      builder;

  @override
  State<AuthWidgetBuilder> createState() => _AuthWidgetBuilderState();
}

class _AuthWidgetBuilderState extends State<AuthWidgetBuilder> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          final _user = snapshot.data;
          if (_user != null) {
            return MultiProvider(
              providers: [
                Provider<User>.value(value: _user),
              ],
              child: widget.builder(context, snapshot),
            );
          }
          return widget.builder(context, snapshot);
        });
  }
}
