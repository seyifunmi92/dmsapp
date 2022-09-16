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
import 'package:dms/screens/my%20orders/orderdetails.dart';
import 'package:dms/screens/my_atc/my_atc_detail.dart';
import 'package:dms/splashscreen/splashscreen.dart';
import 'package:dms/screens/support/new_support_request.dart';
import 'package:dms/utils/colors.dart';
import 'package:dms/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class MyOrders2 extends StatefulWidget {
  const MyOrders2({Key? key}) : super(key: key);

  @override
  _MyOrders2State createState() => _MyOrders2State();
}

class _MyOrders2State extends State<MyOrders2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appWhite,
      appBar: dmsAppBar(context, ""),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    var mypadr = SizedBox(width: _width * .04);
    var mypadh = SizedBox(height: _height * .008);
    var mypadh2 = SizedBox(height: _height * .015);

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: _width * .04),
            child: Column(
              children: [
                SizedBox(
                  height: _height * 0.026,
                ),
                Row(
                  children: [
                    Text(
                      "Submitted Orders",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: _height * .0284,
                        color: appColorPrimary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          mypadh,
          mypadh,
          mypadh,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: _width * .04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        color: inputBackgroundColor,
                        border: Border.all(
                            color: inputBorderColor,
                            width: 1,
                            style: BorderStyle.solid)),
                    height: _height * .0533,
                    width: _width * 0.73,
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 13),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.search_rounded,
                          color: Color(0xffB7BBC5),
                          size: _height * .0313,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: _width * 0.01),
                          child: Text(
                            "Search with Order Number",
                            style: GoogleFonts.poppins(
                              color: Color(0xffB7BBC5),
                              fontWeight: FontWeight.w400,
                              //fontFamily: fontRegular,
                              fontSize: _height * .017,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: appColorPrimary,
                  height: _height * .0569,
                  width: _width * .1205,
                  //child: Icon(Icons.filter),
                  child: Image.asset("lib/assets/new.png"),
                ),
              ],
            ),
          ),
          mypadh,
          mypadh,
          mypadh,
          Row(
            children: [
              mypadr,
              _boxCustom1(context),
            ],
          ),
          mypadh2,
          Row(
            children: [
              mypadr,
              _boxCustom2(context),
            ],
          ),
          mypadh2,
          _boxCustom3(context),
          mypadh2,
          _boxCustom4(context),
          mypadh2,
          _boxCustom5(context),
          mypadh2,
          _boxCustom6(context),
        ],
      ),
    );
  }

  Widget _boxCustom1(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    //var mypaddingr2 = SizedBox(width: _width * 0.05);
    var mypadhh = SizedBox(height: _height * .02);
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => OrderDetails()));
      },
      child: Container(
        width: _width * .92,
        height: _height * .104,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurStyle: BlurStyle.outer,
              blurRadius: 10,
              spreadRadius: 0,
              offset: Offset.zero,
            ),
          ],
          color: appWhite,
          borderRadius: BorderRadius.circular(5),
        ),
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: _height * .013,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _width * .05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "Order 12323342",
                        style: GoogleFonts.openSans(
                            fontSize: _height * .02,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff343434)),
                      ),
                    ],
                  ),
                  //SizedBox(width: _width * .45),
                  Text(
                    "12-05-22",
                    style: GoogleFonts.openSans(
                      fontSize: _height * .02,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            mypadhh,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _width * .05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //mypaddingr2,
                  // Text(
                  //   "N20,000",
                  //   style: GoogleFonts.openSans(
                  //       fontSize: _height * .014,
                  //       fontWeight: FontWeight.w400,
                  //       color: Color(0xff00CC08)),
                  // ),
                  //SizedBox(width: _width * .54),
                  Container(
                    height: _height * .0236,
                    width: _width * .0923,
                    decoration: BoxDecoration(
                        color: Color(0xffE4EBF3),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                        child: Text(
                      "Open",
                      style: GoogleFonts.openSans(
                          fontSize: _height * .0118,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff8D93A1)),
                    )),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget _boxCustom2(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    //var mypaddingr2 = SizedBox(width: _width * 0.05);
    var mypadhh = SizedBox(height: _height * .02);
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => OrderDetails()));
      },
      child: Container(
        width: _width * .92,
        height: _height * .104,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurStyle: BlurStyle.outer,
              blurRadius: 10,
              spreadRadius: 0,
              offset: Offset.zero,
            ),
          ],
          color: appWhite,
          borderRadius: BorderRadius.circular(5),
        ),
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: _height * .013,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _width * .05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "Order 12323342",
                        style: GoogleFonts.openSans(
                            fontSize: _height * .02,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff343434)),
                      ),
                    ],
                  ),
                  //SizedBox(width: _width * .45),
                  Text(
                    "12-05-22",
                    style: GoogleFonts.openSans(
                      fontSize: _height * .02,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            mypadhh,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _width * .05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //mypaddingr2,
                  // Text(
                  //   "N20,000",
                  //   style: GoogleFonts.openSans(
                  //       fontSize: _height * .014,
                  //       fontWeight: FontWeight.w400,
                  //       color: Color(0xff00CC08)),
                  // ),
                  //SizedBox(width: _width * .54),
                  Container(
                    height: _height * .0236,
                    width: _width * .1564,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(142, 172, 222, 0.57),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                        child: Text(
                      "Processing",
                      style: GoogleFonts.openSans(
                          fontSize: _height * .0118,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff191E2C)),
                    )),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget _boxCustom3(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    //var mypaddingr2 = SizedBox(width: _width * 0.05);
    var mypadhh = SizedBox(height: _height * .02);
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => OrderDetails()));
      },
      child: Container(
        width: _width * .92,
        height: _height * .104,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurStyle: BlurStyle.outer,
              blurRadius: 10,
              spreadRadius: 0,
              offset: Offset.zero,
            ),
          ],
          color: appWhite,
          borderRadius: BorderRadius.circular(5),
        ),
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: _height * .013,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _width * .05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "Order 12323342",
                        style: GoogleFonts.openSans(
                            fontSize: _height * .02,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff343434)),
                      ),
                    ],
                  ),
                  //SizedBox(width: _width * .45),
                  Text(
                    "12-05-22",
                    style: GoogleFonts.openSans(
                      fontSize: _height * .02,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            mypadhh,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _width * .05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //mypaddingr2,
                  // Text(
                  //   "N20,000",
                  //   style: GoogleFonts.openSans(
                  //       fontSize: _height * .014,
                  //       fontWeight: FontWeight.w400,
                  //       color: Color(0xff00CC08)),
                  // ),
                  //SizedBox(width: _width * .54),
                  Container(
                    height: _height * .0236,
                    width: _width * .236,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(236, 28, 36, 0.3),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                        child: Text(
                      "Awaiting Loading",
                      style: GoogleFonts.openSans(
                          fontSize: _height * .0118,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(236, 28, 36, 1)),
                    )),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget _boxCustom4(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    //var mypaddingr2 = SizedBox(width: _width * 0.05);
    var mypadhh = SizedBox(height: _height * .02);
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => OrderDetails()));
      },
      child: Container(
        width: _width * .92,
        height: _height * .104,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurStyle: BlurStyle.outer,
              blurRadius: 10,
              spreadRadius: 0,
              offset: Offset.zero,
            ),
          ],
          color: appWhite,
          borderRadius: BorderRadius.circular(5),
        ),
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: _height * .013,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _width * .05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "Order 12323342",
                        style: GoogleFonts.openSans(
                            fontSize: _height * .02,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff343434)),
                      ),
                    ],
                  ),
                  //SizedBox(width: _width * .45),
                  Text(
                    "12-05-22",
                    style: GoogleFonts.openSans(
                      fontSize: _height * .02,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            mypadhh,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _width * .05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //mypaddingr2,
                  // Text(
                  //   "N20,000",
                  //   style: GoogleFonts.openSans(
                  //       fontSize: _height * .014,
                  //       fontWeight: FontWeight.w400,
                  //       color: Color(0xff00CC08)),
                  // ),
                  //SizedBox(width: _width * .54),
                  Container(
                    height: _height * .0236,
                    width: _width * .1615,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(186, 207, 255, 0.2),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                        child: Text(
                      "Dispatched",
                      style: GoogleFonts.openSans(
                          fontSize: _height * .0118,
                          fontWeight: FontWeight.w400,
                          color: appColorPrimary),
                    )),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget _boxCustom5(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    //var mypaddingr2 = SizedBox(width: _width * 0.05);
    var mypadhh = SizedBox(height: _height * .02);
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => OrderDetails()));
      },
      child: Container(
        width: _width * .92,
        height: _height * .104,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurStyle: BlurStyle.outer,
              blurRadius: 10,
              spreadRadius: 0,
              offset: Offset.zero,
            ),
          ],
          color: appWhite,
          borderRadius: BorderRadius.circular(5),
        ),
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: _height * .013,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _width * .05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "Order 12323342",
                        style: GoogleFonts.openSans(
                            fontSize: _height * .02,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff343434)),
                      ),
                    ],
                  ),
                  //SizedBox(width: _width * .45),
                  Text(
                    "12-05-22",
                    style: GoogleFonts.openSans(
                      fontSize: _height * .02,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            mypadhh,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _width * .05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //mypaddingr2,
                  // Text(
                  //   "N20,000",
                  //   style: GoogleFonts.openSans(
                  //       fontSize: _height * .014,
                  //       fontWeight: FontWeight.w400,
                  //       color: Color(0xff00CC08)),
                  // ),
                  //SizedBox(width: _width * .54),
                  Container(
                      height: _height * .0236,
                      width: _width * .2256,
                      decoration: BoxDecoration(
                          color: Color(0xffB2EFFF),
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text("Enroute Delivery",
                            style: GoogleFonts.openSans(
                                fontSize: _height * .0118,
                                fontWeight: FontWeight.w400,
                                color: appColorPrimary)),
                      )),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget _boxCustom6(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    //var mypaddingr2 = SizedBox(width: _width * 0.05);
    var mypadhh = SizedBox(height: _height * .02);
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => OrderDetails()));
      },
      child: Container(
        width: _width * .92,
        height: _height * .104,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurStyle: BlurStyle.outer,
              blurRadius: 10,
              spreadRadius: 0,
              offset: Offset.zero,
            ),
          ],
          color: appWhite,
          borderRadius: BorderRadius.circular(5),
        ),
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: _height * .013,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _width * .05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "Order 12323342",
                        style: GoogleFonts.openSans(
                            fontSize: _height * .02,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff343434)),
                      ),
                    ],
                  ),
                  //SizedBox(width: _width * .45),
                  Text(
                    "12-05-22",
                    style: GoogleFonts.openSans(
                      fontSize: _height * .02,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            mypadhh,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _width * .05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //mypaddingr2,
                  // Text(
                  //   "N20,000",
                  //   style: GoogleFonts.openSans(
                  //       fontSize: _height * .014,
                  //       fontWeight: FontWeight.w400,
                  //       color: Color(0xff00CC08)),
                  // ),
                  //SizedBox(width: _width * .54),
                  Container(
                    height: _height * .0236,
                    width: _width * .14,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(39, 174, 96, 0.13),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                        child: Text(
                      "Delivered",
                      style: GoogleFonts.openSans(
                          fontSize: _height * .0118,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff27AE60)),
                    )),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
