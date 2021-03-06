import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gotour/Auth/login_screen.dart';
import 'package:gotour/Pages/main_page.dart';
import 'package:gotour/Services/initialization_service.dart';
import 'package:gotour/providers/auth_provider.dart';
import 'package:gotour/widgets/auth_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
          ChangeNotifierProvider(
              create: (_) => AuthenticationService.instance()),
        ],
        child: AuthWidgetBuilder(
            builder: (context, AsyncSnapshot<User?> snapshot) {
          return MaterialApp(
            title: 'Go Tour Travel App',
            theme: theme,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: AppRouter.onGenerateRoute,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            // @FIX: Fix the sharedpref for the onboading screen
            home: FutureBuilder(
              future: InitializationService.init(context),
              builder:
                  (BuildContext context, AsyncSnapshot<void> asyncSnapshot) {
                if (asyncSnapshot.connectionState == ConnectionState.done) {
                  return _buildRootWidget(snapshot);
                }
                return Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
          );
        }));
  }

  _buildRootWidget(AsyncSnapshot<User?> snapshot) {
    return AuthWidget(
      userSnapshot: snapshot,
      onboardingBuilder: (context) => OnBoardingScreen(),
      isViewed: this.widget.isOnboardViewd!,
      signedInBuilder: (context) => MainScreen(),
      nonSignedInBuilder: (context) => LoginScreen(),
    );
  }
}
