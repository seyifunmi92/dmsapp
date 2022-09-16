import 'package:dms/constant.dart';
import 'package:dms/layout/appWidget.dart';
import 'package:dms/layout/dms_drawer.dart';
import 'package:dms/screens/wallet/wallet_empty.dart';
import 'package:dms/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  String date = "";
  DateTime selectedDateFrom = DateTime.now();
  DateTime selectedDateTo = DateTime.now();
  bool isSelectFrom = false;
  bool isSelectTo = false;
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

    openActionSheet() {
      return showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) => CupertinoActionSheet(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Date:",
                style: GoogleFonts.poppins(
                  color: Color(0xff000000),
                  fontSize: _height * .017,
                ),
                // fontSize: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      _selectDateFrom(context);
                    },
                    child: Row(
                      children: [
                        isSelectFrom
                            ? Text(
                                "From: ${selectedDateFrom.day}/${selectedDateFrom.month}/${selectedDateFrom.year}",
                                style: GoogleFonts.poppins(
                                  fontSize: _height * .0142,
                                  fontWeight: FontWeight.w300,
                                  color: Color(0xff000000),
                                ),

                                //ontSize: _height * .0142,
                                // latterSpacing: 0.0
                              )
                            : Text(
                                "From:",
                                style: GoogleFonts.poppins(
                                  fontSize: _height * .0142,
                                  fontWeight: FontWeight.w300,
                                  color: Color(0xff000000),
                                ),
                              ),
                        //fontSize: 15.0,

                        SizedBox(
                          width: _width * 0.01,
                        ),
                        Icon(
                          Icons.calendar_month_outlined,
                          size: _height * .02,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: _width * 0.06,
                  ),
                  GestureDetector(
                    onTap: () {
                      _selectDateTo(context);
                    },
                    child: Row(
                      children: [
                        isSelectTo
                            ? Text(
                                "To: ${selectedDateTo.day}/${selectedDateTo.month}/${selectedDateTo.year}",
                                style: GoogleFonts.poppins(
                                  fontSize: _height * .0142,
                                  fontWeight: FontWeight.w300,
                                  color: Color(0xff000000),
                                ),
                              )
                            : Text(
                                "To:",
                                style: GoogleFonts.poppins(
                                  fontSize: _height * .0142,
                                  fontWeight: FontWeight.w300,
                                  color: Color(0xff000000),
                                ),
                              ),
                        SizedBox(
                          width: _width * 0.01,
                        ),
                        Icon(
                          Icons.calendar_month_outlined,
                          size: _height * .02,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            Container(
              width: double.infinity,
              height: _height * .065,
              margin:
                  const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 10.0),
              child: ElevatedButton(
                onPressed: () async {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(0),
                  textStyle: const TextStyle(
                    color: Colors.white,
                  ),
                  primary: appColorPrimary, // background
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0)),
                ),
                child: Text(
                  "Filter",
                  style: GoogleFonts.poppins(
                    fontSize: _height * .0173,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

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
                    fontSize: _height * .03,
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
                      style: GoogleFonts.poppins(
                          color: iconColorSecondary,
                          //fontFamily: fontRegular,
                          fontSize: _height * .018),
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
                          padding: EdgeInsets.fromLTRB(_width * .06,
                              _height * .027, _width * .06, _height * .027),
                          child: SingleChildScrollView(
                            child: Column(children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
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
                                mainAxisAlignment: MainAxisAlignment.start,
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
                                mainAxisAlignment: MainAxisAlignment.start,
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
                mypaddingr,
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
                  onPressed: () {
                    openActionSheet();
                  },
                  child: Row(
                    children: [
                      // Icon(
                      //   Icons.filter_alt_outlined,
                      //   size: 17,
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
                        // fontSize: _height * .02,
                        // textColor: Colors.black,
                        //lineThrough: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            mypaddingrh,
            Column(
              children: [
                ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: _width * 0.04, right: _width * 0.04),
                            child: Container(
                              // color: Colors.white70,
                              alignment: Alignment.center,
                              width: double.infinity,
                              height: _height * .0829,
                              child: Center(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                WalletEmptyScreen()));
                                  },
                                  child: ListTile(
                                    // tileColor: Colors.white,

                                    title: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: _height * .01,
                                          ),
                                          Text(
                                            index.isEven
                                                ? "Account Credit"
                                                : "Account Debit",
                                            style: GoogleFonts.poppins(
                                              fontSize: _height * .019,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff000000),
                                            ),

                                            //isBoldText: true,
                                            //textColor: appTextColorPrimary
                                          ),
                                          Text(
                                            "27, Jan 2021",
                                            style: GoogleFonts.poppins(
                                              fontSize: _height * .0142,
                                              color: Color(0xff000000),
                                            ),
                                            // fontSize: _height * .0142,
                                            // textColor: appTextColorPrimary,
                                            // fontFamily: 'Regular'
                                          ),
                                        ],
                                      ),
                                    ),
                                    selectedTileColor:
                                        Theme.of(context).primaryColor,
                                    selectedColor:
                                        Theme.of(context).dividerColor,
                                    leading: Container(
                                      height: _height * 0.05,
                                      width: _width * 0.12,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: iconColorSecondary
                                                .withOpacity(0.3),
                                            // blurStyle: BlurStyle.outer,
                                            // blurRadius: 8,
                                            spreadRadius: 0,
                                            offset: Offset.zero,
                                          ),
                                        ],
                                        color: Color(0xffF7F7F7),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Icon(
                                          index.isEven
                                              ? Icons.arrow_downward_outlined
                                              : Icons.arrow_upward_outlined,
                                          size: _height * .025,
                                          color: index.isEven
                                              ? appLight_bitter_lemon
                                              : appLight_google_red),
                                    ),
                                    trailing: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            "N200,000",
                                            style: GoogleFonts.poppins(
                                                fontSize: _height * .019,
                                                fontWeight: FontWeight.w700,
                                                color: index.isEven
                                                    ? appLight_bitter_lemon
                                                    : appLight_google_red),
                                          ),
                                          Text(
                                            index.isEven
                                                ? "Successful"
                                                : "Failed",
                                            style: GoogleFonts.poppins(
                                              fontSize: _height * .012,
                                              color: index.isEven
                                                  ? appLight_bitter_lemon
                                                  : appLight_google_red,
                                            ),

                                            //fontFamily: 'Regular'
                                          ),
                                        ],
                                      ),
                                    ),
                                    // minLeadingWidth: double.maxFinite,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: _width * .05),
                            child: Divider(
                              color: Color(0xffD7DCE4)
                                  .withOpacity(0.5), //color of divider
                              height: 1,
                              indent: _width * 0.13,
                              endIndent:
                                  _width * 0.13, //height spacing of divider
                              thickness: 1, //thickness of divier line
                            ),
                          ),
                        ],
                      );
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _selectDateFrom(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDateFrom,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDateFrom)
      setState(() {
        isSelectFrom = true;
        selectedDateFrom = selected;
      });
  }

  void _selectDateTo(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
        context: context,
        initialDate: selectedDateTo,
        firstDate: DateTime(2010),
        lastDate: DateTime(2025),
        helpText: "SELECT DATE",
        cancelText: "CANCEL",
        confirmText: "SELECT");
    if (selected != null && selected != selectedDateTo)
      setState(() {
        isSelectTo = true;
        selectedDateTo = selected;
      });
  }
}
