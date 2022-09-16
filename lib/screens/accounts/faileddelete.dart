import 'package:dms/constant.dart';
import 'package:dms/layout/appWidget.dart';

import 'package:dms/splashscreen/splashscreen.dart';
import 'package:dms/utils/colors.dart';
import 'package:dms/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dangoteaccounts.dart';

class FailedDelete extends StatefulWidget {
  const FailedDelete({Key? key}) : super(key: key);

  @override
  _FailedDeleteState createState() => _FailedDeleteState();
}

class _FailedDeleteState extends State<FailedDelete> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    var mypaddingr = SizedBox(width: _width * 0.07);
    var mypaddingrh2 = SizedBox(height: _height * .1174);
    print("This is the height - $_height & width - $_width");
    return Scaffold(
      appBar: dmsAppBar(context, ""),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: _height * .113,
            ),
            //mypaddingrh,
            // SizedBox(
            //   height: _height * .03,
            // ),
            Row(children: [
              //mypaddingrh,
            ]),
            //mypaddingrh2,
            Container(
              height: _height * .237,
              width: _width * .5128,
              child: Image.asset(
                "assets/gif/cancel.gif",
              ),
            ),
            SizedBox(height: _height * .121),
            Text(
              "Failure",
              style: GoogleFonts.poppins(
                color: appColorPrimary,
                fontWeight: FontWeight.w600,
                fontSize: _height * .028,
                letterSpacing: .02,
              ),
            ),
            SizedBox(height: _height * .031),
            Text(
              "Account Delete Failed",
              style: GoogleFonts.poppins(
                color: Color(0xff8D934A1),
                fontWeight: FontWeight.w400,
                fontSize: _height * .019,
                letterSpacing: .02,
              ),
            ),
            SizedBox(height: _height * .2),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DangoteAccounts()));
              },
              child: Container(
                width: _width * .85,
                height: _height * .063,
                color: appColorPrimary,
                child: Center(
                    child: Text(
                  "My Dangote Accounts",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    color: appWhite,
                    letterSpacing: 0.02,
                    fontSize: _height * .0174,
                  ),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
