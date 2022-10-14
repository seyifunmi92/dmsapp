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

class MyAtcBg extends StatefulWidget {
  const MyAtcBg({Key? key}) : super(key: key);

  @override
  _MyAtcBgState createState() => _MyAtcBgState();
}

class _MyAtcBgState extends State<MyAtcBg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: _height * .021,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: _width * .04),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
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
                  width: _width * 0.73,
                  padding: EdgeInsets.symmetric(horizontal: 14, vertical: 13),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.search_rounded,
                        color: Color(0xffB7BBC5),
                        size: _height * .0313,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: _width * 0.01),
                        child: Text(
                          "Search with ATC No",
                          style: GoogleFonts.poppins(
                            color: Color(0xffB7BBC5),
                            fontWeight: FontWeight.w400,
                            //fontFamily: fontRegular,
                            fontSize: _height * .017,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  // showDialog(
                  //     context: context,
                  //     builder: (BuildContext context) {
                  //       return _filterATCDialog(context);
                  //     });
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
        ),

        SizedBox(
          height: _height * .014,
        ),
        // emptyList
        Column(
          children: [
            SizedBox(
              height: _height * .28,
            ),
            Text(
              "",
              style: GoogleFonts.poppins(
                  color: appColorPrimary,
                  fontSize: _height * .02,
                  fontWeight: FontWeight.w500),
            ),
          ],
        )
      ],
    );
  }
}
