import 'dart:convert';

import 'package:dms/layout/appWidget.dart';
import 'package:dms/model/atcmodels.dart';
import 'package:dms/model/ordermodels.dart';
import 'package:dms/screens/my_atc/atccancel.dart';
import 'package:dms/screens/my_atc/atcverify.dart';
import 'package:dms/screens/my_atc/save_order_success.dart';
import 'package:dms/screens/my_atc/schedule_delivery.dart';
import 'package:dms/services/orderservices.dart';
import 'package:dms/utils/animate_controller.dart';
import 'package:dms/utils/colors.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import '../../layout/loading_indicator_widget.dart';
import '../../utils/seperator.dart';
import '../accounts/accountdelete.dart';
import 'atcsuccess.dart';

class ATCOrderComfirmation extends StatefulWidget {
  int distributorsapid;
  String ordersapno;
  String deliverycity;
  String deliverystatecode;
  String countrycode;
  String deliveryType;
  String truckSize;
  String deliveryAddress;
  DateTime date;
  ATCOrderComfirmation(
      this.distributorsapid,
      this.ordersapno,
      this.deliverycity,
      this.deliverystatecode,
      this.countrycode,
      this.deliveryType,
      this.truckSize,
      this.deliveryAddress,
      this.date);

  @override
  State<ATCOrderComfirmation> createState() => _ATCOrderComfirmationState();
}

