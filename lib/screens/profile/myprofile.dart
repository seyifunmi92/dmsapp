import 'package:dms/layout/appWidget.dart';
import 'package:dms/screens/notifications/notificationsettings.dart';
import 'package:dms/utils/colors.dart';
import 'package:dms/utils/next_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../layout/dms_drawer.dart';
import '../accounts/dangoteaccounts.dart';

class Myprofile extends StatefulWidget {
  const Myprofile({Key? key}) : super(key: key);

  @override
  _MyprofileState createState() => _MyprofileState();
}

class _MyprofileState extends State<Myprofile> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool menuClicked = false;
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    var mypaddingr = SizedBox(width: _width * 0.07);
    var mypaddingr2 = SizedBox(width: _width * 0.04);
    var mypaddingrh = SizedBox(height: _height * 0.026);

    var _secondarycolor = Color(0xffEC1C24);

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
          // actions: [
          //   Padding(
          //     padding: EdgeInsets.only(right: _width * 0.015),
          //     child: Icon(
          //       Icons.notifications,
          //       color: appColorPrimary,
          //       size: _width * .05,
          //       //size: 15,
          //     ),
          //   ),
          // ]
        ),
        drawer: DMSDrawer(),
        //appBar: dmsDrawerAppBar(context, "", () {}),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              // SizedBox(height: _height * .05),
              // Row(
              //   //mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     mypaddingr,
              //     InkWell(
              //       onTap: () {},
              //       child: Image.asset(
              //         "lib/assets/dmsmenu.png",
              //         height: _height * .020,
              //         width: _width * .072,
              //         color: appColorPrimary,
              //         //width: 31.71,
              //       ),
              //     ),
              //   ],
              // ),
              mypaddingrh,
              Row(
                children: [
                  mypaddingr,
                  Text(
                    "My Profile",
                    style: GoogleFonts.poppins(
                      fontSize: _height * .03,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.02,
                      color: appColorPrimary,
                    ),
                  ),
                ],
              ),
              mypaddingrh,
              Row(
                children: [
                  mypaddingr,
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.grey,
                    ),
                    child: Image.asset("lib/assets/avatar2.png"),
                  ),
                ],
              ),
              mypaddingrh,
              Row(
                children: [
                  mypaddingr,
                  Container(
                    height: _height * .04,
                    width: _width * .088,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13.7),
                      color: _secondarycolor,
                    ),
                    child: Center(
                      child: Image.asset(
                        "lib/assets/dmsiconprofile.png",
                        height: _height * .018,
                        width: _width * .038,
                        color: appWhite,
                      ),
                    ),
                  ),
                  mypaddingr2,
                  Text(
                    "Adepoju Raymond",
                    style: GoogleFonts.openSans(
                      fontSize: _height * .021,
                      fontWeight: FontWeight.w600,
                      color: appColorPrimary,
                      letterSpacing: 0.02,
                    ),
                  ),
                ],
              ),
              mypaddingrh,
              Row(
                children: [
                  mypaddingr,
                  Container(
                    height: _height * .04,
                    width: _width * .088,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13.7),
                      color: _secondarycolor,
                    ),
                    child: Center(
                      child: Image.asset(
                        "lib/assets/dmsiconprofile.png",
                        height: _height * .018,
                        width: _width * .038,
                        color: appWhite,
                      ),
                    ),
                  ),
                  mypaddingr2,
                  Text(
                    "Adepoju.raymonf",
                    style: GoogleFonts.openSans(
                      fontSize: _height * .021,
                      fontWeight: FontWeight.w600,
                      color: appColorPrimary,
                      letterSpacing: 0.02,
                    ),
                  ),
                ],
              ),
              mypaddingrh,
              Row(
                children: [
                  mypaddingr,
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
                        height: _height * .018,
                        width: _width * .038,
                        color: appWhite,
                      ),
                    ),
                  ),
                  mypaddingr2,
                  Text(
                    "info@nagenzin.com",
                    style: GoogleFonts.openSans(
                      fontSize: _height * .021,
                      fontWeight: FontWeight.w600,
                      color: appColorPrimary,
                      letterSpacing: 0.02,
                    ),
                  ),
                ],
              ),
              mypaddingrh,
              Row(
                children: [
                  mypaddingr,
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
                        height: _height * .018,
                        width: _width * .038,
                        color: appWhite,
                      ),
                    ),
                  ),
                  mypaddingr2,
                  Text(
                    "+2347048282816",
                    style: GoogleFonts.openSans(
                      fontSize: _height * .021,
                      fontWeight: FontWeight.w600,
                      color: appColorPrimary,
                      letterSpacing: 0.02,
                    ),
                  ),
                ],
              ),
              mypaddingrh,
              mypaddingrh,
              // Row(
              //   children: [
              //     //mypaddingr,
              //     InkWell(
              //       onTap: () {
              //         Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //                 builder: (context) => DangoteAccounts()));
              //       },
              //       child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             Text(
              //               "Dangote Accounts",
              //               style: GoogleFonts.poppins(
              //                 fontWeight: FontWeight.w500,
              //                 fontSize: _height * .021,
              //                 color: Color(0xff343434),
              //               ),
              //             ),
              //             //SizedBox(width: _width * .45),
              //             Icon(
              //               Icons.arrow_forward_ios_sharp,
              //               size: _width * .038,
              //               color: Color(0xffE0E0E0),
              //             ),
              //           ]),
              //     ),
              //   ],
              // ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _width * .07),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DangoteAccounts()));
                        },
                        child: Text(
                          "Dangote Accounts",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: _height * .021,
                            color: Color(0xff343434),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DangoteAccounts()));
                        },
                        child: Icon(
                          Icons.arrow_forward_ios_sharp,
                          size: _width * .038,
                          color: Color(0xffE0E0E0),
                        ),
                      ),
                    ]),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _width * .07),
                child: Divider(
                  height: _height * .05,
                  color: Color(0xffECECEC),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _width * .07),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          nextScreen(context, NotSettings());
                        },
                        child: Text(
                          "Notification Settings",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: _height * .021,
                            color: Color(0xff343434),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.arrow_forward_ios_sharp,
                          size: _width * .038,
                          color: Color(0xffE0E0E0),
                        ),
                      ),
                    ]),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _width * .07),
                child: Divider(
                  height: _height * .05,
                  color: Color(0xffECECEC),
                ),
              ),
            ],
          ),
        ));
  }
}
