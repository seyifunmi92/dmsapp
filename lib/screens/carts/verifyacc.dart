import 'package:dms/constant.dart';
import 'package:dms/layout/appWidget.dart';
import 'package:dms/screens/accounts/accountdelete.dart';
import 'package:dms/screens/auth/confirm_otp.dart';
import 'package:dms/screens/auth/login_screen.dart';
import 'package:dms/screens/auth/new_distributor_notice.dart';
import 'package:dms/screens/auth/password_reset/input_new_password.dart';
import 'package:dms/screens/auth/password_reset/password_reset_request.dart';
import 'package:dms/screens/auth/register_screen_contd.dart';
import 'package:dms/screens/carts/checkout.dart';
import 'package:dms/screens/dashboard/dashboard.dart';
import 'package:dms/screens/faq/faq_categories.dart';
import 'package:dms/screens/my_atc/my_atc_detail.dart';
import 'package:dms/screens/products/productDetails.dart';
import 'package:dms/splashscreen/splashscreen.dart';
import 'package:dms/screens/support/new_support_request.dart';
import 'package:dms/utils/colors.dart';
import 'package:dms/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

class Verifyy extends StatefulWidget {
  const Verifyy({Key? key}) : super(key: key);

  @override
  _VerifyyState createState() => _VerifyyState();
}

class _VerifyyState extends State<Verifyy> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    var mypaddingr = SizedBox(width: _width * 0.07);
    var mypaddingrh = SizedBox(height: _height * 0.026);
    return Scaffold(
      body: Column(children: [
        SizedBox(height: _height * .05),
        Row(
          children: [
            mypaddingr,
            InkWell(
              onTap: () {},
              child: Icon(
                Icons.arrow_back_ios,
                size: _width * .04,
                color: appColorPrimary,
              ),
            ),
          ],
        ),
        mypaddingrh,
        Row(
          children: [
            mypaddingr,
            Text(
              "Verify Account",
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.02,
                color: appColorPrimary,
              ),
            ),
          ],
        ),
        SizedBox(
          height: _height * .0178,
        ),
        Row(
          children: [
            mypaddingr,
            Text(
              "Kindly enter OTP sent to your registered number",
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.02,
                color: Color(0xff8D93A1),
              ),
            ),
          ],
        ),
        SizedBox(
          height: _height * .0178,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: _width * 0.07),
          child: Row(children: [
            Container(
              width: _width * .85,
              height: _height * .06,
              decoration: BoxDecoration(
                color: Colors.blueGrey[50],
                border: Border.all(
                  color: Color(0xff7C95B1),
                ),
              ),
              child: Center(
                  child: Row(
                children: [
                  SizedBox(
                    width: _width * .06,
                  ),
                  Text(
                    "Enter OTP",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffB1BBC6),
                    ),
                  ),
                ],
              )),
            ),
          ]),
        ),
        SizedBox(
          height: _height * .03,
        ),
        Text(
          "00:15s",
          style: GoogleFonts.poppins(
            fontSize: 24,
            color: Color(0xffFF1414),
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: _height * .015,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Didnt Receive Code?",
              style: GoogleFonts.poppins(
                color: appColorPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              width: _width * .02,
            ),
            Text(
              "Resent OTP",
              style: GoogleFonts.poppins(
                color: Color(0xffB2ACAC),
                fontSize: 16,
              ),
            ),
          ],
        ),
        SizedBox(
          height: _height * .5,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: _width * 0.07),
          child: Row(children: [
            InkWell(
              onTap: () {},
              child: Container(
                width: _width * .85,
                height: _height * .06,
                decoration: const BoxDecoration(
                  color: appColorPrimary,
                ),
                child: Center(
                  child: Text(
                    "Confirm",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 14.68,
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
