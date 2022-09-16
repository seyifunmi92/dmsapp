import 'package:dms/constant.dart';
import 'package:dms/layout/appWidget.dart';
import 'package:dms/layout/dms_drawer.dart';
import 'package:dms/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WalletEmptyScreen extends StatefulWidget {
  const WalletEmptyScreen({Key? key}) : super(key: key);

  @override
  State<WalletEmptyScreen> createState() => _WalletEmptyScreenState();
}

class _WalletEmptyScreenState extends State<WalletEmptyScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool menuClicked = false;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    var mypaddingr = SizedBox(
      width: _width * 0.07436,
    );
    var mypaddingr2 = SizedBox(
      width: _width * 0.056,
    );

    var mypaddingrh = SizedBox(
      height: _height * 0.026,
    );

    return Scaffold(
      key: _scaffoldKey,
      appBar: dmsDrawerAppBar(
        context,
        '',
        () {
          _scaffoldKey.currentState!.openDrawer();
          setState(() {
            menuClicked = true;
          });
        },
      ),
      drawer: DMSDrawer(),
      backgroundColor: appWhite,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: _height * .02,
            ),
            Row(
              children: [
                mypaddingr,
                Text(
                  "My Wallet",
                  style: GoogleFonts.poppins(
                    fontSize: _width * .062,
                    fontWeight: FontWeight.w600,
                    color: appColorPrimary,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: _height * .03,
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
                height: _height * .06,
                width: _width * 0.85,
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Select Account",
                      style: TextStyle(
                        color: iconColorSecondary,
                        //fontFamily: fontRegular,
                        fontSize: _height * .018,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: iconColorSecondary,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: _height * .025,
            ),
            Row(
              children: [
                //mypaddingr,
                Column(
                  children: [
                    // SizedBox(
                    //   height: _height * .017,
                    // ),
                    //mypaddingrh,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: _width * .075),
                      child: Row(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: _width * .85,
                                height: _height * .18,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        appColorPrimary,
                                        Color(0xff292669),
                                      ]),
                                  //color: appColorPrimary,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      _width * .06,
                                      _height * .027,
                                      _width * .06,
                                      _height * .027),
                                  child: SingleChildScrollView(
                                    child: Column(children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          InkWell(
                                            onTap: () {},
                                            child: Image.asset(
                                              "lib/assets/dmsdots.png",
                                              height: _height * .0047,
                                              width: _width * .041,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          // mypaddingr2,
                                          Image.asset(
                                            "assets/icons/walletpg.png",
                                            height: _height * .047,
                                            width: _width * .103,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: _height * .005,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          // mypaddingr2,
                                          Text(
                                            "Current Balance",
                                            style: GoogleFonts.openSans(
                                              color: Color(0xffE9EDF7),
                                              //fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              fontSize: _height * .014,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: _height * .002,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          // mypaddingr2,
                                          Text(
                                            "N250,215",
                                            style: GoogleFonts.openSans(
                                              color: appWhite,
                                              fontSize: _height * .04,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),

                                          Image.asset(
                                            "lib/assets/dmsgraph.png",
                                            color: appWhite,
                                            height: _height * .020,
                                            width: _width * .151,
                                          ),
                                        ],
                                      ),
                                    ]),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // mypaddingr,
                          // Container(
                          //   width: _width * .85,
                          //   height: _height * .18,
                          //   decoration: BoxDecoration(
                          //     gradient: const LinearGradient(
                          //         begin: Alignment.topLeft,
                          //         end: Alignment.bottomRight,
                          //         colors: [
                          //           appColorPrimary,
                          //           Color(0xff292669),
                          //         ]),
                          //     //color: appColorPrimary,
                          //     borderRadius: BorderRadius.circular(5),
                          //   ),
                          //   child: SingleChildScrollView(
                          //     child: Column(children: [
                          //       SizedBox(
                          //         height: _height * .017,
                          //       ),
                          //       Row(
                          //         children: [
                          //           mypaddingr,
                          //           Container(
                          //             width: _width * .85,
                          //             height: _height * .18,
                          //             decoration: BoxDecoration(
                          //               gradient: const LinearGradient(
                          //                   begin: Alignment.topLeft,
                          //                   end: Alignment.bottomRight,
                          //                   colors: [
                          //                     appColorPrimary,
                          //                     Color(0xff292669),
                          //                   ]),
                          //               //color: appColorPrimary,
                          //               borderRadius: BorderRadius.circular(5),
                          //             ),
                          //             child: Padding(
                          //               padding: EdgeInsets.fromLTRB(_width * .0,
                          //                   _height * .0, _width * .0, _height * .027),
                          //               child: SingleChildScrollView(
                          //                 child: Column(children: [
                          //                   Row(
                          //                     mainAxisAlignment: MainAxisAlignment.end,
                          //                     children: [
                          //                       InkWell(
                          //                         onTap: () {},
                          //                         child: Image.asset(
                          //                           "lib/assets/dmsdots.png",
                          //                           height: _height * .0047,
                          //                           width: _width * .041,
                          //                         ),
                          //                       ),
                          //                     ],
                          //                   ),
                          //                   Row(
                          //                     mainAxisAlignment:
                          //                         MainAxisAlignment.start,
                          //                     children: [
                          //                       // mypaddingr2,
                          //                       Image.asset(
                          //                         "assets/icons/walletpg.png",
                          //                         height: _height * .047,
                          //                         width: _width * .103,
                          //                       ),
                          //                     ],
                          //                   ),
                          //                   SizedBox(
                          //                     height: _height * .005,
                          //                   ),
                          //                   Row(
                          //                     mainAxisAlignment:
                          //                         MainAxisAlignment.start,
                          //                     children: [
                          //                       // mypaddingr2,
                          //                       Text(
                          //                         "Current Balance",
                          //                         style: GoogleFonts.openSans(
                          //                           color: Color(0xffE9EDF7),
                          //                           //fontSize: 12,
                          //                           fontWeight: FontWeight.w400,
                          //                           fontSize: _height * .014,
                          //                         ),
                          //                       ),
                          //                     ],
                          //                   ),
                          //                   SizedBox(
                          //                     height: _height * .002,
                          //                   ),
                          //                   Row(
                          //                     mainAxisAlignment:
                          //                         MainAxisAlignment.spaceBetween,
                          //                     children: [
                          //                       // mypaddingr2,
                          //                       Text(
                          //                         "N250,215",
                          //                         style: GoogleFonts.openSans(
                          //                           color: appWhite,
                          //                           fontSize: _height * .04,
                          //                           fontWeight: FontWeight.w700,
                          //                         ),
                          //                       ),

                          //                       Image.asset(
                          //                         "lib/assets/dmsgraph.png",
                          //                         color: appWhite,
                          //                         height: _height * .020,
                          //                         width: _width * .151,
                          //                       ),
                          //                     ],
                          //                   ),
                          //                 ]),
                          //               ),
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //       //mypaddingrh,

                          //       // Row(
                          //       //   children: [
                          //       //     mypaddingr2,
                          //       //     Image.asset(
                          //       //       "assets/icons/walletpg.png",
                          //       //       height: _height * .047,
                          //       //       width: _width * .103,
                          //       //     ),
                          //       //   ],
                          //       // ),
                          //       // SizedBox(
                          //       //   height: _height * .005,
                          //       // ),
                          //       // Row(
                          //       //   children: [
                          //       //     mypaddingr2,
                          //       //     Text(
                          //       //       "Current Balance",
                          //       //       style: GoogleFonts.openSans(
                          //       //         color: Color(0xffE9EDF7),
                          //       //         fontSize: _width * .031,
                          //       //         fontWeight: FontWeight.w400,
                          //       //       ),
                          //       //     ),
                          //       //   ],
                          //       // ),
                          //       // SizedBox(
                          //       //   height: _height * .002,
                          //       // ),
                          //       // Row(
                          //       //   children: [
                          //       //     mypaddingr2,
                          //       //     Text(
                          //       //       "N250,215",
                          //       //       style: GoogleFonts.openSans(
                          //       //         color: appWhite,
                          //       //         fontSize: _width * .087,
                          //       //         fontWeight: FontWeight.w700,
                          //       //       ),
                          //       //     ),
                          //       //     SizedBox(width: _width * .2),
                          //       //     Image.asset(
                          //       //       "lib/assets/dmsgraph.png",
                          //       //       color: appWhite,
                          //       //       height: _height * .020,
                          //       //       width: _width * .151,
                          //       //     ),
                          //       //   ],
                          //       // ),
                          //     ]),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: _height * .02,
                    ),
                    Row(
                      children: [
                        //mypaddingr,
                        Text(
                          "Wallet History",
                          style: GoogleFonts.poppins(
                            fontSize: _height * .017,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff000000),
                          ),
                        ),
                        SizedBox(width: _width * .4),
                        TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              // Icon(
                              //   Icons.filter_alt_outlined, size: 17,
                              // ),
                              Image.asset(
                                "assets/icons/figmafilter.png",
                                width: 17,
                              ),
                              SizedBox(
                                width: _width * 0.01,
                              ),

                              Text(
                                "Filter",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w300,
                                  fontSize: _height * .017,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    mypaddingrh,
                    Image.asset(
                      "assets/gif/empty1.png",
                      alignment: Alignment.center,
                      // width: 200,
                      height: _height * .20,
                    ),
                    SizedBox(
                      height: _height * 0.06,
                    ),
                    text("Transaction History Empty",
                        fontSize: _height * .020,
                        textColor: appTextColorSecondary),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


// To parse this JSON data, do
//
//     final getBalance = getBalanceFromJson(jsonString);

