import 'package:dms/layout/appWidget.dart';
import 'package:dms/screens/my_atc/schedule_delivery.dart';
import 'package:dms/utils/colors.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ATCTrackDelivery extends StatefulWidget {
  const ATCTrackDelivery({Key? key}) : super(key: key);

  @override
  _ATCTrackDeliveryState createState() => _ATCTrackDeliveryState();
}

class _ATCTrackDeliveryState extends State<ATCTrackDelivery> {
  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    final _screenHeight = MediaQuery.of(context).size.height;
    // var mypadr = SizedBox(width: _width * .04);
    var contHeight = MediaQuery.of(context).size.height * .71;

    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    var mypadr = SizedBox(width: _width * .04);
    return Scaffold(
      appBar: dmsAppBar(context, '', showBack: true),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.only(
              left: _screenWidth * 0.04, right: _screenWidth * 0.04),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: _screenHeight * 0.026,
              ),
              //text("ATC", isBoldText: true, fontSize: 28.0),

              Text(
                "ATC",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: _screenHeight * .0267,
                  color: appColorPrimary,
                ),
              ),

              SizedBox(
                height: _screenHeight * 0.0144,
              ),
              Container(
                width: _width * .92,
                height: _height * .74,
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
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: _width * .04),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //mypadr,
                          Text(
                            "Item",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: _height * .02,
                              color: Color(0xff333542),
                            ),
                          ),
                          Text(
                            "Material",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: _height * .02,
                              color: Color(0xff333542),
                            ),
                          ),
                        ],
                      ),
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
                            "00010",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w300,
                              fontSize: _height * .016,
                              color: Color(0xff333542),
                            ),
                          ),
                          Text(
                            "2000000002000008",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w300,
                              fontSize: _height * .016,
                              color: Color(0xff333542),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //SizedBox(height: contHeight * .005),
                    // Row(
                    //   children: [
                    //     mypadr,
                    //     Text(
                    //       "Bag of Cements",
                    //       style: GoogleFonts.poppins(
                    //         fontWeight: FontWeight.w300,
                    //         fontSize: _height * .02,
                    //         color: Color(0xff7A7C85),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(height: _height * .004),

                    // Row(
                    //   children: [
                    //     mypadr,
                    //     Text(
                    //       "Bag of Cements",
                    //       style: GoogleFonts.poppins(
                    //         fontWeight: FontWeight.w300,
                    //         fontSize: _height * .02,
                    //         color: Color(0xff7A7C85),
                    //       ),
                    //     ),
                    //   ],
                    // ),
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
                            "Description",
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
                            "Quantity",
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
                            "Non-fortufied Sugar",
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
                            "000.0",
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
                            "UOM",
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
                            "Price Unit",
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
                            "Bag",
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
                            "934.88",
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
                            "Date",
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
                            "041234",
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
                            "27/05/2022",
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
                            "Reference No",
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
                            "Current Status",
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
                      height: contHeight * .005,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: _width * .04),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //mypadr,
                          Text(
                            "Test1",
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
                            "Processing",
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
                    // SizedBox(
                    //   height: _height * .020,
                    // ),
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
                            "Destination",
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
                            "Plant",
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
                      height: contHeight * .005,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: _width * .04),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //mypadr,
                          Text(
                            "Abeokuta(Light Truck)",
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
                            "DSR Apapa PD",
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
                            "VAT",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              color: Color(0xff7A7C85),
                              fontSize: _height * .02,
                            ),
                          ),
                          // SizedBox(
                          //   width: _width * .67,
                          // ),
                          Text(
                            "N3,000",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w700,
                              color: Color(0xff27AE60),
                              fontSize: _height * .024,
                            ),
                          ),
                        ],
                      ),
                    ),
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
              // Card(
              //   color: Colors.white,
              //   elevation: 3,
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       ListTile(
              //         leading: Column(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             text("Item",
              //                 textColor: Color(0xff333542), isBoldText: true),
              //             text("00010", fontSize: 14.0),
              //           ],
              //         ),
              //         trailing: Column(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             text("Material",
              //                 textColor: Color(0xff333542), isBoldText: true),
              //             text("200000000", fontSize: 14.0),
              //           ],
              //         ),
              //       ),
              //       Divider(),
              //       ListTile(
              //         // tileColor: Colors.white,
              //         leading: Column(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             text("Description",
              //                 textColor: Color(0xff333542), isBoldText: true),
              //             text("Non-fortified", fontSize: 14.0),
              //           ],
              //         ),
              //         trailing: Column(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             text("Quantity",
              //                 textColor: Color(0xff333542), isBoldText: true),
              //             text("900.00", fontSize: 14.0),
              //           ],
              //         ),
              //       ),
              //       Divider(),
              //       ListTile(
              //         leading: Column(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             text("UOM",
              //                 textColor: Color(0xff333542), isBoldText: true),
              //             text("Bag", fontSize: 14.0),
              //           ],
              //         ),
              //         trailing: Column(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             text("Price Unit",
              //                 textColor: Color(0xff333542), isBoldText: true),
              //             text("934.88", fontSize: 14.0),
              //           ],
              //         ),
              //       ),
              //       Divider(),
              //       ListTile(
              //         // tileColor: Colors.white,
              //         leading: Column(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             text("Order ID",
              //                 textColor: Color(0xff333542), isBoldText: true),
              //             text("OR1234", fontSize: 14.0),
              //           ],
              //         ),
              //         trailing: Column(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             text("Date",
              //                 textColor: Color(0xff333542), isBoldText: true),
              //             text("27/05/2022", fontSize: 14.0),
              //           ],
              //         ),
              //       ),
              //       Divider(
              //         indent: 5.0,
              //       ),
              //       ListTile(
              //         // tileColor: Colors.white,
              //         leading: Column(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             text("Reference",
              //                 textColor: Color(0xff333542), isBoldText: true),
              //             text("48120945", fontSize: 14.0),
              //           ],
              //         ),
              //         trailing: Column(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             text("Plant",
              //                 textColor: Color(0xff333542), isBoldText: true),
              //             text("DSR Apapa PD", fontSize: 14.0),
              //           ],
              //         ),
              //       ),
              //       Divider(),
              //       ListTile(
              //         // tileColor: Colors.white,
              //         leading: Column(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             text("Destination",
              //                 textColor: Color(0xff333542), isBoldText: true),
              //             text("Abeokuta", fontSize: 14.0),
              //           ],
              //         ),
              //       ),
              //       Divider(),
              //       Padding(
              //         padding: EdgeInsets.all(_screenHeight * 0.02),
              //         child: Column(
              //           children: [
              //             Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               children: [
              //                 text(
              //                   "VAT",
              //                   textColor: Color(0xff333542),
              //                 ),
              //                 text(
              //                   "N3,000",
              //                   isBoldText: true,
              //                   textColor: Color(0xFF27AE60),
              //                 ),
              //               ],
              //             ),
              //             Divider(),
              //             Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               children: [
              //                 text(
              //                   "Total Price",
              //                   textColor: Color(0xff333542),
              //                 ),
              //                 text(
              //                   "N20,000",
              //                   isBoldText: true,
              //                   textColor: Color(0xFF27AE60),
              //                 ),
              //               ],
              //             ),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(
                height: _screenHeight * 0.02,
              ),
              //SizedBox(height: _height * .01),
              Row(
                children: [
                  //mypadr,
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ScheduleDelivery()));
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
                        "Track Delivery",
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
                            "Print ATC",
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
        ),
      ),
    );
  }
}