class _ATCOrderComfirmationState extends State<ATCOrderComfirmation> {
  bool isloading = false;
  bool nullValue = false;
  AtcSubmit? atcSubmit;
  @override
  void initState() {
    Provider.of<OrderBloc>(context, listen: false).isLoading = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    final _screenHeight = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return ModalProgressHUD(
      inAsyncCall: Provider.of<OrderBloc>(context, listen: false).isLoading,
      progressIndicator: AnimateWidget(),
      child: Scaffold(
        appBar: dmsAppBar(context, '', showBack: true, actions: [
          // IconButton(
          //   icon: Icon(
          //     Icons.save,
          //   ), onPressed: () {}, color: appColorPrimary,),
          // TextButton(
          //   onPressed: () {
          //     Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //             builder: (context) => SaveOrderSuccessScreen()));
          //   },
          //   child: Row(
          //     children: [
          //       Icon(
          //         Icons.save,
          //         size: _height * .024,
          //       ),
          //       SizedBox(
          //         width: _screenWidth * 0.01,
          //       ),
          //       Text(
          //         "Save Order",
          //         style: GoogleFonts.poppins(
          //           color: appColorPrimary,
          //           //fontWeight: FontWeight.w600,
          //           fontSize: _screenHeight * .014,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ]),
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.only(
                left: _screenWidth * 0.07, right: _screenWidth * 0.07),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: _screenHeight * 0.026,
                ),
                Text(
                  "My ATC",
                  style: GoogleFonts.poppins(
                    color: appColorPrimary,
                    fontWeight: FontWeight.w600,
                    fontSize: _screenHeight * .0284,
                  ),
                ),
                SizedBox(
                  height: _screenHeight * 0.014,
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: _screenWidth * .00),
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
                    // color: appWhite,
                    height: _screenHeight * .33,
                    width: _screenWidth * .85,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              _screenWidth * .04,
                              _screenHeight * .012,
                              _screenWidth * .04,
                              _screenHeight * .012),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Delivery type",
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          fontSize: _height * .019,
                                          color: Color(0xff333542)),
                                    ),
                                    Text(
                                      "Truck Size",
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          fontSize: _height * .019,
                                          color: Color(0xff333542)),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: _screenHeight * .0059,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      widget.deliveryType,
                                      style: GoogleFonts.poppins(
                                        fontSize: _screenHeight * .017,
                                        fontWeight: FontWeight.w300,
                                        color: Color(0xff333542),
                                      ),
                                    ),
                                    Text(
                                      widget.truckSize,
                                      style: GoogleFonts.poppins(
                                        fontSize: _screenHeight * .017,
                                        fontWeight: FontWeight.w300,
                                        color: Color(0xff333542),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: _screenHeight * .003),
                                // Text(
                                //   " myTitle[1].title,",
                                //   style: GoogleFonts.poppins(
                                //     fontSize: _screenHeight * .019,
                                //     fontWeight: FontWeight.w300,
                                //     color: Color(0xff7A7C85),
                                //   ),
                                // ),
                                // SizedBox(height: _screenHeight * .004),
                                // Text(
                                //   "myTitle[2].title",
                                //   style: GoogleFonts.poppins(
                                //     fontSize: _screenHeight * .019,
                                //     fontWeight: FontWeight.w300,
                                //     color: Color(0xff7A7C85),
                                //   ),
                                // ),
                              ]),
                        ),
                        SizedBox(
                          height: _screenHeight * .0188,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: _screenWidth * .05),
                          child: DottedLine(
                            dashColor: Color(0xffcbcbcb).withOpacity(0.6),
                          ),
                        ),
                        // Padding(
                        //   padding: EdgeInsets.symmetric(horizontal: _width * .05),
                        //   child: Divider(
                        //     height: _height * .01,
                        //     color: Color(0xffCBCBCB),
                        //   ),
                        // ),
                        SizedBox(height: _height * .0234),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: _width * .05),
                          child: Text(
                            "Delivery Date",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: _height * .019,
                                color: Color(0xff333542)),
                          ),
                        ),
                        SizedBox(height: _height * .003),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: _width * .05),
                          child: Text(
                            widget.date.day.toString() +
                                "-" +
                                widget.date.month.toString() +
                                "-" +
                                widget.date.year.toString(),
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w300,
                                fontSize: _height * .017,
                                color: Color(0xff333542)),
                          ),
                        ),
                        SizedBox(
                          height: _height * .0188,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: _width * .05),
                          child: DottedLine(
                            dashColor: Color(0xffcbcbcb).withOpacity(0.6),
                          ),
                        ),
                        // Padding(
                        //   padding: EdgeInsets.symmetric(horizontal: _width * .05),
                        //   child: Divider(
                        //     height: _height * .01,
                        //     color: Color(0xffCBCBCB),
                        //   ),
                        // ),
                        SizedBox(height: _height * .0188),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: _width * .05),
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
                              Text(
                                "",
                                style: GoogleFonts.poppins(
                                    fontSize: _height * .023,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff27AE60)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: _height * .003),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: _width * .05),
                          child: Text(
                            widget.deliveryAddress,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w300,
                                fontSize: _height * .017,
                                color: Color(0xff333542)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Card(
                //   color: Colors.white,
                //   elevation: 3,
                //   child: Padding(
                //     padding: EdgeInsets.only(bottom: _screenHeight * 0.02),
                //     child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         ListTile(
                //           leading: Column(
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               text("Delivery type",
                //                   textColor: Color(0xff333542), isBoldText: true),
                //               text("Self Collection",
                //                   textColor: Color(0xff333542), fontSize: 14.0),
                //             ],
                //           ),
                //           trailing: Column(
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               text("Truck Size",
                //                   textColor: Color(0xff333542), isBoldText: true),
                //               text("3500kg",
                //                   textColor: Color(0xff333542), fontSize: 14.0),
                //             ],
                //           ),
                //         ),
                //         // MySeparator(color: Color(0xff333542).withOpacity(0.6),),
                //         Padding(
                //           padding: EdgeInsets.all(_screenWidth * 0.05),
                //           child: DottedLine(
                //             dashColor: Color(0xffcbcbcb).withOpacity(0.6),
                //           ),
                //         ),
                //         ListTile(
                //           // tileColor: Colors.white,
                //           leading: Column(
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               text("Delivery Date",
                //                   textColor: Color(0xff333542), isBoldText: true),
                //               text("20/07/2022",
                //                   textColor: Color(0xff333542), fontSize: 14.0),
                //             ],
                //           ),
                //         ),
                //         // SizedBox(
                //         //   height: _screenHeight * 0.02,
                //         // ),
                //         // MySeparator(color: Color(0xff333542).withOpacity(0.6),),
                //         Padding(
                //           padding: EdgeInsets.all(_screenWidth * 0.05),
                //           child: DottedLine(
                //             dashColor: Color(0xffcbcbcb).withOpacity(0.6),
                //           ),
                //         ),
                //         // SizedBox(
                //         //   height: _screenHeight * 0.02,
                //         // ),
                //         ListTile(
                //           leading: Column(
                //             children: [
                //               text("Delivery Address",
                //                   textColor: Color(0xff333542), isBoldText: true),
                //             ],
                //           ),
                //         ),
                //         ListTile(
                //           leading: Column(
                //             children: [
                //               text(
                //                   "Garwood Court, Ikorodu Road, Ojodu Berger Phase 2, Lagos, Nigeria",
                //                   isLongText: true,
                //                   textColor: Color(0xff333542),
                //                   fontSize: 12.0),
                //             ],
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: _screenHeight * 0.32,
                ),
                Row(
                  children: [
                    //mypadr,
                    InkWell(
                      onTap: () {
                        setState(() {
                          Provider.of<OrderBloc>(context, listen: false)
                              .isLoading = true;
                        });
                        submitATC();
                      },
                      child: Container(
                        width: _width * .86,
                        height: _height * .0633,
                        decoration: BoxDecoration(
                          //border: Border.all(color: Color(0xffB1BBC6)),
                          color: appColorPrimary,
                        ),
                        child: Center(
                            child: Text(
                          "Confirm",
                          style: GoogleFonts.poppins(
                            color: appWhite,
                            fontSize: _height * .016,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: _screenHeight * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: _width * .00),
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
                          width: _width * .86,
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
                                fontSize: _height * .016,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
                // Align(
                //   alignment: Alignment.bottomCenter,
                //   child: Container(
                //     width: double.infinity,
                //     height: 55.0,
                //     margin: const EdgeInsetsDirectional.fromSTEB(
                //         10.0, 0.0, 10.0, 10.0),
                //     child: ElevatedButton(
                //       onPressed: () async {
                //         Navigator.push(context,
                //             MaterialPageRoute(builder: (context) => ATCverify()));
                //       },
                //       style: ElevatedButton.styleFrom(
                //         padding: const EdgeInsets.all(0),
                //         textStyle: const TextStyle(
                //           color: Colors.white,
                //         ),
                //         primary: appColorPrimary, // background
                //         shape: RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(3.0)),
                //       ),
                //       child: const Text("Confirm"),
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: _screenHeight * 0.02,
                // ),
                // Align(
                //   alignment: Alignment.bottomCenter,
                //   child: Container(
                //     width: double.infinity,
                //     height: 55.0,
                //     margin: const EdgeInsetsDirectional.fromSTEB(
                //         10.0, 0.0, 10.0, 10.0),
                //     child: ElevatedButton(
                //       onPressed: () async {
                //         showDialog(
                //             context: context,
                //             builder: (BuildContext context) {
                //               return _myDialog(context);
                //             });
                //       },
                //       style: ElevatedButton.styleFrom(
                //         padding: const EdgeInsets.all(0),
                //         textStyle: const TextStyle(
                //           color: appColorPrimary,
                //         ),
                //         side: BorderSide(
                //           width: 1.0,
                //           color: appColorPrimary,
                //         ),
                //         primary: Colors.white, // background
                //         shape: RoundedRectangleBorder(),
                //       ),
                //       child: const Text(
                //         "Cancel",
                //         style: TextStyle(color: appColorPrimary),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _myDialog(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    var containerheight = _height * .5142;
    var _mypadding = SizedBox(
      height: containerheight * .12,
    );
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: appWhite,
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
                  fontSize: _height * .019,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "Cancel ATS Delivery",
                style: GoogleFonts.poppins(
                  color: Color(0xff8D93A1),
                  fontSize: _height * .019,
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
                              builder: (context) => ATCsuccesscancel()));
                    },
                    child: Container(
                      //color: Color(0xffFFFFFF),
                      width: _width * .382,
                      height: _height * .0633,
                      decoration: BoxDecoration(
                        color: appColorPrimary,
                      ),
                      child: Center(
                          child: Text(
                        "Yes",
                        style: GoogleFonts.poppins(
                          color: appWhite,
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

  void submitATC() {
    Provider.of<OrderBloc>(context, listen: false)
        .submitAtcOrder(
            widget.distributorsapid,
            widget.ordersapno,
            widget.deliveryAddress,
            widget.deliverycity,
            widget.deliverystatecode,
            widget.countrycode,
            DateTime.parse(widget.date.toString()))
        .then((value) => output(value));
  }

  output(String responseAtc) async {
    print(responseAtc);
    var bodyT = jsonDecode(responseAtc);
    if (bodyT["status"] == "Successful") {
      setState(() {
        Provider.of<OrderBloc>(context, listen: false).isLoading = false;
        atcSubmit = AtcSubmit.fromJson(bodyT);
      });
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setInt("otpid", bodyT["data"]["otp"]["otpid"]);
      var _otpId = sharedPreferences.getInt("otpid");
      Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ATCverify(_otpId!)));
    } else {
      setState(() {
        Provider.of<OrderBloc>(context, listen: false).isLoading = false;
      });
      toast(bodyT["message"]);
    }
  }
}
