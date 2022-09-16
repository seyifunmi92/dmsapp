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
import 'package:dms/screens/carts/ordersummary.dart';
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

class Schedule extends StatefulWidget {
  int total;
  int cartTotal;
  Schedule(this.total, this.cartTotal);

  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  var formKey = GlobalKey<FormState>();
  var deliveryDateCont = TextEditingController();
  var deliveryDateNode = FocusNode();
  var deliveryAddressCont = TextEditingController();
  var deliveryAddressNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    final _screenHeight = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: dmsAppBar(context, '', showBack: true),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.only(
              left: _screenWidth * 0.07, right: _screenWidth * 0.07),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: _screenHeight * 0.015,
              ),
              Text(
                "Schedule Delivery",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: _screenHeight * .03,
                  color: appColorPrimary,
                ),
              ),
              //ext("Schedule Delivery", isBoldText: true, fontSize: 28.0),
              SizedBox(
                height: _screenHeight * 0.0166,
              ),
              Text(
                "Kindly choose delivery method and type",
                style: GoogleFonts.poppins(
                  color: Color(0xff8D93A1),
                  fontWeight: FontWeight.w400,
                  fontSize: _screenHeight * .015,
                ),
              ),
              SizedBox(
                height: _screenHeight * 0.02,
              ),
              Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
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
                        width: _width,
                        // padding: EdgeInsets.symmetric(horizontal: _width *.04),
                        child: Center(
                          child: Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: _width * .04),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Delivery Type",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: _height * .0166,
                                    color: Color(0xffB1BBC6),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.arrow_drop_down,
                                    color: Color(0xff999999),
                                    size: _height * .025,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: _screenHeight * 0.02,
                    ),
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
                        width: _width,
                        // padding: EdgeInsets.symmetric(horizontal: _width *.04),
                        child: Center(
                          child: Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: _width * .04),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Truck Size",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: _height * .0166,
                                    color: Color(0xffB1BBC6),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.arrow_drop_down,
                                    color: Color(0xff999999),
                                    size: _height * .025,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: _screenHeight * 0.02,
                    ),
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
                        width: _width,
                        // padding: EdgeInsets.symmetric(horizontal: _width *.04),
                        child: Center(
                          child: Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: _width * .04),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Delivery Date",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: _height * .0166,
                                    color: Color(0xffB1BBC6),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.calendar_month,
                                    color: Color(0xff999999),
                                    size: _height * .025,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    // TextFormField(
                    //   keyboardType: TextInputType.text,
                    //   autofocus: false,
                    //   controller: deliveryDateCont,
                    //   textCapitalization: TextCapitalization.words,
                    //   style: TextStyle(
                    //       color: appColorPrimary,
                    //       fontFamily: fontRegular,
                    //       fontSize: textSizeMedium),
                    //   decoration: InputDecoration(
                    //       suffixIcon: IconButton(
                    //         icon: const Icon(
                    //           Icons.calendar_month,
                    //         ),
                    //         onPressed: () {},
                    //       ),
                    //       filled: true,
                    //       fillColor: inputBackgroundColor,
                    //       focusColor: inputBorderColor,
                    //       hintText: "Delivery Date",
                    //       hintStyle: TextStyle(
                    //           color: iconColorSecondary,
                    //           fontFamily: fontRegular,
                    //           fontSize: textSizeMedium),
                    //       contentPadding:
                    //           EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    //       focusedBorder: OutlineInputBorder(
                    //           borderSide: BorderSide(
                    //               color: inputBorderColor, width: 0.5)),
                    //       enabledBorder: OutlineInputBorder(
                    //           borderSide: BorderSide(
                    //               color: iconColorSecondary,
                    //               style: BorderStyle.solid,
                    //               width: 0))),
                    //   textInputAction: TextInputAction.next,
                    //   focusNode: deliveryDateNode,
                    //   validator: (s) {
                    //     if (s!.isEmpty) return 'Field is required';
                    //     return null;
                    //   },
                    // ),
                    SizedBox(
                      height: _screenHeight * 0.02,
                    ),
                    // TextFormField(
                    //   autofocus: false,
                    //   controller: deliveryAddressCont,
                    //   textCapitalization: TextCapitalization.words,
                    //   style: TextStyle(
                    //       color: appColorPrimary,
                    //       fontFamily: fontRegular,
                    //       fontSize: textSizeMedium),
                    //   decoration: InputDecoration(
                    //       filled: true,
                    //       fillColor: inputBackgroundColor,
                    //       focusColor: inputBorderColor,
                    //       hintText: "Delivery Address",
                    //       hintStyle: TextStyle(
                    //           color: iconColorSecondary,
                    //           fontFamily: fontRegular,
                    //           fontSize: textSizeMedium),
                    //       contentPadding:
                    //           EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    //       focusedBorder: OutlineInputBorder(
                    //           borderSide: BorderSide(
                    //               color: inputBorderColor, width: 0.5)),
                    //       enabledBorder: OutlineInputBorder(
                    //           borderSide: BorderSide(
                    //               color: iconColorSecondary,
                    //               style: BorderStyle.solid,
                    //               width: 0))),
                    //   keyboardType: TextInputType.multiline,
                    //   textInputAction: TextInputAction.newline,
                    //   maxLines: 6,
                    //   focusNode: deliveryAddressNode,
                    //   validator: (s) {
                    //     if (s!.isEmpty) return 'Field is required';
                    //     return null;
                    //   },
                    //),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            color: inputBackgroundColor,
                            border: Border.all(
                                color: inputBorderColor,
                                width: 1,
                                style: BorderStyle.solid)),
                        height: _height * .159,
                        width: _width,
                        // padding: EdgeInsets.symmetric(horizontal: _width *.04),
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: _width * .04),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(height: _height * .018),
                              Text(
                                "Delivery Address",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: _height * .0166,
                                  color: Color(0xffB1BBC6),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: _screenHeight * 0.29,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OrderSummary(
                                    widget.total, widget.cartTotal)));
                        //Navigator.pop(context);
                      },
                      child: Container(
                        width: _width,
                        height: _height * .0633,
                        decoration: BoxDecoration(
                          //border: Border.all(color: Color(0xffB1BBC6)),
                          color: appColorPrimary,
                        ),
                        child: Center(
                            child: Text(
                          "Proceed",
                          style: GoogleFonts.poppins(
                            color: white,
                            fontSize: _height * .016,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                      ),
                    ),
                    // Align(
                    //   alignment: Alignment.bottomCenter,
                    //   child: Container(
                    //     width: double.infinity,
                    //     height: 55.0,
                    //     margin: const EdgeInsetsDirectional.fromSTEB(
                    //         10.0, 0.0, 10.0, 10.0),
                    //     child: ElevatedButton(
                    //       onPressed: () async {},
                    //       style: ElevatedButton.styleFrom(
                    //         padding: const EdgeInsets.all(0),
                    //         textStyle: const TextStyle(
                    //           color: Colors.white,
                    //         ),
                    //         primary: appColorPrimary, // background
                    //         shape: RoundedRectangleBorder(
                    //             borderRadius: BorderRadius.circular(3.0)),
                    //       ),
                    //       child: const Text("Proceed"),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
