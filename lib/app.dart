import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gotour/Auth/login_screen.dart';
import 'package:gotour/providers/auth_provider.dart';
import 'package:gotour/widgets/auth_widget.dart';
import 'package:gotour/widgets/auth_widget_builder.dart';
import 'package:provider/provider.dart';
import 'Routing/app_router.dart';
import 'onboarding.dart';
import 'constants.dart';

// ignore: must_be_immutable
class GoTourApp extends StatefulWidget {
  // This widget is the root of your application.
  bool? isOnboardViewd;
  GoTourApp({required bool? isOnboardViewed}) {
    this.isOnboardViewd = isOnboardViewed;
  }

  @override
  _GoTourAppState createState() => _GoTourAppState();
}

class _GoTourAppState extends State<GoTourApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthenticationService.instance()),
        ],
        child:
            AuthWidgetBuilder(builder: (context, AsyncSnapshot<User?> snapshot) {
          return MaterialApp(
            title: 'Go Tour Travel App',
            theme: theme,
            onGenerateRoute: AppRouter.onGenerateRoute,
            // @FIX: Fix the sharedpref for the onboading screen
            home: AuthWidget(
              userSnapshot: snapshot,
              onboardingBuilder: (context) => OnBoardingScreen(),
              isViewed: this.widget.isOnboardViewd!,
              signedInBuilder: (context) => Scaffold(
                body: Center(
                  child: Container(
                    height: double.infinity,
                    child: Column(children: [
                      Text("Home"),
                      ElevatedButton(
                        onPressed: () async {
                          await Provider.of<AuthenticationService>(context,
                                  listen: false)
                              .signOut();
                        },
                        child: Text("logout"),
                      )
                    ]),
                  ),
                ),
              ),
              nonSignedInBuilder: (context) => LoginScreen(),
            ),
          );
        }));
  }
}
