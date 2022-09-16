import 'package:dms/constant.dart';
import 'package:dms/layout/appWidget.dart';
import 'package:dms/layout/dms_drawer.dart';
import 'package:dms/screens/my%20orders/myordersnew.dart';
import 'package:dms/screens/my%20orders/neworders.dart';
import 'package:dms/screens/my%20orders/savedorders.dart';
import 'package:dms/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'myorders2.dart';

class NewOrders extends StatefulWidget {
  const NewOrders({Key? key}) : super(key: key);

  @override
  _NewOrdersState createState() => _NewOrdersState();
}

class _NewOrdersState extends State<NewOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appWhite,
      //key: _scaffoldKey,
      appBar: dmsAppBar(context, ""),

      drawer: DMSDrawer(),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    var mypadr = SizedBox(width: _width * .04);
    var mypadh = SizedBox(height: _height * .018);
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: _width * .04),
          child: Row(
            children: [
              Text(
                "My Orders",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: _height * .03,
                  color: appColorPrimary,
                ),
              ),
            ],
          ),
        ),
        mypadh,
        Row(
          children: [
            mypadr,
            Text(
              "Select Order Status",
              style: GoogleFonts.poppins(
                  fontSize: _height * .014,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff8D93A1)),
            ),
          ],
        ),
        mypadh,
        mypadh,
        Row(
          children: [
            mypadr,
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NewOrdery()));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurStyle: BlurStyle.outer,
                      blurRadius: 10,
                      spreadRadius: 0,
                      offset: Offset.zero,
                    ),
                  ],
                ),
                width: _width * .92,
                height: _height * .094,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: _width * .06),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("New",
                          style: GoogleFonts.poppins(
                            color: Color(0xff343434),
                            fontSize: _height * 0.019,
                            fontWeight: FontWeight.w600,
                          )),
                      Container(
                        height: _height * .0237,
                        width: _width * .079,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(142, 172, 222, 0.57),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            "New",
                            style: GoogleFonts.openSans(
                              fontWeight: FontWeight.w400,
                              fontSize: _height * .0118,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        mypadh,
        Row(
          children: [
            mypadr,
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SavedOrders()));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurStyle: BlurStyle.outer,
                      blurRadius: 10,
                      spreadRadius: 0,
                      offset: Offset.zero,
                    ),
                  ],
                ),
                width: _width * .92,
                height: _height * .094,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: _width * .06),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Saved",
                          style: GoogleFonts.poppins(
                            color: Color(0xff343434),
                            fontSize: _height * 0.019,
                            fontWeight: FontWeight.w600,
                          )),
                      Container(
                        height: _height * .0237,
                        width: _width * .1,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(178, 239, 255, 1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            "Saved",
                            style: GoogleFonts.openSans(
                              fontWeight: FontWeight.w400,
                              fontSize: _height * .0118,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        mypadh,
        Row(
          children: [
            mypadr,
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyOrders2()));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurStyle: BlurStyle.outer,
                      blurRadius: 10,
                      spreadRadius: 0,
                      offset: Offset.zero,
                    ),
                  ],
                ),
                width: _width * .92,
                height: _height * .094,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: _width * .06),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Submitted",
                          style: GoogleFonts.poppins(
                            color: Color(0xff343434),
                            fontSize: _height * 0.019,
                            fontWeight: FontWeight.w600,
                          )),
                      Container(
                        height: _height * .0237,
                        width: _width * .1538,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(39, 174, 96, 0.13),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            "Submitted",
                            style: GoogleFonts.openSans(
                              fontWeight: FontWeight.w400,
                              fontSize: _height * .0118,
                              color: Color(0xff27ae60),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
