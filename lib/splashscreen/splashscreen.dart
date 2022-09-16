import 'dart:async';
import 'package:dms/blocs/login_bloc.dart';
import 'package:dms/screens/auth/login_screen.dart';
import 'package:dms/screens/dashboard/dashboard.dart';
import 'package:dms/screens/onboarding/onboarding1.dart';
import 'package:dms/utils/next_screen.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../utils/images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  goOnboarding() {
    Timer(const Duration(seconds: 1), () {
      checkRoute();
    });
  }

  checkRoute() {
    final LogInBloc lb = context.read<LogInBloc>();
    lb.checkOnboardingRead();
    Future.delayed(Duration(milliseconds: 500)).then((value) {
      lb.isOnboardingRead == true ? nextScreenReplace(context, LoginScreen()) : nextScreenReplaceWithTransition(context, Onboarding());
    });
  }

  Future _splashEnd() async {
    final LogInBloc lb = context.read<LogInBloc>();
    Future.delayed(Duration(milliseconds: 500)).then((value) {
      lb.checkSignIn();
      lb.getLoggedInToken();
      lb.isSignedIn == true && lb.token?.isNotEmpty == true
          ? _gotoHomePage()
          : goOnboarding();
    });
  }

  @override
  void initState() {
    super.initState();
    _splashEnd();
  }

  // startTime() async {
  //   var _duration = const Duration(seconds: 3);
  //   return Timer(_duration, navigationPage);
  // }

  // void navigationPage() async {
  //   finish(context);
  //   Onboarding().launch(context);
  // }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: width + width * 0.4,
        child: Stack(
          children: <Widget>[
            Image.asset(splash_bg,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover),
          ],
        ),
      ),
    );
  }

  _gotoHomePage() {
    nextScreenReplace(context, DashBoard());
  }
}
