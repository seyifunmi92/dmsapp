import 'dart:async';

import 'package:dms/screens/auth/confirm_otp.dart';
import 'package:dms/screens/auth/new_distributor_notice.dart';
import 'package:dms/screens/auth/password_reset/input_new_password.dart';
import 'package:dms/screens/auth/password_reset/password_reset_request.dart';
import 'package:dms/screens/auth/password_reset/pwd_reset_confirm_otp.dart';
import 'package:dms/screens/auth/password_reset/pwd_reset_failure.dart';
import 'package:dms/screens/auth/password_reset/pwd_reset_success.dart';
import 'package:dms/screens/auth/register_screen_contd.dart';
import 'package:dms/screens/auth/login_screen.dart';
import 'package:dms/screens/auth/register_screen.dart';
import 'package:dms/screens/my_atc/atc_order_confirmation.dart';
import 'package:dms/screens/my_atc/my_atc_detail.dart';
import 'package:dms/screens/my_atc/my_atc_order_list.dart';
import 'package:dms/screens/my_atc/my_atc_select_business.dart';
import 'package:dms/screens/my_atc/schedule_delivery.dart';
import 'package:dms/screens/success_failure_screen/failure.dart';
import 'package:dms/screens/success_failure_screen/success.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    startTime();

  }

  startTime() async {
    var _duration = const Duration(seconds: 3);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() async {
    finish(context);
    ATCOrderComfirmation().launch(context);

  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: width + width * 0.4,
        child: Stack(
          children: <Widget>[
            Image.asset(splash_bg, width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height, fit: BoxFit.cover),

          ],
        ),
      ),
    );
   }
}
