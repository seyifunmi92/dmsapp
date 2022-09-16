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
import 'package:dms/screens/my%20orders/orderitems.dart';
import 'package:dms/screens/my_atc/my_atc_detail.dart';
import 'package:dms/splashscreen/splashscreen.dart';
import 'package:dms/screens/support/new_support_request.dart';
import 'package:dms/utils/colors.dart';
import 'package:dms/utils/theme.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: dmsAppBar(context, ""),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: _width * .07),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: _height * 0.01,
          ),
          Text(
            "Order History",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: _height * .03,
              color: appColorPrimary,
            ),
          ),
          SizedBox(
            height: _height * .023,
          ),
          Container(
            width: _width,
            height: _height * .7879,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurStyle: BlurStyle.outer,
                  blurRadius: 10,
                  spreadRadius: 0,
                  offset: Offset.zero,
                ),

                //border: Border.all(color: Color(0xffB1BBC6)),
              ],
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  _width * .07, _height * .035, _width * .07, _height * .05),
              child: Column(children: [
                Row(
                  children: [
                    Image.asset(
                      "lib/assets/okay.png",
                      height: _height * .0296,
                    ),
                    SizedBox(
                      width: _width * .05,
                    ),
                    Text(
                      "Open",
                      style: GoogleFonts.openSans(
                        fontSize: _height * .0213,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: _height * .0059,
                ),
                Padding(
                  padding: EdgeInsets.only(left: _width * .115),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Image.asset("lib/assets/okay.png"),
                      // SizedBox(
                      //   width: _width * .05,
                      // ),
                      Text(
                        "Order has been opened for delivery",
                        style: GoogleFonts.openSans(
                          fontSize: _height * .0166,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: _height * .0059,
                ),
                Padding(
                  padding: EdgeInsets.only(left: _width * .115),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Image.asset("lib/assets/okay.png"),
                      // SizedBox(
                      //   width: _width * .05,
                      // ),
                      Text(
                        "12/08/2022",
                        style: GoogleFonts.openSans(
                          fontSize: _height * .0166,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: _height * .0284,
                ),
                Row(
                  children: [
                    Image.asset(
                      "lib/assets/okay.png",
                      height: _height * .0296,
                    ),
                    SizedBox(
                      width: _width * .05,
                    ),
                    Text(
                      "Processing",
                      style: GoogleFonts.openSans(
                        fontSize: _height * .0213,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: _width * .115),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Image.asset("lib/assets/okay.png"),
                      // SizedBox(
                      //   width: _width * .05,
                      // ),
                      Text(
                        "Order is been processed",
                        style: GoogleFonts.openSans(
                          fontSize: _height * .0166,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: _height * .0059,
                ),
                Padding(
                  padding: EdgeInsets.only(left: _width * .115),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Image.asset("lib/assets/okay.png"),
                      // SizedBox(
                      //   width: _width * .05,
                      // ),
                      Text(
                        "13/08/2022",
                        style: GoogleFonts.openSans(
                          fontSize: _height * .0166,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: _height * .0284,
                ),
                Row(
                  children: [
                    Image.asset(
                      "lib/assets/okay.png",
                      height: _height * .0296,
                    ),
                    SizedBox(
                      width: _width * .05,
                    ),
                    Text(
                      "Awaiting Loading",
                      style: GoogleFonts.openSans(
                        fontSize: _height * .0213,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: _height * .0059,
                ),
                Padding(
                  padding: EdgeInsets.only(left: _width * .115),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Image.asset("lib/assets/okay.png"),
                      // SizedBox(
                      //   width: _width * .05,
                      // ),
                      Text(
                        "Delivery number created",
                        style: GoogleFonts.openSans(
                          fontSize: _height * .0166,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: _height * .0059,
                ),
                Padding(
                  padding: EdgeInsets.only(left: _width * .115),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Image.asset("lib/assets/okay.png"),
                      // SizedBox(
                      //   width: _width * .05,
                      // ),
                      Text(
                        "13/08/2022",
                        style: GoogleFonts.openSans(
                          fontSize: _height * .0166,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: _height * .0284,
                ),
                Row(
                  children: [
                    Container(
                      height: _height * .0296,
                      width: _width * .0641,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.black,
                          width: 3,
                        ),
                      ),
                    ),
                    //Image.asset("lib/assets/okay.png"),
                    SizedBox(
                      width: _width * .05,
                    ),
                    Text(
                      "Dispatched",
                      style: GoogleFonts.openSans(
                        fontSize: _height * .0213,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff343434).withOpacity(0.2),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: _height * .0284,
                ),
                Padding(
                  padding: EdgeInsets.only(left: _width * .115),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Image.asset("lib/assets/okay.png"),
                      // SizedBox(
                      //   width: _width * .05,
                      // ),
                      Text(
                        "Enroute Delivery",
                        style: GoogleFonts.openSans(
                          fontSize: _height * .0213,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff343434).withOpacity(0.2),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: _height * .0284,
                ),
                Padding(
                  padding: EdgeInsets.only(left: _width * .115),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Image.asset("lib/assets/okay.png"),
                      // SizedBox(
                      //   width: _width * .05,
                      // ),
                      Text(
                        "Delivered",
                        style: GoogleFonts.openSans(
                          fontSize: _height * .0213,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff343434).withOpacity(0.2),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ]),
      ),
    );
  }
}
