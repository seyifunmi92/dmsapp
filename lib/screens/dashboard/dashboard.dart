import 'dart:convert';

import 'package:dms/layout/appWidget.dart';
import 'package:dms/layout/dms_drawer.dart';
import 'package:dms/screens/auth/login_screen.dart';
import 'package:dms/screens/my%20orders/myorders.dart';
import 'package:dms/screens/notifications/notification.dart';
import 'package:dms/services/orderservices.dart';
import 'package:dms/utils/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import '../../layout/loading_indicator_widget.dart';
import '../../model/ordermodels.dart';
import '../../model/recentorder.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  GetSapOrderDetails? _getSapDetails;
  bool noList = false;
  bool datadey = false;
  bool emptyList = false;
  RecentDms? orderRecent;
  List<OrderItemR>? _dmsData;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool menuClicked = false;
  @override
  void initState() {
    getmyRecentDms();
    Provider.of<OrderBloc>(context, listen: false).isLoading = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _format = NumberFormat("#,###,000.00");

    int closeCounter = 0;
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    var mypaddingr = SizedBox(width: _width * 0.07436);
    var mypaddingrh = SizedBox(height: _height * 0.025);
    var mypaddingrh2 = SizedBox(height: _height * 0.05);
    var containerwidth = _width * .85;

    return Provider.of<OrderBloc>(context, listen: false).isLoading
        ? Scaffold(
            body: Center(child: LoadingIndicatorWidget()),
          )
        : WillPopScope(
            onWillPop: () async {
              if (closeCounter == 1) {
                print("You have to click again");
                closeCounter++;
              } else {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return _exitDialog(context);
                    });
              }
              return true;
            },
            child: Scaffold(
              key: _scaffoldKey,
              appBar: dmsDrawerAppBar(context, '', () {
                _scaffoldKey.currentState!.openDrawer();
                setState(() {
                  menuClicked = true;
                });
              }, actions: [
                Padding(
                  padding: EdgeInsets.only(right: _width * 0.09),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Notificationy()));
                    },
                    child: Icon(
                      Icons.notifications,
                      color: appColorPrimary,
                      size: _width * .05,
                      //size: 15,
                    ),
                  ),
                ),
              ]),
              drawer: DMSDrawer(),
              backgroundColor: appWhite,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    // SizedBox(
                    //   height: _height * .0365,
                    // ),
                    // Row(
                    //   children: [
                    //     mypaddingr,
                    //     InkWell(
                    //       onTap: () {
                    //         _scaffoldKey.currentState!.openDrawer();
                    //
                    //         setState(() {
                    //           menuClicked = true;
                    //         });
                    //       },
                    //       child: Image.asset(
                    //         "lib/assets/dmsmenu.png",
                    //         height: _height * .020,
                    //         width: _width * .072,
                    //         color: appColorPrimary,
                    //         //width: 31.71,
                    //       ),
                    //     ),
                    //     // menuClicked
                    //     //     ? Positioned(
                    //     //         top: 50,
                    //     //         left: 0,
                    //     //         right: 0,
                    //     //         child: InkWell(
                    //     //           onTap: () {},
                    //     //           child: Container(
                    //     //             height: _height * .9,
                    //     //             width: _width * .7,
                    //     //             color: Colors.black,
                    //     //           ),
                    //     //         ),
                    //     //       )
                    //     //     : Center(),
                    //     SizedBox(
                    //       width: _width * .73,
                    //     ),
                    //     Icon(
                    //       Icons.notifications,
                    //       color: appColorPrimary,
                    //       size: _width * .05,
                    //       //size: 15,
                    //     ),
                    //   ],
                    // ),
                    SizedBox(
                      height: _height * .015,
                    ),
                    Row(
                      children: [
                        mypaddingr,
                        Text(
                          "Dashboard",
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
                    Row(
                      children: [
                        mypaddingr,
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
                                      "lib/assets/dmswallet.png",
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
                    mypaddingrh,
                    _boxCustom(context),
                    Row(
                      children: [
                        mypaddingr,
                      ],
                    ),
                    mypaddingrh,
                    Row(
                      children: [mypaddingr, _boxCustom2(context)],
                    ),
                    mypaddingrh,
                    Row(
                      children: [
                        mypaddingr,
                        _boxCustom3(context),
                      ],
                    ),
                    mypaddingrh2,
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: _width * 0.07436),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "My Recent Orders",
                            style: GoogleFonts.openSans(
                              fontSize: _height * .02,
                              fontWeight: FontWeight.w600,
                              color: appColorPrimary,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => MyOrders())));
                            },
                            child: Text(
                              "View All",
                              style: GoogleFonts.openSans(
                                fontSize: _height * .014,
                                fontWeight: FontWeight.w400,
                                color: appColorPrimary,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: _height * .02,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: _width * 0.07436),
                      child: emptyList
                          ? Column(
                              children: [
                                mypaddingrh,
                                Text(
                                  "No recent orders",
                                  style: GoogleFonts.openSans(
                                    fontSize: _height * .018,
                                    fontWeight: FontWeight.w600,
                                    color: appColorPrimary,
                                  ),
                                ),
                              ],
                            )
                          : Container(
                              width: containerwidth,
                              height: _height * .095,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurStyle: BlurStyle.outer,
                                    blurRadius: 15,
                                    spreadRadius: 0,
                                    offset: Offset.zero,
                                  ),
                                ],
                                color: appWhite,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(
                                    _width * .06,
                                    _height * .012,
                                    _width * .06,
                                    _height * .012),
                                child: Column(children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      orderRecent!.data!.dmsOrder!.id == null
                                          ? Text("")
                                          : Text(
                                              "Order ${orderRecent!.data!.dmsOrder!.id}",
                                              style: GoogleFonts.openSans(
                                                  fontSize: _height * .02,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xff343434)),
                                            ),
                                      Text(
                                        orderRecent!.data!.dmsOrder!
                                                .dateCreated!.day
                                                .toString() +
                                            "-" +
                                            orderRecent!.data!.dmsOrder!
                                                .dateCreated!.month
                                                .toString() +
                                            "-" +
                                            orderRecent!.data!.dmsOrder!
                                                .dateCreated!.year
                                                .toString(),
                                        style: GoogleFonts.openSans(
                                          fontSize: _height * .02,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: _height * .005,
                                  ),
                                  SizedBox(
                                    height: _height * .005,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        orderRecent!.data!.dmsOrder!
                                                    .estimatedNetValue! !=
                                                0.00
                                            ? "N${_format.format(orderRecent!.data!.dmsOrder!.estimatedNetValue)}"
                                            : "N0.00",
                                        style: GoogleFonts.openSans(
                                            fontSize: _height * .014,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xff00CC08)),
                                      ),
                                      Container(
                                        height: _height * .031,
                                        width: _width * .16,
                                        decoration: BoxDecoration(
                                            color: Colors.green[50],
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Center(
                                            child: Text(
                                          orderRecent!.data!.dmsOrder!
                                              .orderStatus!.name!,
                                          style: GoogleFonts.dmSans(
                                              fontSize: _height * .012,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff00CC08)),
                                        )),
                                      ),
                                    ],
                                  ),
                                ]),
                              ),
                            ),
                      // _boxCustom4(RecentDmsOrders()),
                    ),
                    // Column(
                    //     children: [...orderRecent!.map((e) => _boxCustom4())],
                    //   )),

                    mypaddingrh,
                    // Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: _width * 0.07436),
                    //   child: _boxCustom5(context),
                    // ),
                    // mypaddingrh,
                    // Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: _width * 0.07436),
                    //   child: _boxCustom6(context),
                    // ),
                    mypaddingrh,
                    // Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: _width * 0.07436),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Text(
                    //         "My Recent ATC",
                    //         style: GoogleFonts.openSans(
                    //           fontSize: _height * .02,
                    //           fontWeight: FontWeight.w600,
                    //           color: appColorPrimary,
                    //         ),
                    //       ),
                    //       InkWell(
                    //         onTap: () {},
                    //         child: Text(
                    //           "View All",
                    //           style: GoogleFonts.openSans(
                    //             fontSize: _height * .014,
                    //             fontWeight: FontWeight.w400,
                    //             color: appColorPrimary,
                    //           ),
                    //         ),
                    //       )
                    //     ],
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: _height * .02,
                    // ),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: _width * 0.07436),
                    //   child: _boxCustom4y(context),
                    // ),
                    // mypaddingrh,
                    // Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: _width * 0.07436),
                    //   child: _boxCustom4y(context),
                    // ),
                    // mypaddingrh,
                    // Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: _width * 0.07436),
                    //   child: _boxCustom4y(context),
                    // ),
                    //mypaddingrh,
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: _width * 0.07436),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "New Notifications",
                            style: GoogleFonts.openSans(
                              fontSize: _height * .02,
                              fontWeight: FontWeight.w600,
                              color: appColorPrimary,
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              "View All",
                              style: GoogleFonts.openSans(
                                fontSize: _height * .014,
                                fontWeight: FontWeight.w400,
                                color: appColorPrimary,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: _height * .02,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: _width * 0.07436),
                      child: _boxCustom10(context),
                    ),
                    mypaddingrh,
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: _width * 0.07436),
                      child: _boxCustom10(context),
                    ),
                    mypaddingrh,
                    // .88 - .14872
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: _width * 0.07436),
                      child: _boxCustom10(context),
                    ),
                  ],
                ),
              ),
            ),
          );
  }

  Widget _boxCustom(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    var containerwidth = _width * .85;
    return Container(
      width: containerwidth,
      height: _height * .095,
      decoration: BoxDecoration(
        color: Color(0xffDAFAE8),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            _width * .06, _height * .0157, _width * .06, _height * .0157),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Orders",
                style: GoogleFonts.openSans(
                    fontSize: _height * .014,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff8D93A1)),
              ),
            ],
          ),
          SizedBox(
            height: _height * .005,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "560",
                style: GoogleFonts.openSans(
                    fontSize: _height * .028,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff1B2559)),
              ),
              Container(
                height: _height * .0284,
                width: _width * .205,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(5, 205, 153, 0.1),
                    borderRadius: BorderRadius.circular(58)),
                child: Center(
                    child: Text(
                  "Completed",
                  style: GoogleFonts.dmSans(
                      fontSize: _height * .014,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff05CD99)),
                )),
              ),
            ],
          ),
        ]),
      ),
    );
  }

  Widget _boxCustom2(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    var mypaddingr2 = SizedBox(width: _width * 0.05);
    var containerwidth = _width * .85;

    return Container(
      width: containerwidth,
      height: _height * .095,
      decoration: BoxDecoration(
        //#7090B01F
        boxShadow: [
          BoxShadow(
            color: Color(0xffEAF2FF),
            blurStyle: BlurStyle.outer,
            blurRadius: 10,
            spreadRadius: 0,
            offset: Offset.zero,
          ),
        ],
        color: Color(0xffEAF2FF),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            _width * .06, _height * .0157, _width * .06, _height * .0157),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Orders",
                style: GoogleFonts.openSans(
                    fontSize: _height * .014,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff8D93A1)),
              ),
            ],
          ),
          SizedBox(
            height: _height * .005,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "1000",
                style: GoogleFonts.openSans(
                    fontSize: _height * .028,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff1B2559)),
              ),
              Container(
                height: _height * .028,
                width: _width * .105,
                decoration: BoxDecoration(
                    color: Color(0xffD0E2FF),
                    borderRadius: BorderRadius.circular(58)),
                child: Center(
                    child: Text(
                  "New",
                  style: GoogleFonts.dmSans(
                      fontSize: _height * .014,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff4D76B8)),
                )),
              ),
            ],
          ),
        ]),
      ),
    );
  }

  Widget _boxCustom3(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    var mypaddingr2 = SizedBox(width: _width * 0.05);
    var containerwidth = _width * .85;
    return Container(
      width: containerwidth,
      height: _height * .095,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Color(0xffFFECEC),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            _width * .06, _height * .0157, _width * .06, _height * .0157),
        child: Column(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Text(
                    "Orders",
                    style: GoogleFonts.openSans(
                        fontSize: _height * .014,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff8D93A1)),
                  ),
                ],
              ),
              SizedBox(
                height: _height * .005,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "560",
                    style: GoogleFonts.openSans(
                        fontSize: _height * .028,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff1B2559)),
                  ),
                  Container(
                    height: _height * .028,
                    width: _width * .16,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 186, 189, 0.3),
                        borderRadius: BorderRadius.circular(58)),
                    child: Center(
                      child: Text(
                        "Pending",
                        style: GoogleFonts.dmSans(
                          fontSize: _height * .014,
                          fontWeight: FontWeight.w700,
                          color: Color(0xffFF646A),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ]),
      ),
    );
  }

  Widget _boxCustom4(RecentDmsOrders _order) {
    final _format = NumberFormat("#,###,000.00");

    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    var mypaddingr2 = SizedBox(width: _width * 0.05);
    var containerwidth = _width * .85;
    return Container(
      width: containerwidth,
      height: _height * .095,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurStyle: BlurStyle.outer,
            blurRadius: 15,
            spreadRadius: 0,
            offset: Offset.zero,
          ),
        ],
        // boxShadow: [
        //           const BoxShadow(
        //             color: Colors.blue,
        //             offset: Offset.zero,
        //             blurStyle: BlurStyle.outer,
        //             blurRadius: 10.0,
        //             spreadRadius: 0.0,
        //           ),
        //         ],
        color: appWhite,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            _width * .06, _height * .012, _width * .06, _height * .012),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _order.datarecent!.id == null
                  ? Text("")
                  : Text(
                      "Order ${_order.datarecent!.id}",
                      style: GoogleFonts.openSans(
                          fontSize: _height * .02,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff343434)),
                    ),
              Text(
                _order.datarecent!.orderItems![0].dateCreated!.day.toString() +
                    "-" +
                    _order.datarecent!.orderItems![0].dateCreated!.month
                        .toString() +
                    "-" +
                    _order.datarecent!.orderItems![0].dateCreated!.year
                        .toString(),
                style: GoogleFonts.openSans(
                  fontSize: _height * .02,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(
            height: _height * .005,
          ),
          SizedBox(
            height: _height * .005,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _order.datarecent!.estimatedNetValue != 0.00
                    ? "N${_format.format(_order.datarecent!.estimatedNetValue)}"
                    : "N0.00",
                style: GoogleFonts.openSans(
                    fontSize: _height * .014,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff00CC08)),
              ),
              Container(
                height: _height * .031,
                width: _width * .16,
                decoration: BoxDecoration(
                    color: Colors.green[50],
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                    child: Text(
                  _order.datarecent!.orderStatus!.name!,
                  style: GoogleFonts.dmSans(
                      fontSize: _height * .012,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff00CC08)),
                )),
              ),
            ],
          ),
        ]),
      ),
    );
  }

  Widget _boxCustom4y(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    var mypaddingr2 = SizedBox(width: _width * 0.05);
    var containerwidth = _width * .85;
    return Container(
      width: containerwidth,
      height: _height * .095,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurStyle: BlurStyle.outer,
            blurRadius: 15,
            spreadRadius: 0,
            offset: Offset.zero,
          ),
        ],
        // boxShadow: [
        //           const BoxShadow(
        //             color: Colors.blue,
        //             offset: Offset.zero,
        //             blurStyle: BlurStyle.outer,
        //             blurRadius: 10.0,
        //             spreadRadius: 0.0,
        //           ),
        //         ],
        color: appWhite,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            _width * .06, _height * .012, _width * .06, _height * .012),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Order 123",
                style: GoogleFonts.openSans(
                    fontSize: _height * .02,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff343434)),
              ),
              Text(
                "12-05-22",
                style: GoogleFonts.openSans(
                  fontSize: _height * .02,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(
            height: _height * .005,
          ),
          SizedBox(
            height: _height * .005,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "",
                style: GoogleFonts.openSans(
                    fontSize: _height * .014,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff00CC08)),
              ),
              Container(
                height: _height * .031,
                width: _width * .16,
                decoration: BoxDecoration(
                    color: Colors.green[50],
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                    child: Text(
                  "Completed",
                  style: GoogleFonts.dmSans(
                      fontSize: _height * .012,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff00CC08)),
                )),
              ),
            ],
          ),
        ]),
      ),
    );
  }

  Widget _boxCustom5(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    var mypaddingr2 = SizedBox(width: _width * 0.05);
    var containerwidth = _width * .85;
    return Container(
      width: containerwidth,
      height: _height * .095,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurStyle: BlurStyle.outer,
            blurRadius: 15,
            spreadRadius: 0,
            offset: Offset.zero,
          ),
        ],
        color: appWhite,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            _width * .06, _height * .012, _width * .06, _height * .012),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Order 123",
                style: GoogleFonts.openSans(
                    fontSize: _height * .02,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff343434)),
              ),
              Text(
                "12-05-22",
                style: GoogleFonts.openSans(
                  fontSize: _height * .02,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(
            height: _height * .005,
          ),
          SizedBox(
            height: _height * .005,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "N20,000",
                style: GoogleFonts.openSans(
                    fontSize: _height * .014,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff00CC08)),
              ),
              Container(
                height: _height * .031,
                width: _width * .16,
                decoration: BoxDecoration(
                    color: Colors.blueGrey[50],
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                    child: Text(
                  "Processing",
                  style: GoogleFonts.dmSans(
                      fontSize: _height * .012,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff8D93A1)),
                )),
              ),
            ],
          ),
        ]),
      ),
    );
  }

  Widget _boxCustom6(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    var mypaddingr2 = SizedBox(width: _width * 0.05);
    var containerwidth = _width * .85;
    return Container(
      width: containerwidth,
      height: _height * .095,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurStyle: BlurStyle.outer,
            blurRadius: 15,
            spreadRadius: 0,
            offset: Offset.zero,
          ),
        ],
        color: appWhite,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            _width * .06, _height * .012, _width * .06, _height * .012),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Order 123",
                style: GoogleFonts.openSans(
                    fontSize: _height * .02,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff343434)),
              ),
              Text(
                "12-05-22",
                style: GoogleFonts.openSans(
                  fontSize: _height * .02,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(
            height: _height * .005,
          ),
          SizedBox(
            height: _height * .005,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: _height * .031,
                width: _width * .16,
                decoration: BoxDecoration(
                    color: Colors.green[50],
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                    child: Text(
                  "Completed",
                  style: GoogleFonts.dmSans(
                      fontSize: _height * .012,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff00CC08)),
                )),
              ),
            ],
          ),
        ]),
      ),
    );
  }

  Widget _boxCustom7(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    var mypaddingr2 = SizedBox(width: _width * 0.05);
    var containerwidth = _width * .85;
    return Container(
      width: containerwidth,
      height: _height * .095,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurStyle: BlurStyle.outer,
            blurRadius: 15,
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
          Row(
            children: [
              mypaddingr2,
              Text(
                "Order 123",
                style: GoogleFonts.openSans(
                    fontSize: _width * .041,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff343434)),
              ),
              SizedBox(width: _width * .41),
              Text(
                "12-05-22",
                style: GoogleFonts.openSans(
                  fontSize: _width * .041,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(
            height: _height * .005,
          ),
          SizedBox(
            height: _height * .005,
          ),
          Row(
            children: [
              mypaddingr2,
              Text(
                "",
                style: GoogleFonts.openSans(
                    fontSize: _width * .031,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff00CC08)),
              ),
              SizedBox(width: _width * .61),
              Container(
                height: _height * .031,
                width: _width * .16,
                decoration: BoxDecoration(
                    color: Colors.green[50],
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                    child: Text(
                  "Completed",
                  style: GoogleFonts.dmSans(
                      fontSize: _width * .021,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff00CC08)),
                )),
              ),
            ],
          ),
        ]),
      ),
    );
  }

  Widget _boxCustom8(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    var mypaddingr2 = SizedBox(width: _width * 0.05);
    var containerwidth = _width * .85;

    return Container(
      width: containerwidth,
      height: _height * .095,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurStyle: BlurStyle.outer,
            blurRadius: 15,
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
          Row(
            children: [
              mypaddingr2,
              Text(
                "Order 123",
                style: GoogleFonts.openSans(
                    fontSize: _width * .041,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff343434)),
              ),
              SizedBox(width: _width * .41),
              Text(
                "12-05-22",
                style: GoogleFonts.openSans(
                  fontSize: _width * .041,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(
            height: _height * .005,
          ),
          SizedBox(
            height: _height * .005,
          ),
          Row(
            children: [
              mypaddingr2,
              Text(
                "",
                style: GoogleFonts.openSans(
                    fontSize: _width * .031,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff00CC08)),
              ),
              SizedBox(width: _width * .61),
              Container(
                height: _height * .031,
                width: _width * .16,
                decoration: BoxDecoration(
                    color: Colors.green[50],
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                    child: Text(
                  "Completed",
                  style: GoogleFonts.dmSans(
                      fontSize: _width * .021,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff00CC08)),
                )),
              ),
            ],
          ),
        ]),
      ),
    );
  }

  Widget _boxCustom9(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    var mypaddingr2 = SizedBox(width: _width * 0.05);
    var containerwidth = _width * .85;
    return Container(
      width: containerwidth,
      height: _height * .095,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurStyle: BlurStyle.outer,
            blurRadius: 15,
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
          Row(
            children: [
              mypaddingr2,
              Text(
                "Order 123",
                style: GoogleFonts.openSans(
                    fontSize: _width * .041,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff343434)),
              ),
              SizedBox(width: _width * .41),
              Text(
                "12-05-22",
                style: GoogleFonts.openSans(
                  fontSize: _width * .041,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(
            height: _height * .005,
          ),
          SizedBox(
            height: _height * .005,
          ),
          Row(
            children: [
              mypaddingr2,
              Text(
                "",
                style: GoogleFonts.openSans(
                    fontSize: _width * .031,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff00CC08)),
              ),
              SizedBox(width: _width * .61),
              Container(
                height: _height * .031,
                width: _width * .16,
                decoration: BoxDecoration(
                    color: Colors.green[50],
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                    child: Text(
                  "Completed",
                  style: GoogleFonts.dmSans(
                      fontSize: _width * .021,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff00CC08)),
                )),
              ),
            ],
          ),
        ]),
      ),
    );
  }

  Widget _boxCustom10(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    var mypaddingr2 = SizedBox(width: _width * 0.05);
    var containerwidth = _width * .85;
    return Container(
      width: containerwidth,
      height: _height * .114,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurStyle: BlurStyle.outer,
            blurRadius: 15,
            spreadRadius: 0,
            offset: Offset.zero,
          ),
        ],
        color: appWhite,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            0, _height * .012, _width * .06, _height * .012),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: _height * .03,
                width: _width * .0103,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  color: Colors.red,
                ),
              ),
              SizedBox(width: _width * .0497),
              Container(
                width: _width * .72,
                //color: Colors.black,

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Lorem Ipsum",
                      style: GoogleFonts.poppins(
                          fontSize: _height * .02,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff343434)),
                    ),
                    Text(
                      "   08:58pm",
                      style: GoogleFonts.poppins(
                        fontSize: _height * .018,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff8D93A1),

                        //color: Color(0xff222222),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: _height * .005,
          ),
          // SizedBox(
          //   height: _height * .005,
          // ),
          Padding(
            padding: EdgeInsets.only(left: _width * .06),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Container(
                //   height: _height * .03,
                //   width: _width * .0103,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(9.27),
                //     color: Colors.transparent,
                //   ),
                // ),
                //mypaddingr2,
                Text(
                  "Kindly select your company and enter SAP ID to\nregister your account",
                  style: GoogleFonts.poppins(
                      fontSize: _height * .014,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff8D93A1)),
                ),
                //SizedBox(width: _width * .61),
                // Container(
                //   height: 26,
                //   width: 62,
                //   decoration: BoxDecoration(
                //       color: Colors.green[50],
                //       borderRadius: BorderRadius.circular(5)),
                //   child: Center(
                //       child: Text(
                //     "Completed",
                //     style: GoogleFonts.dmSans(
                //         fontSize: 10,
                //         fontWeight: FontWeight.w400,
                //         color: Color(0xff00CC08)),
                //   )),
                // ),
              ],
            ),
          ),
          // Row(
          //   children: [
          //     Container(
          //       height: _height * .03,
          //       width: _width * .0103,
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(9.27),
          //         color: Colors.transparent,
          //       ),
          //     ),
          //     mypaddingr2,
          //     Text(
          //       " register your account",
          //       style: GoogleFonts.poppins(
          //           fontSize: _width * .031,
          //           fontWeight: FontWeight.w400,
          //           color: Color(0xff8D93A1)),
          //     ),
          //   ],
          // ),
        ]),
      ),
    );
  }

  Widget _drawerCustom(String imageUrl, String customerName) {
    double _width = MediaQuery.of(context).size.width * .777;
    double _height = MediaQuery.of(context).size.height;
    return Container(
      width: _width,
      height: _height,
      color: appWhite,
      child: Column(children: [
        SizedBox(
          height: _height * .075,
        ),
        Row(
          children: [
            SizedBox(
              width: _width * .3366,
            ),
            Image.asset(
              imageUrl,
              width: _width * .25,
              height: _height * .052,
            ),
          ],
        ),
        SizedBox(
          height: _height * .042,
        ),
        Row(
          children: [
            SizedBox(
              width: _width * .1155,
            ),
            Container(
              width: _width * .76,
              height: _height * .077,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xffE4EBF3)),
                color: appWhite,
                borderRadius: BorderRadius.circular(5),

                //border: BoxBorder(),
              ),
              child: Column(children: [
                SizedBox(
                  height: _height * .013,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: _width * .0495,
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      width: _width * .036,
                    ),
                    Column(
                      children: [
                        Text(
                          customerName,
                          style: GoogleFonts.poppins(
                            color: Color(0xff000000),
                            fontSize: _width * .046,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: _height * .0012,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Account 1",
                              style: GoogleFonts.poppins(
                                color: Color(0xffC4C4C4),
                                fontWeight: FontWeight.w400,
                                fontSize: _width * .033,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                )
              ]),
            ),
          ],
        ),
        SizedBox(
          height: _height * .045,
        ),
        Row(
          children: [
            SizedBox(
              width: _width * .1866,
            ),
            Image.asset("lib/assets/navbar.png"),
            SizedBox(width: _width * .088),
            Text(
              "Dashboard",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w700,
                color: Color(0xffEC1C24),
                fontSize: _width * .05,
              ),
            ),
            SizedBox(width: _width * .355),
            Container(
              height: _height * .051,
              width: _width * .02,
              decoration: BoxDecoration(
                color: Color(0xffEC1C24),
                borderRadius: BorderRadius.circular(9.27),
              ),
            ),
          ],
        ),
        SizedBox(
          height: _height * .05,
        ),
        Row(
          children: [
            SizedBox(
              width: _width * .1866,
            ),
            Image.asset("lib/assets/navbar1.png"),
            SizedBox(width: _width * .088),
            Text(
              "My Orders",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                color: appColorPrimary,
                fontSize: _width * .05,
              ),
            ),
            // SizedBox(width: _width * .3852),
            // Container(
            //   height: _height * .051,
            //   width: _width * .02,
            //   decoration: BoxDecoration(
            //     color: Color(0xffEC1C24),
            //     borderRadius: BorderRadius.circular(9.27),
            //   ),
            // ),
          ],
        ),
        SizedBox(
          height: _height * .05,
        ),
        Row(
          children: [
            SizedBox(
              width: _width * .1866,
            ),
            Image.asset("lib/assets/navbar2.png"),
            SizedBox(width: _width * .088),
            Text(
              "My ATC",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                color: appColorPrimary,
                fontSize: _width * .05,
              ),
            ),
            // SizedBox(width: _width * .3852),
            // Container(
            //   height: _height * .051,
            //   width: _width * .02,
            //   decoration: BoxDecoration(
            //     color: Color(0xffEC1C24),
            //     borderRadius: BorderRadius.circular(9.27),
            //   ),
            // ),
          ],
        ),
        SizedBox(
          height: _height * .05,
        ),
        Row(
          children: [
            SizedBox(
              width: _width * .1866,
            ),
            Image.asset("lib/assets/navbar3.png"),
            SizedBox(width: _width * .088),
            Text(
              "My Wallet",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                color: appColorPrimary,
                fontSize: _width * .05,
              ),
            ),
            // SizedBox(width: _width * .3852),
            // Container(
            //   height: _height * .051,
            //   width: _width * .02,
            //   decoration: BoxDecoration(
            //     color: Color(0xffEC1C24),
            //     borderRadius: BorderRadius.circular(9.27),
            //   ),
            // ),
          ],
        ),
        SizedBox(
          height: _height * .05,
        ),
        Row(
          children: [
            SizedBox(
              width: _width * .1866,
            ),
            Image.asset("lib/assets/navbar6.png"),
            SizedBox(width: _width * .088),
            Text(
              "Products",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                color: appColorPrimary,
                fontSize: _width * .05,
              ),
            ),
            // SizedBox(width: _width * .3852),
            // Container(
            //   height: _height * .051,
            //   width: _width * .02,
            //   decoration: BoxDecoration(
            //     color: Color(0xffEC1C24),
            //     borderRadius: BorderRadius.circular(9.27),
            //   ),
            // ),
          ],
        ),
        SizedBox(
          height: _height * .05,
        ),
        Row(
          children: [
            SizedBox(
              width: _width * .1866,
            ),
            Image.asset("lib/assets/navbar1.png"),
            SizedBox(width: _width * .088),
            Text(
              "Cart",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                color: appColorPrimary,
                fontSize: _width * .05,
              ),
            ),
            // SizedBox(width: _width * .3852),
            // Container(
            //   height: _height * .051,
            //   width: _width * .02,
            //   decoration: BoxDecoration(
            //     color: Color(0xffEC1C24),
            //     borderRadius: BorderRadius.circular(9.27),
            //   ),
            // ),
          ],
        ),
        SizedBox(
          height: _height * .05,
        ),
        Row(
          children: [
            SizedBox(
              width: _width * .1866,
            ),
            Image.asset("lib/assets/navbar7.png"),
            SizedBox(width: _width * .088),
            Text(
              "Support",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                color: appColorPrimary,
                fontSize: _width * .05,
              ),
            ),
            // SizedBox(width: _width * .3852),
            // Container(
            //   height: _height * .051,
            //   width: _width * .02,
            //   decoration: BoxDecoration(
            //     color: Color(0xffEC1C24),
            //     borderRadius: BorderRadius.circular(9.27),
            //   ),
            // ),
          ],
        ),
        SizedBox(
          height: _height * .05,
        ),
        Row(
          children: [
            SizedBox(
              width: _width * .1866,
            ),
            Image.asset("lib/assets/navbar8.png"),
            SizedBox(width: _width * .088),
            Text(
              "FAQ",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                color: appColorPrimary,
                fontSize: _width * .05,
              ),
            ),
            // SizedBox(width: _width * .3852),
            // Container(
            //   height: _height * .051,
            //   width: _width * .02,
            //   decoration: BoxDecoration(
            //     color: Color(0xffEC1C24),
            //     borderRadius: BorderRadius.circular(9.27),
            //   ),
            // ),
          ],
        ),
      ]),
    );
  }

  Widget _exitDialog(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    var containerheight = _height * .5142;
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
                "Are you sure you want to exit application",
                style: GoogleFonts.poppins(
                  color: Color(0xff8D93A1),
                  fontSize: _height * .02,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "",
                style: GoogleFonts.poppins(
                  color: Color(0xff8D93A1),
                  //fontSize: _width * .041,
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
                              builder: (context) => LoginScreen()));
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

  void getmyRecentDms() {
    Provider.of<OrderBloc>(context, listen: false)
        .getrecentDms()
        .then((value) => sapOutput(value));
  }

  sapOutput(String sapD) {
    var recentDetails = jsonDecode(sapD);
    if (sapD.contains("dmsOrder")) {
      Provider.of<OrderBloc>(context, listen: false).isLoading = false;
      setState(() {
        orderRecent = RecentDms.fromJson(recentDetails);
      });
    } else if (recentDetails["data"] == "null") {
      print("no record oo");
      Provider.of<OrderBloc>(context, listen: false).isLoading = false;
      setState(() {
        noList = true;
      });
      toast("Oops, no record for this");
    } else {
      toast("An error occured.Please try again");
      Provider.of<OrderBloc>(context, listen: false).isLoading = false;
    }
  }

  output(String recentDms) {
    var bodyT = jsonDecode(recentDms);
    if (recentDms.contains("data")) {
      if (bodyT["status"] == "Successful") {
        Provider.of<OrderBloc>(context, listen: false).isLoading = false;
        dynamic _gettX = bodyT;
        List myList = _gettX["data"]["dmsOrder"]["orderItems"];
        if (myList.isNotEmpty) {
          print(myList);
          print(myList.runtimeType);
          if (myList.isEmpty) {
            emptyList = true;
            toast("Oops.No Orders");
          }
          setState(() {
            print(bodyT["message"]);
          });
        } else {
          Provider.of<OrderBloc>(context, listen: false).isLoading = false;
          toast(bodyT["message"]);
        }
      }
    }
  }
}
