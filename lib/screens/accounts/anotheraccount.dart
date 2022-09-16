import 'package:dms/constant.dart';
import 'package:dms/splashscreen/splashscreen.dart';
import 'package:dms/utils/colors.dart';
import 'package:dms/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AnotherAccount extends StatefulWidget {
  const AnotherAccount({Key? key}) : super(key: key);

  @override
  _AnotherAccountState createState() => _AnotherAccountState();
}

class _AnotherAccountState extends State<AnotherAccount> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    var mypaddingr = SizedBox(width: _width * 0.07);

    var mypaddingrh = SizedBox(height: _height * 0.026);
    return Scaffold(
        body: Column(
      children: [
        SizedBox(height: _height * .05),
        Row(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            mypaddingr,
            InkWell(
              onTap: () {},
              child: Icon(
                Icons.arrow_back_ios,
                size: _width * .04,
                color: appColorPrimary,
              ),
            ),
          ],
        ),
        mypaddingrh,
        Row(
          children: [
            mypaddingr,
            Text(
              "Add another Account",
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.02,
                color: appColorPrimary,
              ),
            ),
          ],
        ),
        SizedBox(
          height: _height * .0178,
        ),
        Row(
          children: [
            mypaddingr,
            Text(
              "Kindly select your company and enter SAP ID to",
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.02,
                color: Color(0xff8D93A1),
              ),
            ),
          ],
        ),
        Row(
          children: [
            mypaddingr,
            Text(
              "register your account",
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.02,
                color: Color(0xff8D93A1),
              ),
            ),
          ],
        ),
        SizedBox(
          height: _height * .0178,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: _width * 0.07),
          child: Row(children: [
            Container(
              width: _width * .85,
              height: _height * .06,
              decoration: BoxDecoration(
                color: Colors.blueGrey[50],
                border: Border.all(
                  color: Color(0xff7C95B1),
                ),
              ),
              child: Center(
                  child: Row(
                children: [
                  SizedBox(
                    width: _width * .06,
                  ),
                  Text(
                    "Select Country",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffB1BBC6),
                    ),
                  ),
                  SizedBox(
                    width: _width * .4,
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Color(0xff999999),
                    ),
                  ),
                ],
              )),
            ),
          ]),
        ),
        SizedBox(
          height: _height * .025,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: _width * 0.07),
          child: Row(children: [
            Container(
              width: _width * .85,
              height: _height * .06,
              decoration: BoxDecoration(
                color: Colors.blueGrey[50],
                border: Border.all(
                  color: Color(0xff7C95B1),
                ),
              ),
              child: Center(
                  child: Row(
                children: [
                  SizedBox(
                    width: _width * .06,
                  ),
                  Text(
                    "Select Company",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffB1BBC6),
                    ),
                  ),
                  SizedBox(
                    width: _width * .36,
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Color(0xff999999),
                    ),
                  ),
                ],
              )),
            ),
          ]),
        ),
        SizedBox(
          height: _height * .025,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: _width * 0.07),
          child: Row(children: [
            Container(
              width: _width * .85,
              height: _height * .06,
              decoration: BoxDecoration(
                color: Colors.blueGrey[50],
                border: Border.all(
                  color: Color(0xff7C95B1),
                ),
              ),
              child: Center(
                  child: Row(
                children: [
                  SizedBox(
                    width: _width * .06,
                  ),
                  Text(
                    "Enter SAP ID",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffB1BBC6),
                    ),
                  ),
                  // SizedBox(
                  //   width: _width * .36,
                  // ),
                  // InkWell(
                  //   onTap: () {},
                  //   child: const Icon(
                  //     Icons.keyboard_arrow_down,
                  //     color: Color(0xff999999),
                  //   ),
                  // ),
                ],
              )),
            ),
          ]),
        ),
        SizedBox(
          height: _height * .4,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: _width * 0.07),
          child: Row(children: [
            InkWell(
              onTap: () {},
              child: Container(
                width: _width * .85,
                height: _height * .06,
                decoration: const BoxDecoration(
                  color: appColorPrimary,
                ),
                child: Center(
                  child: Text(
                    "Confirm",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 14.68,
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ],
    ));
  }
}
