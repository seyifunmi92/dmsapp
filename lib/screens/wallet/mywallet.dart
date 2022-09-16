import 'package:dms/constant.dart';
import 'package:dms/layout/appWidget.dart';
import 'package:dms/layout/dms_drawer.dart';
import 'package:dms/screens/wallet/wallet.dart';
import 'package:dms/screens/wallet/wallet_empty.dart';
import 'package:dms/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyWallet extends StatefulWidget {
  const MyWallet({Key? key}) : super(key: key);

  @override
  _MyWalletState createState() => _MyWalletState();
}

class _MyWalletState extends State<MyWallet> {
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
                "My Wallet",
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
                    MaterialPageRoute(builder: (context) => WalletScreen()));
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
                    MaterialPageRoute(builder: (context) => WalletScreen()));
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
