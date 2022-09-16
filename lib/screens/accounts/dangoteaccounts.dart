import 'package:dms/layout/appWidget.dart';
import 'package:dms/screens/accounts/accountdelete.dart';
import 'package:dms/screens/accounts/addanother.dart';
import 'package:dms/screens/accounts/faileddelete.dart';
import 'package:dms/utils/colors.dart';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class DangoteAccounts extends StatefulWidget {
  const DangoteAccounts({Key? key}) : super(key: key);

  @override
  _DangoteAccountsState createState() => _DangoteAccountsState();
}

class _DangoteAccountsState extends State<DangoteAccounts> {
  bool showPositioned = false;
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
        Row(
          children: [
            mypaddingr,
            Text(
              "Dangote Accounts",
              style: GoogleFonts.poppins(
                fontSize: _height * .0284,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.02,
                color: appColorPrimary,
              ),
            ),
          ],
        ),
        mypaddingrh,
        InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => FailedDelete()));
          },
          child: Container(
            width: _width * .85,
            height: _height * .095,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: appWhite,
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
            //padding: EdgeInsets.symmetric(horizontal: _width * .1),
            child: SingleChildScrollView(
              child: Column(children: [
                SizedBox(height: _height * .008),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: _width * .05),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Adepoju Raymond",
                          style: GoogleFonts.poppins(
                            fontSize: _height * .02,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff343434),
                          ),
                        ),
                        SizedBox(
                          width: _width * .29,
                        ),
                        InkWell(
                          onTap: () {
                            showPositioned = true;
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return _myDialog(context);
                                });
                          },
                          child: Container(
                            height: _height * .019,
                            width: _width * .0375,
                            child: Image.asset("lib/assets/dmsdelete.png"),
                          ),
                        ),
                      ]),
                ),
                SizedBox(height: _height * .005),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: _width * .05),
                  child: Row(children: [
                    Text(
                      "N01234",
                      style: GoogleFonts.poppins(
                        fontSize: _height * .02,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff343434),
                      ),
                    ),
                  ]),
                ),
              ]),
            ),
          ),
        ),
        mypaddingrh,
        InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddAnother()));
          },
          child: Container(
            width: _width * .85,
            height: _height * .0633,
            color: appColorPrimary,
            child: Center(
                child: Text(
              "Add another Account",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                color: appWhite,
                letterSpacing: 0.02,
                fontSize: _height * .0174,
              ),
            )),
          ),
        ),
      ]),
    );
  }

  Widget _myDialog(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    var containerheight = _height * .5142;
    var _mypadding = SizedBox(
      height: containerheight * .12,
    );
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
                "Are you sure you want to",
                style: GoogleFonts.poppins(
                  color: Color(0xff8D93A1),
                  fontSize: _height * .02,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "Delete Account",
                style: GoogleFonts.poppins(
                  color: Color(0xff8D93A1),
                  fontSize: _height * .02,
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
                              builder: (context) => AccountDelete()));
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
}
