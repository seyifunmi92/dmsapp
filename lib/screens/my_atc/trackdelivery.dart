import 'package:dms/layout/appWidget.dart';
import 'package:dms/screens/my_atc/schedule_delivery.dart';
import 'package:dms/utils/colors.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ATCTrackdelivery2 extends StatefulWidget {
  const ATCTrackdelivery2({Key? key}) : super(key: key);

  @override
  _ATCTrackdelivery2State createState() => _ATCTrackdelivery2State();
}

class _ATCTrackdelivery2State extends State<ATCTrackdelivery2> {
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
            "Track Delivery",
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
            height: _height * .276,
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
                  _width * .07, _height * .035, _width * .07, _height * .01),
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
                      "Trip 1d: TP00912",
                      style: GoogleFonts.openSans(
                        fontSize: _height * .0213,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: _height * .00023,
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
                        "Location: Abeokuta Plant",
                        style: GoogleFonts.openSans(
                          fontSize: _height * .0142,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: _height * .00023,
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
                        "Status: Loaded in Truck",
                        style: GoogleFonts.openSans(
                          fontSize: _height * .0142,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: _height * .00023,
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
                        "Time Updated: 09:00AM 12/09/2022",
                        style: GoogleFonts.openSans(
                          fontSize: _height * .0142,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: _height * .0284,
                ),
                // Row(
                //   children: [
                //     Image.asset(
                //       "lib/assets/okay.png",
                //       height: _height * .0296,
                //     ),
                //     SizedBox(
                //       width: _width * .05,
                //     ),
                //     Text(
                //       "Processing",
                //       style: GoogleFonts.openSans(
                //         fontSize: _height * .0213,
                //         fontWeight: FontWeight.w700,
                //       ),
                //     ),
                //   ],
                // ),
                // Padding(
                //   padding: EdgeInsets.only(left: _width * .115),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     children: [
                //       // Image.asset("lib/assets/okay.png"),
                //       // SizedBox(
                //       //   width: _width * .05,
                //       // ),
                //       Text(
                //         "Order is been processed",
                //         style: GoogleFonts.openSans(
                //           fontSize: _height * .0166,
                //           fontWeight: FontWeight.w300,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   height: _height * .0059,
                // ),
                // Padding(
                //   padding: EdgeInsets.only(left: _width * .115),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     children: [
                //       // Image.asset("lib/assets/okay.png"),
                //       // SizedBox(
                //       //   width: _width * .05,
                //       // ),
                //       Text(
                //         "13/08/2022",
                //         style: GoogleFonts.openSans(
                //           fontSize: _height * .0166,
                //           fontWeight: FontWeight.w300,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   height: _height * .0284,
                // ),
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
                    SizedBox(
                      width: _width * .05,
                    ),
                    Text(
                      "Trip ID: TP00912",
                      style: GoogleFonts.openSans(
                        fontSize: _height * .0213,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: _height * .00023,
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
                        "Location: Abeokuta Plant",
                        style: GoogleFonts.openSans(
                          fontSize: _height * .0142,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: _height * .00023,
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
                        "Status: Loaded in Truck",
                        style: GoogleFonts.openSans(
                          fontSize: _height * .0142,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: _height * .00023,
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
                        "Time Updated: 09:00AM 12/09/2022",
                        style: GoogleFonts.openSans(
                          fontSize: _height * .0142,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(
                //   height: _height * .0284,
                // ),
                // Row(
                //   children: [
                //     Container(
                //       height: _height * .0296,
                //       width: _width * .0641,
                //       decoration: BoxDecoration(
                //         color: Colors.white,
                //         borderRadius: BorderRadius.circular(20),
                //         border: Border.all(
                //           color: Colors.black,
                //           width: 3,
                //         ),
                //       ),
                //     ),
                //     //Image.asset("lib/assets/okay.png"),
                //     SizedBox(
                //       width: _width * .05,
                //     ),
                //     Text(
                //       "Dispatched",
                //       style: GoogleFonts.openSans(
                //         fontSize: _height * .0213,
                //         fontWeight: FontWeight.w700,
                //         color: Color(0xff343434).withOpacity(0.2),
                //       ),
                //     ),
                //   ],
                // ),
                // SizedBox(
                //   height: _height * .0284,
                // ),
                // Padding(
                //   padding: EdgeInsets.only(left: _width * .115),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     children: [
                //       // Image.asset("lib/assets/okay.png"),
                //       // SizedBox(
                //       //   width: _width * .05,
                //       // ),
                //       Text(
                //         "Enroute Delivery",
                //         style: GoogleFonts.openSans(
                //           fontSize: _height * .0213,
                //           fontWeight: FontWeight.w700,
                //           color: Color(0xff343434).withOpacity(0.2),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   height: _height * .0284,
                // ),
                // Padding(
                //   padding: EdgeInsets.only(left: _width * .115),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     children: [
                //       // Image.asset("lib/assets/okay.png"),
                //       // SizedBox(
                //       //   width: _width * .05,
                //       // ),
                //       Text(
                //         "Delivered",
                //         style: GoogleFonts.openSans(
                //           fontSize: _height * .0213,
                //           fontWeight: FontWeight.w700,
                //           color: Color(0xff343434).withOpacity(0.2),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ]),
            ),
          ),
        ]),
      ),
    );
  }
}
