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
import 'package:dms/screens/carts/ordercancelsuccess.dart';
import 'package:dms/screens/carts/verifyyotp.dart';
import 'package:dms/screens/dashboard/dashboard.dart';
import 'package:dms/screens/faq/faq_categories.dart';
import 'package:dms/screens/my_atc/my_atc_detail.dart';
import 'package:dms/screens/products/productDetails.dart';
import 'package:dms/splashscreen/splashscreen.dart';
import 'package:dms/screens/support/new_support_request.dart';
import 'package:dms/utils/colors.dart';
import 'package:dms/utils/theme.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

import '../my_atc/save_order_success.dart';

class OrderSummary extends StatefulWidget {
  int total;
  int cartTotal;
  OrderSummary(this.total, this.cartTotal);

  @override
  _OrderSummaryState createState() => _OrderSummaryState();
}

class checklist {
  String title;
  checklist(this.title);
}

class _OrderSummaryState extends State<OrderSummary> {
  List<checklist> myTitle = [
    checklist("Bag of Cement"),
    checklist("Bag of Sugar"),
    checklist("Bag of Rice"),
  ];
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    var formatter = NumberFormat("#,###,000");

    return Scaffold(
      backgroundColor: appWhite,
      appBar: dmsAppBar(context, "", actions: [
        TextButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SaveOrderSuccessScreen()));
          },
          child: Row(
            children: [
              Icon(
                Icons.save,
                size: _height * .024,
              ),
              SizedBox(
                width: _width * 0.01,
              ),
              Text(
                "Save Order",
                style: GoogleFonts.poppins(
                  decoration: TextDecoration.underline,
                  color: appColorPrimary,
                  //fontWeight: FontWeight.w600,
                  fontSize: _height * .014,
                ),
              ),
            ],
          ),
        ),
      ]),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: _width * .075),
            child: Row(
              children: [
                Text(
                  "Order Summary",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: _height * .028,
                    color: appColorPrimary,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: _height * .020),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: _width * .075),
            child: Container(
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
              ),
              //color: appWhite,
              height: _height * .64,
              width: _width * .85,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(_width * .04, _height * .02,
                        _width * .04, _height * .02),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Products",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: _height * .02,
                                color: Color(0xff333542)),
                          ),
                          SizedBox(
                            height: _height * .006,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                myTitle[0].title,
                                style: GoogleFonts.poppins(
                                  fontSize: _height * .02,
                                  fontWeight: FontWeight.w300,
                                  color: Color(0xff7A7C85),
                                ),
                              ),
                              Text(
                                "${myTitle.length - 2}",
                                style: GoogleFonts.poppins(
                                  fontSize: _height * .02,
                                  fontWeight: FontWeight.w300,
                                  color: Color(0xff7A7C85),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: _height * .0036),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                myTitle[1].title,
                                style: GoogleFonts.poppins(
                                  fontSize: _height * .02,
                                  fontWeight: FontWeight.w300,
                                  color: Color(0xff7A7C85),
                                ),
                              ),
                              Text(
                                "${myTitle.length - 2}",
                                style: GoogleFonts.poppins(
                                  fontSize: _height * .02,
                                  fontWeight: FontWeight.w300,
                                  color: Color(0xff7A7C85),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: _height * .0036),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                myTitle[2].title,
                                style: GoogleFonts.poppins(
                                  fontSize: _height * .02,
                                  fontWeight: FontWeight.w300,
                                  color: Color(0xff7A7C85),
                                ),
                              ),
                              Text(
                                "${myTitle.length - 2}",
                                style: GoogleFonts.poppins(
                                  fontSize: _height * .02,
                                  fontWeight: FontWeight.w300,
                                  color: Color(0xff7A7C85),
                                ),
                              ),
                            ],
                          ),
                        ]),
                  ),
                  SizedBox(height: _height * .01),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: _width * .05),
                    child: DottedLine(
                      dashColor: Color(0xffcbcbcb).withOpacity(0.6),
                    ),
                  ),
                  SizedBox(height: _height * .012),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: _width * .05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Delivery Type",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: _height * .02,
                              color: Color(0xff333542)),
                        ),
                        Text(
                          "Truck Size",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: _height * .02,
                              color: Color(0xff333542)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: _height * .002),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: _width * .05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Truck",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w300,
                              fontSize: _height * .017,
                              color: Color(0xff333542)),
                        ),
                        Text(
                          "1 Ton",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w300,
                              fontSize: _height * .017,
                              color: Color(0xff333542)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: _height * .012),
                  SizedBox(height: _height * .01),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: _width * .05),
                    child: DottedLine(
                      dashColor: Color(0xffcbcbcb).withOpacity(0.6),
                    ),
                  ),
                  SizedBox(height: _height * .012),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: _width * .05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Delivery Date",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: _height * .019,
                              color: Color(0xff333542)),
                        ),
                        Text(
                          "Product Quantity",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: _height * .019,
                              color: Color(0xff333542)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: _height * .004),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: _width * .05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "27/052022",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w300,
                              fontSize: _height * .017,
                              color: Color(0xff333542)),
                        ),
                        Text(
                          widget.cartTotal.toString(),
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w300,
                              fontSize: _height * .017,
                              color: Color(0xff333542)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: _height * .012),
                  SizedBox(height: _height * .01),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: _width * .05),
                    child: DottedLine(
                      dashColor: Color(0xffcbcbcb).withOpacity(0.6),
                    ),
                  ),
                  SizedBox(height: _height * .01),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: _width * .05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Delivery Address",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: _height * .019,
                              color: Color(0xff333542)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: _height * .02),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: _width * .05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "John Miller",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w300,
                              fontSize: _height * .02,
                              color: Color(0xff7A7C85)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: _height * .01),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: _width * .05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "4140 Parker Rd, Allentown,\nNew Mexico 31134",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w300,
                              fontSize: _height * .02,
                              color: Color(0xff7A7C85)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: _height * .012),
                  SizedBox(height: _height * .01),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: _width * .05),
                    child: DottedLine(
                      dashColor: Color(0xffcbcbcb).withOpacity(0.6),
                    ),
                  ),
                  SizedBox(height: _height * .012),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: _width * .05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Price",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: _height * .02,
                              color: Color(0xff7A7C85)),
                        ),
                        Text(
                          "N${formatter.format(widget.total)}.00",
                          style: GoogleFonts.poppins(
                              fontSize: _height * .024,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff27AE60)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: _height * .034,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: _width * .05),
            child: Row(children: [
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => VerifyyOTP()));
                },
                child: Center(
                  child: Container(
                    height: _height * .0633,
                    width: _width * .9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                      color: appColorPrimary,
                    ),
                    child: Center(
                      child: Text(
                        "Confirm",
                        style: GoogleFonts.poppins(
                          color: appWhite,
                          fontWeight: FontWeight.w500,
                          fontSize: _height * .0174,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ),
          SizedBox(
            height: _height * .02,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: _width * .05),
            child: Row(children: [
              InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return _myDialog(context);
                      });
                },
                child: Center(
                  child: Container(
                    height: _height * .0633,
                    width: _width * .9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                      border: Border.all(color: appColorPrimary),
                      color: appWhite,
                    ),
                    child: Center(
                      child: Text(
                        "Cancel",
                        style: GoogleFonts.poppins(
                          color: Color(0xff000000),
                          fontWeight: FontWeight.w500,
                          fontSize: _height * .0174,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ]),
      ),
    );
  }

  Widget _myDialog(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    var containerheight = _height * .5142;
    var _mypadding = SizedBox(height: containerheight * .12);
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        height: containerheight,
        //color: Colors.black,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              _mypadding,
              Image.asset(
                "lib/assets/dmsquestionmark.png",
                height: _height * .142,
                width: _width * .307,
                //width: 31.71,
              ),
              _mypadding,
              Text(
                "Are you sure you want to",
                style: GoogleFonts.poppins(
                  color: Color(0xff8D93A1),
                  fontSize: _height * .02,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "Cancel Order",
                style: GoogleFonts.poppins(
                  color: Color(0xff8D93A1),
                  fontSize: _height * .02,
                  fontWeight: FontWeight.w400,
                ),
              ),
              _mypadding,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _width * .09365),
                child: Row(children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      //color: Color(0xffFFFFFF),
                      width: _width * .382,
                      height: _height * .0633,
                      child: Center(
                          child: Text(
                        "No",
                        style: GoogleFonts.poppins(
                          fontSize: _height * .0174,
                          color: Color(0xff000000),
                        ),
                      )),
                      decoration: BoxDecoration(
                        border: Border.all(color: appColorPrimary),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: _width * .0487,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OrderCancel()));
                    },
                    child: Container(
                      //color: Color(0xffFFFFFF),
                      width: _width * .382,
                      height: _height * .0633,
                      decoration: const BoxDecoration(
                        color: appColorPrimary,
                      ),
                      child: Center(
                          child: Text(
                        "Yes",
                        style: GoogleFonts.poppins(
                          color: white,
                          fontSize: _height * .0174,
                        ),
                      )),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
