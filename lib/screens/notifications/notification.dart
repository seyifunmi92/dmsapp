import 'package:dms/layout/appWidget.dart';
import 'package:dms/layout/dms_drawer.dart';
import 'package:dms/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'notificationdetails.dart';

class Notificationy extends StatefulWidget {
  const Notificationy({Key? key}) : super(key: key);

  @override
  _NotificationyState createState() => _NotificationyState();
}

notifications() {}

class NotifyCustomers {
  String heading;
  String body;
  String time;
  NotifyCustomers(this.heading, this.body, this.time);
}

class _NotificationyState extends State<Notificationy> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool menuClicked = false;
  List<NotifyCustomers> notifications = [
    NotifyCustomers(
        "Lorem Ipsum",
        "Kindly select your company and enter SAP ID to\n register your account",
        "08:58pm"),
    NotifyCustomers(
        "Lorem Ipsum",
        "Kindly select your company and enter SAP ID to\n register your account",
        "08:58pm"),
    NotifyCustomers(
        "Lorem Ipsum",
        "Kindly select your company and enter SAP ID to\n register your account",
        "08:58pm"),
    NotifyCustomers(
        "Lorem Ipsum",
        "Kindly select your company and enter SAP ID to\n register your account",
        "08:58pm"),
    NotifyCustomers(
        "Lorem Ipsum",
        "Kindly select your company and enter SAP ID to\n register your account",
        "08:58pm"),
    NotifyCustomers(
        "Lorem Ipsum",
        "Kindly select your company and enter SAP ID to\n register your account",
        "08:58pm"),
    NotifyCustomers(
        "Lorem Ipsum",
        "Kindly select your company and enter SAP ID to\n register your account",
        "08:58pm"),
  ];

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    var mypaddingr = SizedBox(width: _width * 0.07);
    var mypaddingrh = SizedBox(height: _height * 0.026);
    return Scaffold(
        drawer: DMSDrawer(),
        key: _scaffoldKey,
        appBar: dmsDrawerAppBar(context, "", () {
          _scaffoldKey.currentState!.openDrawer();
          setState(() {
            menuClicked = true;
          });
        }),
        backgroundColor: appWhite,
        body: Column(
          children: [
            Row(
              children: [
                mypaddingr,
                Text(
                  "Notifications",
                  style: GoogleFonts.poppins(
                    fontSize: _height * .03,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.02,
                    color: appColorPrimary,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: _height * .013,
            ),
            Row(
              children: [
                mypaddingr,
                Text(
                  "Today",
                  style: GoogleFonts.poppins(
                      fontSize: _height * .02,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.02,
                      color: Color(0xff8D93A1)),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount:
                    (notifications.length < 4 ? 3 : notifications.length),
                itemBuilder: (BuildContext context, int index) {
                  var _listData = notifications[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NotDetails(
                                  _listData.heading,
                                  _listData.time,
                                  _listData.body)));
                    },
                    child: Column(
                      key: Key(_listData.heading),
                      children: [
                        SizedBox(
                          height: _height * .013,
                        ),
                        Row(
                          children: [
                            mypaddingr,
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xffFFFFFF),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurStyle: BlurStyle.outer,
                                    blurRadius: 15,
                                    spreadRadius: 0,
                                    offset: Offset.zero,
                                  ),
                                ],
                              ),
                              width: _width * .85,
                              height: _height * .114,
                              //color: Color(0xffFFFFFF),
                              child: Column(children: [
                                SizedBox(
                                  height: _height * .015,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: _height * .03,
                                              width: _width * .0103,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(0),
                                                color: Colors.red,
                                              ),
                                            ),
                                            SizedBox(
                                              width: _width * .047,
                                            ),
                                            Text(
                                              " " + _listData.heading,
                                              style: GoogleFonts.poppins(
                                                fontSize: _height * .02,
                                                fontWeight: FontWeight.w600,
                                                color: appColorPrimary,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: _width * .33,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              _listData.time,
                                              style: GoogleFonts.poppins(
                                                  fontSize: _height * .013,
                                                  color: Color(0xff8D93A1)),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),

                                    // Row(
                                    //   children: [

                                    //   ],
                                    // ),
                                    // SizedBox(
                                    //   width: _width * .35,
                                    // ),

                                    // SizedBox(
                                    //   width: _width * .364,
                                    // ),
                                    // Text(
                                    //   _listData.time,
                                    //   style: GoogleFonts.poppins(
                                    //       fontSize: _height * .013,
                                    //       color: Color(0xff8D93A1)),
                                    // ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: _width * .06,
                                    ),
                                    Text(" " + _listData.body,
                                        style: GoogleFonts.poppins(
                                          fontSize: _height * .014,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff8D93A1),
                                        )),
                                  ],
                                )
                              ]),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
