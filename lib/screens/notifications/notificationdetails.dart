import 'package:dms/layout/appWidget.dart';
import 'package:dms/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'notification.dart';

class NotDetails extends StatefulWidget {
  String heading;
  String time;
  String body;
  NotDetails(this.heading, this.time, this.body);

  @override
  _NotDetailsState createState() => _NotDetailsState();
}

class _NotDetailsState extends State<NotDetails> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    var mypaddingr = SizedBox(width: _width * 0.07);

    var mypaddingrh = SizedBox(height: _height * 0.026);
    return Scaffold(
      appBar: dmsAppBar(context, ""),
      backgroundColor: appWhite,
      body: Column(children: [
        SizedBox(
          height: _height * .02,
        ),
        Row(
          children: [
            mypaddingr,
            Text(
              "Notification Details",
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
              height: _height * .22,
              //color: Color(0xffFFFFFF),
              child: Column(children: [
                SizedBox(
                  height: _height * .015,
                ),
                Row(
                  children: [
                    Container(
                      height: _height * .03,
                      width: _width * .0103,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(
                      width: _width * .057,
                    ),
                    Text(
                      widget.heading,
                      style: GoogleFonts.poppins(
                        color: appColorPrimary,
                        fontWeight: FontWeight.w600,
                        fontSize: _height * .02,
                      ),
                    ),
                    SizedBox(
                      width: _width * .35,
                    ),
                    Text(
                      widget.time,
                      style: GoogleFonts.poppins(
                          fontSize: _height * .013, color: Color(0xff8D93A1)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: _width * .06,
                    ),
                    Text(" " + widget.body,
                        style: GoogleFonts.poppins(
                          fontSize: _height * .014,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff8D93A1),
                        )),
                  ],
                )
              ]),
            )
          ],
        ),
      ]),
    );
  }
}
