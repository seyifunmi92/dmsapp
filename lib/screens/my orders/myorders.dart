import 'package:dms/constant.dart';
import 'package:dms/layout/appWidget.dart';
import 'package:dms/layout/dms_drawer.dart';
import 'package:dms/screens/accounts/accountdelete.dart';
import 'package:dms/screens/auth/confirm_otp.dart';
import 'package:dms/screens/auth/login_screen.dart';
import 'package:dms/screens/auth/new_distributor_notice.dart';
import 'package:dms/screens/auth/password_reset/input_new_password.dart';
import 'package:dms/screens/auth/password_reset/password_reset_request.dart';
import 'package:dms/screens/auth/register_screen_contd.dart';
import 'package:dms/screens/dashboard/dashboard.dart';
import 'package:dms/screens/faq/faq_categories.dart';
import 'package:dms/screens/my%20orders/myorders2.dart';
import 'package:dms/screens/my%20orders/myordersnew.dart';
import 'package:dms/screens/my%20orders/newmyordrs.dart';
import 'package:dms/screens/my_atc/my_atc_detail.dart';
import 'package:dms/splashscreen/splashscreen.dart';
import 'package:dms/screens/support/new_support_request.dart';
import 'package:dms/utils/colors.dart';
import 'package:dms/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dms/screens/my orders/newmyordrs.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({Key? key}) : super(key: key);

  @override
  _MyOrdersState createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool menuClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appWhite,
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
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    var mypadr = SizedBox(
      width: _width * .04,
    );
    var mypadh = SizedBox(
      height: _height * .012,
    );
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
              "Select Account",
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
                    MaterialPageRoute(builder: (context) => NewOrders()));
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
                height: _height * .095,
                child: Center(
                  child: Row(children: [
                    SizedBox(
                      width: _width * .0755,
                    ),
                    Text("DB00234",
                        style: GoogleFonts.poppins(
                          color: appColorPrimary,
                          fontSize: _height * 0.02,
                          fontWeight: FontWeight.w600,
                        )),
                  ]),
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
                    MaterialPageRoute(builder: (context) => NewOrders()));
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
                height: _height * .095,
                //color: Colors.white,
                child: Center(
                  child: Row(children: [
                    SizedBox(
                      width: _width * .0755,
                    ),
                    Text("DB00235",
                        style: GoogleFonts.poppins(
                          color: appColorPrimary,
                          fontSize: _height * 0.02,
                          fontWeight: FontWeight.w600,
                        )),
                  ]),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
