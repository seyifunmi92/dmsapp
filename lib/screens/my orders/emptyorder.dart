import 'package:dms/constant.dart';
import 'package:dms/layout/appWidget.dart';
import 'package:dms/screens/accounts/accountdelete.dart';
import 'package:dms/screens/auth/confirm_otp.dart';
import 'package:dms/screens/auth/login_screen.dart';
import 'package:dms/screens/auth/new_distributor_notice.dart';
import 'package:dms/screens/auth/password_reset/input_new_password.dart';
import 'package:dms/screens/auth/password_reset/password_reset_request.dart';
import 'package:dms/screens/auth/register_screen_contd.dart';
import 'package:dms/screens/dashboard/dashboard.dart';
import 'package:dms/screens/faq/faq_categories.dart';
import 'package:dms/screens/my_atc/my_atc_detail.dart';
import 'package:dms/splashscreen/splashscreen.dart';
import 'package:dms/screens/support/new_support_request.dart';
import 'package:dms/utils/colors.dart';
import 'package:dms/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';

class EmptyOrder extends StatefulWidget {
  const EmptyOrder({Key? key}) : super(key: key);

  @override
  _EmptyOrderState createState() => _EmptyOrderState();
}

class _EmptyOrderState extends State<EmptyOrder> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: dmsAppBar(context, ""),
      body: Column(children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _width * .04),
              child: Row(
                children: [
                  Text(
                    "My Order",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      color: appColorPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: _height * .185,
        ),
        Image.asset("lib/assets/noty.png"),
        SizedBox(
          height: _height * .021,
        ),
        Text(
          "Order List Empty",
          style: GoogleFonts.openSans(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Color(0xff98A4B5)),
        ),
        SizedBox(
          height: _height * .2,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: _width * .0745),
          child: Row(children: [
            Center(
              child: Container(
                height: _height * .0633,
                width: _width * .85,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  color: appColorPrimary,
                ),
                child: InkWell(
                  onTap: () {},
                  child: Center(
                    child: Text(
                      "Place Order",
                      style: GoogleFonts.poppins(
                        color: white,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.68,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ]),
    );
  }
}
