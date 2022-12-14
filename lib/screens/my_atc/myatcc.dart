import 'dart:convert';

import 'package:dms/constant.dart';
import 'package:dms/layout/appWidget.dart';
import 'package:dms/layout/dms_drawer.dart';
import 'package:dms/model/ordermodels.dart';
import 'package:dms/screens/my_atc/my_atc_detail.dart';
import 'package:dms/screens/my_atc/my_atc_order_list.dart';
import 'package:dms/services/orderservices.dart';
import 'package:dms/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../../layout/loading_indicator_widget.dart';

class MyATCC extends StatefulWidget {
  int sapID;
  String orderSapNumber;
  MyATCC(this.sapID, this.orderSapNumber);

  @override
  _MyATCCState createState() => _MyATCCState();
}

class _MyATCCState extends State<MyATCC> {
  List<ItemATC>? myAtc;
  bool emptyList = false;
  @override
  void initState() {
    print(widget.sapID);
    print(widget.orderSapNumber);
    // print("eyi see am");
    // print(widget.sapID);
    // print(widget.orderSapNumber);
    Provider.of<OrderBloc>(context, listen: false).isLoading = true;
    getATCs(widget.sapID, widget.orderSapNumber);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provider.of<OrderBloc>(context, listen: false).isLoading
        ? Scaffold(
            body: Center(child: LoadingIndicatorWidget()),
          )
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: dmsAppBar(context, ""),
            body: _body(context),
          );
  }

  Widget _body(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    var mypadr = SizedBox(width: _width * .04);
    var mypadh = SizedBox(height: _height * .008);
    var mypadh2 = SizedBox(height: _height * .0166);

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: _width * .06),
          child: Column(
            children: [
              SizedBox(
                height: _height * 0.026,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "My ATC",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: _height * .0284,
                      color: appColorPrimary,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return _filterATCDialog(context);
                          });
                    },
                    child: Container(
                      color: appColorPrimary,
                      height: _height * .0569,
                      width: _width * .1205,
                      child: Image.asset("lib/assets/new.png"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: _height * .021,
        ),
        // Padding(
        //   padding: EdgeInsets.symmetric(horizontal: _width * .04),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       GestureDetector(
        //         onTap: () {},
        //         child: Container(
        //           decoration: BoxDecoration(
        //               color: inputBackgroundColor,
        //               border: Border.all(
        //                   color: inputBorderColor,
        //                   width: 1,
        //                   style: BorderStyle.solid)),
        //           height: _height * .0533,
        //           width: _width * 0.73,
        //           padding: EdgeInsets.symmetric(horizontal: 14, vertical: 13),
        //           // child: Row(
        //           //   mainAxisAlignment: MainAxisAlignment.start,
        //           //   children: [
        //           //     Icon(
        //           //       Icons.search_rounded,
        //           //       color: Color(0xffB7BBC5),
        //           //       size: _height * .0313,
        //           //     ),
        //           //     Padding(
        //           //       padding: EdgeInsets.only(left: _width * 0.01),
        //           //       child: Text(
        //           //         "Search with ATC No",
        //           //         style: GoogleFonts.poppins(
        //           //           color: Color(0xffB7BBC5),
        //           //           fontWeight: FontWeight.w400,
        //           //           //fontFamily: fontRegular,
        //           //           fontSize: _height * .017,
        //           //         ),
        //           //         textAlign: TextAlign.start,
        //           //       ),
        //           //     ),
        //           //   ],
        //           // ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        SizedBox(
          height: _height * .014,
        ),
        emptyList
            ? Column(
                children: [
                  SizedBox(
                    height: _height * .28,
                  ),
                  Text(
                    "You have no ATC order at the moment",
                    style: GoogleFonts.poppins(
                        color: appColorPrimary,
                        fontSize: _height * .02,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              )
            : Column(
                children: [
                  mypadr,
                  ...myAtc!.map((e) => atcCustom(e)),
                ],
              ),
      ],
    );
  }

  // Widget _boxCustom4(BuildContext context) {
  //   double _width = MediaQuery.of(context).size.width;
  //   double _height = MediaQuery.of(context).size.height;
  //   var mypaddingr2 = SizedBox(width: _width * 0.05);
  //   var mypadhh = SizedBox(height: _height * .02);
  //   return InkWell(
  //     onTap: () {
  //       Navigator.push(
  //           context, MaterialPageRoute(builder: (context) => MyATCDetail()));
  //     },
  //     child: Container(
  //       width: _width * .92,
  //       height: _height * .104,
  //       decoration: BoxDecoration(
  //         boxShadow: [
  //           BoxShadow(
  //             color: Colors.black12,
  //             blurStyle: BlurStyle.outer,
  //             blurRadius: 10,
  //             spreadRadius: 0,
  //             offset: Offset.zero,
  //           ),
  //         ],
  //         color: appWhite,
  //         borderRadius: BorderRadius.circular(5),
  //       ),
  //       child: SingleChildScrollView(
  //         child: Column(children: [
  //           SizedBox(
  //             height: _height * .013,
  //           ),
  //           Padding(
  //             padding: EdgeInsets.symmetric(horizontal: _width * .05),
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 //mypaddingr2,
  //                 Text(
  //                   "ATC 123",
  //                   style: GoogleFonts.openSans(
  //                       fontSize: _height * .02,
  //                       fontWeight: FontWeight.w700,
  //                       color: Color(0xff343434)),
  //                 ),
  //                 //SizedBox(width: _width * .45),
  //                 Text(
  //                   "12-05-22",
  //                   style: GoogleFonts.openSans(
  //                     fontSize: _height * .02,
  //                     fontWeight: FontWeight.w700,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //           mypadhh,
  //           Padding(
  //             padding: EdgeInsets.symmetric(horizontal: _width * .05),
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 //mypaddingr2,
  //                 Text(
  //                   "N200,000",
  //                   style: GoogleFonts.openSans(
  //                     fontSize: _height * .0166,
  //                     fontWeight: FontWeight.w300,
  //                     color: Color(0xff333542),
  //                   ),
  //                 ),
  //                 // SizedBox(width: _width * .54),
  //                 Container(
  //                   height: _height * .0225,
  //                   width: _width * .159,
  //                   decoration: BoxDecoration(
  //                       color: Color.fromRGBO(30, 174, 96, .13),
  //                       borderRadius: BorderRadius.circular(5)),
  //                   child: Center(
  //                       child: Text(
  //                     "Completed",
  //                     style: GoogleFonts.openSans(
  //                         fontSize: _height * .0118,
  //                         fontWeight: FontWeight.w400,
  //                         color: Color(0xff8d93a1)),
  //                   )),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ]),
  //       ),
  //     ),
  //   );
  // }

  // Widget _boxCustom5(BuildContext context) {
  //   double _width = MediaQuery.of(context).size.width;
  //   double _height = MediaQuery.of(context).size.height;
  //   var mypaddingr2 = SizedBox(width: _width * 0.05);
  //   var mypadhh = SizedBox(height: _height * .02);
  //   return InkWell(
  //     onTap: () {
  //       Navigator.push(
  //           context, MaterialPageRoute(builder: (context) => MyATCDetail()));
  //     },
  //     child: Container(
  //       width: _width * .92,
  //       height: _height * .104,
  //       decoration: BoxDecoration(
  //         boxShadow: [
  //           BoxShadow(
  //             color: Colors.black12,
  //             blurStyle: BlurStyle.outer,
  //             blurRadius: 10,
  //             spreadRadius: 0,
  //             offset: Offset.zero,
  //           ),
  //         ],
  //         color: appWhite,
  //         borderRadius: BorderRadius.circular(5),
  //       ),
  //       child: SingleChildScrollView(
  //         child: Column(children: [
  //           SizedBox(
  //             height: _height * .013,
  //           ),
  //           Padding(
  //             padding: EdgeInsets.symmetric(horizontal: _width * .05),
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 //mypaddingr2,
  //                 Text(
  //                   "ATC 123",
  //                   style: GoogleFonts.openSans(
  //                       fontSize: _height * .02,
  //                       fontWeight: FontWeight.w700,
  //                       color: Color(0xff343434)),
  //                 ),
  //                 //SizedBox(width: _width * .45),
  //                 Text(
  //                   "12-05-22",
  //                   style: GoogleFonts.openSans(
  //                     fontSize: _height * .02,
  //                     fontWeight: FontWeight.w700,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //           mypadhh,
  //           Padding(
  //             padding: EdgeInsets.symmetric(horizontal: _width * .05),
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 //mypaddingr2,
  //                 Text(
  //                   "N200,000",
  //                   style: GoogleFonts.openSans(
  //                     fontSize: _height * .0166,
  //                     fontWeight: FontWeight.w300,
  //                     color: Color(0xff333542),
  //                   ),
  //                 ),
  //                 // SizedBox(width: _width * .54),
  //                 Container(
  //                   height: _height * .0237,
  //                   width: _width * .1564,
  //                   decoration: BoxDecoration(
  //                       color: Color(0xffb2efff),
  //                       borderRadius: BorderRadius.circular(5)),
  //                   child: Center(
  //                       child: Text(
  //                     "Processing",
  //                     style: GoogleFonts.openSans(
  //                         fontSize: _height * .0118,
  //                         fontWeight: FontWeight.w400,
  //                         color: Color(0xff8d93a1)),
  //                   )),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ]),
  //       ),
  //     ),
  //   );
  // }

  Widget atcCustom(ItemATC atc) {
    final _format = NumberFormat("#,###,000.00");
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    var mypadhh = SizedBox(height: _height * .02);
    return Padding(
      padding: EdgeInsets.only(
          bottom: _height * .014, left: _width * .05, right: _width * .05),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      MyATCDetail(widget.sapID, widget.orderSapNumber)));
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
                    //mypaddingr2,
                    Text(
                      "ATC ${atc.dmsorderId}",
                      style: GoogleFonts.openSans(
                          fontSize: _height * .02,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff343434)),
                    ),
                    //SizedBox(width: _width * .45),
                    Text(
                      atc.dateCreated!.day.toString() +
                          "-" +
                          atc.dateCreated!.month.toString() +
                          "-" +
                          atc.dateCreated!.year.toString(),
                      style: GoogleFonts.openSans(
                        fontSize: _height * .02,
                        fontWeight: FontWeight.w700,
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
                    Text(
                      atc.estimatedNetvalue != 0.00
                          ? "N${_format.format(atc.estimatedNetvalue)}"
                          : "N0.00",
                      style: GoogleFonts.openSans(
                        fontSize: _height * .0166,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff333542),
                      ),
                    ),
                    Container(
                      height: _height * .0237,
                      width: _width * .171,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(142, 172, 222, .57),
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                          child: Text(
                        atc.orderType!.name!,
                        style: GoogleFonts.openSans(
                            fontSize: _height * .009,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff8d93a1)),
                      )),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Widget _filterATCDialog(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    var containerheight = _height * .354;
    var _mypadding = SizedBox(height: containerheight * .12);
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
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                _width * .06, _height * .037, _width * .06, _height * .037),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Filter ATC",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: _height * .0284,
                        color: appColorPrimary,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: _height * .023,
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
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: _width * .04),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Date Created",
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
                SizedBox(
                  height: _height * .018,
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
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: _width * .04),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Status",
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
                                size: _height * .0296,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: _height * .022,
                ),
                InkWell(
                  onTap: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => OrderItems()));
                    Navigator.pop(context);
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
                      "Set Filter",
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
          ),
        ),
      ),
    );
  }

  void getATCs(int sapAccId, String sapNumber) {
    Provider.of<OrderBloc>(context, listen: false)
        .getmyATCOrders(sapAccId, sapNumber)
        .then((value) => atcOutput(value));
  }

  atcOutput(String _payload) {
    print(_payload);
    List empty = [];
    var bodyT = jsonDecode(_payload);
    if (_payload.contains("data")) {
      if (bodyT["data"]["items"] != empty) {
        Provider.of<OrderBloc>(context, listen: false).isLoading = false;
        dynamic _atcD = bodyT;
        List atcList = _atcD["data"]["items"];
        if (atcList.isEmpty) {
          Provider.of<OrderBloc>(context, listen: false).isLoading = false;
          emptyList = true;
        }
        setState(() {
          emptyList ? toast("Oops.No ATC Orders") : toast(bodyT["message"]);
          myAtc = atcList.map<ItemATC>((e) => ItemATC.fromJson(e)).toList();
        });
      } else {
        Provider.of<OrderBloc>(context, listen: false).isLoading = false;
        toast(bodyT["message"]);
      }
    }
  }
}
