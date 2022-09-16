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
import 'package:dms/screens/my%20orders/orderhistory.dart';
import 'package:dms/screens/my%20orders/orderitems.dart';
import 'package:dms/screens/my_atc/my_atc_detail.dart';
import 'package:dms/screens/my_atc/myatcc.dart';
import 'package:dms/splashscreen/splashscreen.dart';
import 'package:dms/screens/support/new_support_request.dart';
import 'package:dms/utils/colors.dart';
import 'package:dms/utils/theme.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: appWhite,
      appBar: dmsAppBar(context, "", actions: [
        TextButton(
          onPressed: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => SaveOrderSuccessScreen()));
          },
          child: Row(
            children: [
              // Icon(
              //   Icons.save,
              //   size: _height * .024,
              // ),
              // SizedBox(
              //   width: _width * 0.01,
              // ),
              Text(
                "Download Receipt",
                style: GoogleFonts.poppins(
                  color: appColorPrimary,
                  fontWeight: FontWeight.w500,
                  fontSize: _height * .012,
                ),
              ),
            ],
          ),
        ),
      ]),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    var contHeight = MediaQuery.of(context).size.height * .71;
    var mypadr = SizedBox(width: _width * .04);
    var mypadh = SizedBox(height: _height * .008);

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
                    // SizedBox(
                    //   height: _height * 0.026,
                    // ),
                    Text(
                      "Order Details",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: _height * .03,
                        color: appColorPrimary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // SizedBox(
          //   height: _height * .02,
          // ),
          mypadh,
          Row(
            children: [
              mypadr,
              Container(
                width: _width * .92,
                height: _height * .73,
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
                  //border: Border.all(color: Color(0xffB1BBC6)),
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: Column(children: [
                    SizedBox(
                      height: _height * .02,
                    ),
                    //mypadh,
                    //mypadh,
                    Row(
                      children: [
                        mypadr,
                        Text(
                          "Order Items",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: _height * .02,
                            color: Color(0xff333542),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: _height * .006,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: _width * .04),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //mypadr,
                          Text(
                            "Bag of Cements",
                            style: GoogleFonts.poppins(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w500,
                              fontSize: _height * .02,
                              color: Color(0xff100C57),
                            ),
                          ),
                          Text(
                            "1",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w300,
                              fontSize: _height * .02,
                              color: Color(0xff7A7C85),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: contHeight * .005),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: _width * .04),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //mypadr,
                          Text(
                            "Bag of Cements",
                            style: GoogleFonts.poppins(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w500,
                              fontSize: _height * .02,
                              color: Color(0xff100C57),
                            ),
                          ),
                          Text(
                            "1",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w300,
                              fontSize: _height * .02,
                              color: Color(0xff7A7C85),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: _height * .004),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: _width * .04),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //mypadr,
                          Text(
                            "Bag of Cements",
                            style: GoogleFonts.poppins(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w500,
                              fontSize: _height * .02,
                              color: Color(0xff100C57),
                            ),
                          ),
                          Text(
                            "1",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w300,
                              fontSize: _height * .02,
                              color: Color(0xff7A7C85),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: _height * 0.03,
                    ),
                    // mypadh,
                    // mypadh,

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: _width * .05),
                      child: DottedLine(
                        dashColor: Color(0xffcbcbcb).withOpacity(0.6),
                      ),
                      // Divider(
                      //   height: _height * .019,
                      //   color: Color(0xffCBCBCB),
                      // ),
                    ),
                    SizedBox(
                      height: _height * .02,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: _width * .04),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Order ID",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              color: Color(0xff333542),
                              fontSize: _height * .02,
                            ),
                          ),
                          // SizedBox(
                          //   width: _width * .31,
                          // ),
                          Text(
                            "Product Quantity",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              color: Color(0xff333542),
                              fontSize: _height * .02,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: _height * .004,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: _width * .04),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //mypadr,
                          Text(
                            "OR1234",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w300,
                              color: Color(0xff333542),
                              fontSize: _height * .016,
                            ),
                          ),
                          // SizedBox(
                          //   width: _width * .67,
                          // ),
                          Text(
                            "3",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w300,
                              color: Color(0xff333542),
                              fontSize: _height * .016,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: _height * .02,
                    ),
                    //mypadh,
                    // SizedBox(
                    //   height: _height * .019,
                    // ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: _width * .05),
                      child: DottedLine(
                        dashColor: Color(0xffcbcbcb).withOpacity(0.6),
                      ),
                      // Divider(
                      //   height: _height * .019,
                      //   color: Color(0xffCBCBCB),
                      // ),
                    ),
                    SizedBox(
                      height: _height * .02,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: _width * .04),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Delivery Date",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              color: Color(0xff333542),
                              fontSize: _height * .02,
                            ),
                          ),
                          // SizedBox(
                          //   width: _width * .31,
                          // ),
                          Text(
                            "Order Reason",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              color: Color(0xff333542),
                              fontSize: _height * .02,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: _height * .004,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: _width * .04),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //mypadr,
                          Text(
                            "27/5/2022",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w300,
                              color: Color(0xff333542),
                              fontSize: _height * .016,
                            ),
                          ),
                          // SizedBox(
                          //   width: _width * .67,
                          // ),
                          Text(
                            "Sales",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w300,
                              color: Color(0xff333542),
                              fontSize: _height * .016,
                            ),
                          ),
                        ],
                      ),
                    ),
                    //mypadh,
                    SizedBox(
                      height: _height * .025,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: _width * .05),
                      child: DottedLine(
                        dashColor: Color(0xffcbcbcb).withOpacity(0.6),
                      ),

                      // Divider(
                      //   height: _height * .019,
                      //   color: Color(0xffCBCBCB),
                      // ),
                    ),
                    SizedBox(
                      height: _height * .014,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: _width * .04),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //mypadr,
                          Text(
                            "Status",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              color: Color(0xff333542),
                              fontSize: _height * .02,
                            ),
                          ),
                          // SizedBox(
                          //   width: _width * .67,
                          // ),
                          Text(
                            "",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w300,
                              color: Color(0xff333542),
                              fontSize: _height * .02,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: contHeight * .005,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: _width * .04),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //mypadr,
                          Text(
                            "Pending",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w300,
                              color: Color(0xff333542),
                              fontSize: _height * .016,
                            ),
                          ),
                          // SizedBox(
                          //   width: _width * .67,
                          // ),
                          Text(
                            "",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w300,
                              color: Color(0xff333542),
                              fontSize: _height * .02,
                            ),
                          ),
                        ],
                      ),
                    ),
                    //mypadh,
                    SizedBox(
                      height: _height * .020,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: _width * .05),
                      child: DottedLine(
                        dashColor: Color(0xffcbcbcb).withOpacity(0.6),
                      ),
                    ),
                    SizedBox(
                      height: _height * .02,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: _width * .04),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //mypadr,
                          Text(
                            "Delivery Address",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              color: Color(0xff333542),
                              fontSize: _height * .02,
                            ),
                          ),
                          // SizedBox(
                          //   width: _width * .67,
                          // ),
                          Text(
                            "",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              color: Color(0xff333542),
                              fontSize: _height * .02,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: _height * .02,
                    ),
                    Row(
                      children: [
                        mypadr,
                        Text(
                          "Garwood Court, Ikorodu Road",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            color: Color(0xff7A7C85),
                            fontSize: _height * .02,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: _height * .01,
                    ),
                    Row(
                      children: [
                        mypadr,
                        Text(
                          "Phase 2 Lagos, NIgeria",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            color: Color(0xff7A7C85),
                            fontSize: _height * .02,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: _height * .03,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: _width * .05),
                      child: DottedLine(
                        dashColor: Color(0xffcbcbcb).withOpacity(0.6),
                      ),
                    ),
                    // SizedBox(
                    //   height: _height * .019,
                    // ),
                    SizedBox(
                      height: _height * .015,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: _width * .04),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //mypadr,
                          Text(
                            "Total Price",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              color: Color(0xff7A7C85),
                              fontSize: _height * .02,
                            ),
                          ),
                          // SizedBox(
                          //   width: _width * .67,
                          // ),
                          Text(
                            "N20,000",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w700,
                              color: Color(0xff27AE60),
                              fontSize: _height * .024,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
            ],
          ),
          SizedBox(height: _height * .01),
          Row(
            children: [
              mypadr,
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyATCC()));
                },
                child: Container(
                  width: _width * .92,
                  height: _height * .0633,
                  decoration: BoxDecoration(
                    //border: Border.all(color: Color(0xffB1BBC6)),
                    color: appColorPrimary,
                  ),
                  child: Center(
                      child: Text(
                    "View ATCs",
                    style: GoogleFonts.poppins(
                      color: white,
                      fontSize: _height * .016,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
                ),
              ),
            ],
          ),
          SizedBox(
            height: _height * .01,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: _width * .04),
            child: Row(children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => OrderHistory())));
                  // showDialog(
                  //     context: context,
                  //     builder: (BuildContext context) {
                  //       return _myDialog(context);
                  //     });
                },
                child: Center(
                  child: Container(
                    height: _height * .0633,
                    width: _width * .92,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                      border: Border.all(color: appColorPrimary),
                      color: appWhite,
                    ),
                    child: Center(
                      child: Text(
                        "View Order History",
                        style: GoogleFonts.poppins(
                          color: Color(0xff000000),
                          fontWeight: FontWeight.w500,
                          fontSize: _height * .016,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ),
          SizedBox(
            height: _height * .1,
          ),
        ],
      ),
    );
  }
}
