import 'package:dms/layout/appWidget.dart';
import 'package:dms/layout/dms_drawer.dart';
import 'package:dms/screens/my%20orders/orderdetails.dart';
import 'package:dms/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SavedOrders extends StatefulWidget {
  const SavedOrders({Key? key}) : super(key: key);

  @override
  _SavedOrdersState createState() => _SavedOrdersState();
}

class _SavedOrdersState extends State<SavedOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appWhite,
      appBar: dmsAppBar(context, ""),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    var mypadr = SizedBox(width: _width * .04);
    var mypadh = SizedBox(height: _height * .008);
    var mypadh2 = SizedBox(height: _height * .015);

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: _width * .04),
            child: Column(
              children: [
                SizedBox(
                  height: _height * 0.026,
                ),
                Row(
                  children: [
                    Text(
                      "Saved Orders",
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
          mypadh,
          mypadh,
          mypadh,
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
                            "Search with Order Number",
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
                Container(
                  color: appColorPrimary,
                  height: _height * .0569,
                  width: _width * .1205,
                  //child: Icon(Icons.filter),
                  child: Image.asset("lib/assets/new.png"),
                ),
              ],
            ),
          ),
          mypadh,
          mypadh,
          mypadh,
          Row(
            children: [
              mypadr,
              _boxCustom1(context),
            ],
          ),
          mypadh2,
          Row(
            children: [
              mypadr,
              _boxCustom2(context),
            ],
          ),
          mypadh2,
          _boxCustom3(context),
          mypadh2,
          _boxCustom4(context),
          mypadh2,
          _boxCustom5(context),
          mypadh2,
          _boxCustom6(context),
          mypadh2,
          _boxCustom6(context),
        ],
      ),
    );
  }

  Widget _boxCustom1(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    //var mypaddingr2 = SizedBox(width: _width * 0.05);
    var mypadhh = SizedBox(height: _height * .02);
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => OrderDetails()));
      },
      child: Container(
        width: _width * .92,
        height: _height * .104,
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
          color: appWhite,
          borderRadius: BorderRadius.circular(5),
        ),
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: _height * .013,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _width * .05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "12-05-22",
                        style: GoogleFonts.openSans(
                          fontSize: _height * .02,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  //SizedBox(width: _width * .45),
                  Text(
                    "N200,000",
                    style: GoogleFonts.openSans(
                      fontSize: _height * .02,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            mypadhh,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _width * .05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //mypaddingr2,
                  // Text(
                  //   "N20,000",
                  //   style: GoogleFonts.openSans(
                  //       fontSize: _height * .014,
                  //       fontWeight: FontWeight.w400,
                  //       color: Color(0xff00CC08)),
                  // ),
                  //SizedBox(width: _width * .54),
                  Container(
                    height: _height * .0284,
                    width: _width * .305,
                    decoration: BoxDecoration(
                        color: Color(0xffE4EBF3).withOpacity(0.5),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                        child: Text(
                      "Pending OTP Validation",
                      style: GoogleFonts.openSans(
                          fontSize: _height * .0118,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff8D93A1)),
                    )),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Image.asset(
                      "lib/assets/dell.png",
                      height: _height * .016,
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget _boxCustom2(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    //var mypaddingr2 = SizedBox(width: _width * 0.05);
    var mypadhh = SizedBox(height: _height * .02);
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => OrderDetails()));
      },
      child: Container(
        width: _width * .92,
        height: _height * .104,
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
          color: appWhite,
          borderRadius: BorderRadius.circular(5),
        ),
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: _height * .013,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _width * .05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "12-05-22",
                        style: GoogleFonts.openSans(
                          fontSize: _height * .02,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  //SizedBox(width: _width * .45),
                  Text(
                    "N200,000",
                    style: GoogleFonts.openSans(
                      fontSize: _height * .02,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            mypadhh,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _width * .05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //mypaddingr2,
                  // Text(
                  //   "N20,000",
                  //   style: GoogleFonts.openSans(
                  //       fontSize: _height * .014,
                  //       fontWeight: FontWeight.w400,
                  //       color: Color(0xff00CC08)),
                  // ),
                  //SizedBox(width: _width * .54),
                  Container(
                    height: _height * .0284,
                    width: _width * .305,
                    decoration: BoxDecoration(
                        color: Color(0xffE4EBF3).withOpacity(0.5),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                        child: Text(
                      "Pending OTP Validation",
                      style: GoogleFonts.openSans(
                          fontSize: _height * .0118,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff8D93A1)),
                    )),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Image.asset(
                      "lib/assets/dell.png",
                      height: _height * .016,
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget _boxCustom3(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    //var mypaddingr2 = SizedBox(width: _width * 0.05);
    var mypadhh = SizedBox(height: _height * .02);
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => OrderDetails()));
      },
      child: Container(
        width: _width * .92,
        height: _height * .104,
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
          color: appWhite,
          borderRadius: BorderRadius.circular(5),
        ),
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: _height * .013,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _width * .05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "12-05-22",
                        style: GoogleFonts.openSans(
                          fontSize: _height * .02,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  //SizedBox(width: _width * .45),
                  Text(
                    "N200,000",
                    style: GoogleFonts.openSans(
                      fontSize: _height * .02,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            mypadhh,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _width * .05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //mypaddingr2,
                  // Text(
                  //   "N20,000",
                  //   style: GoogleFonts.openSans(
                  //       fontSize: _height * .014,
                  //       fontWeight: FontWeight.w400,
                  //       color: Color(0xff00CC08)),
                  // ),
                  //SizedBox(width: _width * .54),
                  Container(
                    height: _height * .0284,
                    width: _width * .305,
                    decoration: BoxDecoration(
                        color: Color(0xffE4EBF3).withOpacity(0.5),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                        child: Text(
                      "Pending OTP Validation",
                      style: GoogleFonts.openSans(
                          fontSize: _height * .0118,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff8D93A1)),
                    )),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Image.asset(
                      "lib/assets/dell.png",
                      height: _height * .016,
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget _boxCustom4(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    //var mypaddingr2 = SizedBox(width: _width * 0.05);
    var mypadhh = SizedBox(height: _height * .02);
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => OrderDetails()));
      },
      child: Container(
        width: _width * .92,
        height: _height * .104,
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
          color: appWhite,
          borderRadius: BorderRadius.circular(5),
        ),
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: _height * .013,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _width * .05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "12-05-22",
                        style: GoogleFonts.openSans(
                          fontSize: _height * .02,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  //SizedBox(width: _width * .45),
                  Text(
                    "N200,000",
                    style: GoogleFonts.openSans(
                      fontSize: _height * .02,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            mypadhh,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _width * .05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //mypaddingr2,
                  // Text(
                  //   "N20,000",
                  //   style: GoogleFonts.openSans(
                  //       fontSize: _height * .014,
                  //       fontWeight: FontWeight.w400,
                  //       color: Color(0xff00CC08)),
                  // ),
                  //SizedBox(width: _width * .54),
                  Container(
                    height: _height * .0284,
                    width: _width * .305,
                    decoration: BoxDecoration(
                        color: Color(0xffE4EBF3).withOpacity(0.5),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                        child: Text(
                      "Pending OTP Validation",
                      style: GoogleFonts.openSans(
                          fontSize: _height * .0118,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff8D93A1)),
                    )),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Image.asset(
                      "lib/assets/dell.png",
                      height: _height * .016,
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget _boxCustom5(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    //var mypaddingr2 = SizedBox(width: _width * 0.05);
    var mypadhh = SizedBox(height: _height * .02);
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => OrderDetails()));
      },
      child: Container(
        width: _width * .92,
        height: _height * .104,
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
          color: appWhite,
          borderRadius: BorderRadius.circular(5),
        ),
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: _height * .013,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _width * .05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "12-05-22",
                        style: GoogleFonts.openSans(
                          fontSize: _height * .02,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  //SizedBox(width: _width * .45),
                  Text(
                    "N200,000",
                    style: GoogleFonts.openSans(
                      fontSize: _height * .02,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            mypadhh,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _width * .05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //mypaddingr2,
                  // Text(
                  //   "N20,000",
                  //   style: GoogleFonts.openSans(
                  //       fontSize: _height * .014,
                  //       fontWeight: FontWeight.w400,
                  //       color: Color(0xff00CC08)),
                  // ),
                  //SizedBox(width: _width * .54),
                  Container(
                    height: _height * .0284,
                    width: _width * .305,
                    decoration: BoxDecoration(
                        color: Color(0xffE4EBF3).withOpacity(0.5),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                        child: Text(
                      "Pending OTP Validation",
                      style: GoogleFonts.openSans(
                          fontSize: _height * .0118,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff8D93A1)),
                    )),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Image.asset(
                      "lib/assets/dell.png",
                      height: _height * .016,
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget _boxCustom6(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    //var mypaddingr2 = SizedBox(width: _width * 0.05);
    var mypadhh = SizedBox(height: _height * .02);
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => OrderDetails()));
      },
      child: Container(
        width: _width * .92,
        height: _height * .104,
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
          color: appWhite,
          borderRadius: BorderRadius.circular(5),
        ),
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: _height * .013,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _width * .05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "12-05-22",
                        style: GoogleFonts.openSans(
                          fontSize: _height * .02,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  //SizedBox(width: _width * .45),
                  Text(
                    "N200,000",
                    style: GoogleFonts.openSans(
                      fontSize: _height * .02,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            mypadhh,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _width * .05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //mypaddingr2,
                  // Text(
                  //   "N20,000",
                  //   style: GoogleFonts.openSans(
                  //       fontSize: _height * .014,
                  //       fontWeight: FontWeight.w400,
                  //       color: Color(0xff00CC08)),
                  // ),
                  //SizedBox(width: _width * .54),
                  Container(
                    height: _height * .0284,
                    width: _width * .305,
                    decoration: BoxDecoration(
                        color: Color(0xffE4EBF3).withOpacity(0.5),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                        child: Text(
                      "Pending OTP Validation",
                      style: GoogleFonts.openSans(
                          fontSize: _height * .0118,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff8D93A1)),
                    )),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Image.asset(
                      "lib/assets/dell.png",
                      height: _height * .016,
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
