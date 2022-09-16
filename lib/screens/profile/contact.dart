import 'package:dms/constant.dart';
import 'package:dms/layout/appWidget.dart';
import 'package:dms/screens/support/support_request_success.dart';
import 'package:dms/utils/colors.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Con extends StatefulWidget {
  const Con({Key? key}) : super(key: key);

  @override
  _ConState createState() => _ConState();
}

class _ConState extends State<Con> {
  var _secondarycolor = Color(0xffEC1C24);

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
            "Dangote Cement",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: _height * .03,
              color: appColorPrimary,
            ),
          ),
          SizedBox(
            height: _height * .023,
          ),
          InkWell(
            onTap: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => SupportRequestSuccessScreen()));
            },
            child: Container(
              width: _width,
              height: _height * .3258,
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
                    _width * .085, _height * .02, _width * .06, _height * .01),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset("lib/assets/dmscement.png",
                          height: _height * .059),
                      // Text(
                      //   "Category",
                      //   style: GoogleFonts.poppins(
                      //     fontSize: _height * .0142,
                      //     fontWeight: FontWeight.w600,
                      //     color: Color(0xff979797),
                      //   ),
                      // ),
                    ],
                  ),
                  SizedBox(
                    height: _height * .02,
                  ),
                  // DottedLine(
                  //   dashColor: Color(0xffcbcbcb),
                  // ),
                  // SizedBox(
                  //   height: _height * .026,
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: _height * .04,
                        width: _width * .088,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13.7),
                          color: _secondarycolor,
                        ),
                        child: Center(
                          child: Image.asset(
                            "lib/assets/Vector.png",
                            height: _height * .0163,
                            //width: _width * .038,
                            color: appWhite,
                          ),
                        ),
                      ),
                      Text(
                        "Customercare@dangote.com",
                        style: GoogleFonts.openSans(
                            fontSize: _height * .01896,
                            fontWeight: FontWeight.w400,
                            color: appColorPrimary),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: _height * .02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: _height * .04,
                        width: _width * .088,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13.7),
                          color: _secondarycolor,
                        ),
                        child: Center(
                          child: Image.asset(
                            "lib/assets/dmscall.png",
                            height: _height * .0163,
                            //width: _width * .038,
                            color: appWhite,
                          ),
                        ),
                      ),
                      Text(
                        "+234-1-460-643",
                        style: GoogleFonts.openSans(
                            fontSize: _height * .01896,
                            fontWeight: FontWeight.w400,
                            color: appColorPrimary),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: _height * .02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: _height * .04,
                        width: _width * .088,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13.7),
                          color: _secondarycolor,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.home,
                            color: Colors.white,
                            size: _height * .0223,
                          ),
                          // child: Image.asset(
                          //   "lib/assets/dmscall.png",
                          //   height: _height * .0163,
                          //   //width: _width * .038,
                          //   color: appWhite,
                          // ),
                        ),
                      ),
                      Text(
                        "Union Marble House 1 Alfred\nRewane Road, PMB 40032,\nFalomo Ikoyi, Lagos, NIGERIA",
                        style: GoogleFonts.openSans(
                            fontSize: _height * .01896,
                            fontWeight: FontWeight.w400,
                            color: appColorPrimary),
                      ),
                    ],
                  ),
                ]),
              ),
            ),
          ),
          SizedBox(
            height: _height * .02,
          ),
          InkWell(
            onTap: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => SupportRequestSuccessScreen()));
            },
            child: Container(
              width: _width,
              height: _height * .3673,
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
                    _width * .085, _height * .02, _width * .06, _height * .01),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset("lib/assets/dmssugar.png",
                          height: _height * .059),
                      // Text(
                      //   "Category",
                      //   style: GoogleFonts.poppins(
                      //     fontSize: _height * .0142,
                      //     fontWeight: FontWeight.w600,
                      //     color: Color(0xff979797),
                      //   ),
                      // ),
                    ],
                  ),
                  SizedBox(
                    height: _height * .02,
                  ),
                  // DottedLine(
                  //   dashColor: Color(0xffcbcbcb),
                  // ),
                  // SizedBox(
                  //   height: _height * .026,
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: _height * .04,
                        width: _width * .088,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13.7),
                          color: _secondarycolor,
                        ),
                        child: Center(
                          child: Image.asset(
                            "lib/assets/Vector.png",
                            height: _height * .0163,
                            //width: _width * .038,
                            color: appWhite,
                          ),
                        ),
                      ),
                      Text(
                        "dangotesugar@dangote.com",
                        style: GoogleFonts.openSans(
                            fontSize: _height * .01896,
                            fontWeight: FontWeight.w400,
                            color: appColorPrimary),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: _height * .02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: _height * .04,
                        width: _width * .088,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13.7),
                          color: _secondarycolor,
                        ),
                        child: Center(
                          child: Image.asset(
                            "lib/assets/dmscall.png",
                            height: _height * .0163,
                            //width: _width * .038,
                            color: appWhite,
                          ),
                        ),
                      ),
                      Text(
                        "+234 815 098 3259",
                        style: GoogleFonts.openSans(
                            fontSize: _height * .01896,
                            fontWeight: FontWeight.w400,
                            color: appColorPrimary),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: _height * .02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: _height * .04,
                        width: _width * .088,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13.7),
                          color: _secondarycolor,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.home,
                            color: Colors.white,
                            size: _height * .0223,
                          ),
                          // child: Image.asset(
                          //   "lib/assets/dmscall.png",
                          //   height: _height * .0163,
                          //   //width: _width * .038,
                          //   color: appWhite,
                          // ),
                        ),
                      ),
                      Text(
                        "3rd Floor, GDNL Building\nTerminal E,Shed 20,NPA\nWharf Port Complex, Apapa,\nLagos.",
                        style: GoogleFonts.openSans(
                            fontSize: _height * .01896,
                            fontWeight: FontWeight.w400,
                            color: appColorPrimary),
                      ),
                    ],
                  ),
                ]),
              ),
            ),
          ),
          SizedBox(
            height: _height * .02,
          ),
          InkWell(
            onTap: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => SupportRequestSuccessScreen()));
            },
            child: Container(
              width: _width,
              height: _height * .315,
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
                    _width * .085, _height * .02, _width * .06, _height * .01),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset("lib/assets/nascom.png",
                          height: _height * .059),
                      // Text(
                      //   "Category",
                      //   style: GoogleFonts.poppins(
                      //     fontSize: _height * .0142,
                      //     fontWeight: FontWeight.w600,
                      //     color: Color(0xff979797),
                      //   ),
                      // ),
                    ],
                  ),
                  SizedBox(
                    height: _height * .02,
                  ),
                  // DottedLine(
                  //   dashColor: Color(0xffcbcbcb),
                  // ),
                  // SizedBox(
                  //   height: _height * .026,
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: _height * .04,
                        width: _width * .088,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13.7),
                          color: _secondarycolor,
                        ),
                        child: Center(
                          child: Image.asset(
                            "lib/assets/Vector.png",
                            height: _height * .0163,
                            //width: _width * .038,
                            color: appWhite,
                          ),
                        ),
                      ),
                      Text(
                        "nasconcare@dangote.com",
                        style: GoogleFonts.openSans(
                            fontSize: _height * .01896,
                            fontWeight: FontWeight.w400,
                            color: appColorPrimary),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: _height * .02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: _height * .04,
                        width: _width * .088,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13.7),
                          color: _secondarycolor,
                        ),
                        child: Center(
                          child: Image.asset(
                            "lib/assets/dmscall.png",
                            height: _height * .0163,
                            //width: _width * .038,
                            color: appWhite,
                          ),
                        ),
                      ),
                      Text(
                        "+234 0700 888 0888",
                        style: GoogleFonts.openSans(
                            fontSize: _height * .01896,
                            fontWeight: FontWeight.w400,
                            color: appColorPrimary),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: _height * .02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: _height * .04,
                        width: _width * .088,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13.7),
                          color: _secondarycolor,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.home,
                            color: Colors.white,
                            size: _height * .0223,
                          ),
                          // child: Image.asset(
                          //   "lib/assets/dmscall.png",
                          //   height: _height * .0163,
                          //   //width: _width * .038,
                          //   color: appWhite,
                          // ),
                        ),
                      ),
                      Text(
                        "I5B Ikosi Road, Oregun, Ikeja,\nNigeria",
                        style: GoogleFonts.openSans(
                            fontSize: _height * .01896,
                            fontWeight: FontWeight.w400,
                            color: appColorPrimary),
                      ),
                    ],
                  ),
                ]),
              ),
            ),
          ),
          SizedBox(
            height: _height * .1,
          ),
        ]),
      ),
    );
  }
}
