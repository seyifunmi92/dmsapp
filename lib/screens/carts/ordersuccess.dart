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
import 'package:dms/screens/carts/checkout.dart';
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

class OrderPlacedSuccess extends StatefulWidget {
  const OrderPlacedSuccess({Key? key}) : super(key: key);

  @override
  _OrderPlacedSuccessState createState() => _OrderPlacedSuccessState();
}

class _OrderPlacedSuccessState extends State<OrderPlacedSuccess> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: dmsAppBar(context, '', showBack: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: _height * .113,
            ),
            //mypaddingrh,
            // SizedBox(
            //   height: _height * .03,
            // ),
            Row(children: [
              // mypaddingr,
              //
              // InkWell(
              //   onTap: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => SuccessScreen()));
              //   },
              //   child: Icon(
              //     Icons.arrow_back_ios_outlined,
              //     color: appColorPrimary,
              //     size: _width * .04,
              //   ),
              // ),
              //mypaddingrh,
            ]),
            // mypaddingrh2,
            Container(
              height: _height * .237,
              width: _width * .5128,
              child: Image.asset(
                "assets/gif/checkmark.gif",
              ),
            ),
            SizedBox(height: _height * .121),
            Text(
              "Provisional Order",
              style: GoogleFonts.poppins(
                color: appColorPrimary,
                fontWeight: FontWeight.w600,
                fontSize: _height * .028,
                letterSpacing: .02,
              ),
            ),
            SizedBox(height: _height * .031),
            Text(
              "Order Placed Successfully",
              style: GoogleFonts.poppins(
                color: appTextColorSecondary,
                fontWeight: FontWeight.w400,
                fontSize: _height * .019,
                letterSpacing: .02,
              ),
            ),
            SizedBox(height: _height * .2),
            InkWell(
              onTap: () {
                nextScreenReplace(context, DashBoard());
              },
              child: Container(
                width: _width * .85,
                height: _height * .063,
                color: appColorPrimary,
                child: Center(
                    child: Text(
                  "Go Back",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    color: appWhite,
                    letterSpacing: 0.02,
                    fontSize: _height * .0174,
                  ),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
