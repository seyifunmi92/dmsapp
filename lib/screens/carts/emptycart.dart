import 'package:dms/constant.dart';
import 'package:dms/layout/appWidget.dart';
import 'package:dms/screens/accounts/accountdelete.dart';
import 'package:dms/screens/auth/confirm_otp.dart';
import 'package:dms/screens/auth/login_screen.dart';
import 'package:dms/screens/auth/new_distributor_notice.dart';
import 'package:dms/screens/auth/password_reset/input_new_password.dart';
import 'package:dms/screens/auth/password_reset/password_reset_request.dart';
import 'package:dms/screens/auth/register_screen_contd.dart';
import 'package:dms/screens/carts/carts.dart';
import 'package:dms/screens/carts/ordersummary.dart';
import 'package:dms/screens/dashboard/dashboard.dart';
import 'package:dms/screens/faq/faq_categories.dart';
import 'package:dms/screens/my_atc/my_atc_detail.dart';
import 'package:dms/screens/products/productDetails.dart';
import 'package:dms/splashscreen/splashscreen.dart';
import 'package:dms/screens/support/new_support_request.dart';
import 'package:dms/utils/colors.dart';
import 'package:dms/utils/next_screen.dart';
import 'package:dms/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

class EmptyCart extends StatefulWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  _EmptyCartState createState() => _EmptyCartState();
}

class _EmptyCartState extends State<EmptyCart> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    var mypaddingr = SizedBox(width: _width * 0.07);
    var mypaddingrh = SizedBox(height: _height * .02);
    return Scaffold(
      body: Column(children: [
        SizedBox(height: _height * .05),
        Row(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            mypaddingr,
            InkWell(
              onTap: () {},
              child: Icon(Icons.arrow_back_ios_outlined,
                  color: appColorPrimary, size: _width * .04),
            ),
          ],
        ),
        mypaddingrh,
        Row(
          children: [
            mypaddingr,
            Text(
              "Cart",
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.02,
                color: appColorPrimary,
              ),
            ),
          ],
        ),
        SizedBox(height: _height * .185),
        Image.asset("lib/assets/noty.png"),
        SizedBox(
          height: _height * .021,
        ),
        Text(
          "Notification List Empty",
          style: GoogleFonts.openSans(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Color(0xff98A4B5)),
        ),
        SizedBox(height: _height * .185),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: _width * .05),
          child: Row(children: [
            Center(
              child: InkWell(
                onTap: () {
                  nextScreenReplace(context, DashBoard());
                },
                child: Container(
                  height: _height * .0633,
                  width: _width * .9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    color: appColorPrimary,
                  ),
                  child: Center(
                    child: Text(
                      "Place New Order",
                      style: GoogleFonts.poppins(
                        color: appWhite,
                        fontWeight: FontWeight.w600,
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
