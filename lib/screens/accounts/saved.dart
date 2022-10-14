import 'package:dms/layout/appWidget.dart';
import 'package:dms/screens/accounts/accountdelete.dart';
import 'package:dms/screens/accounts/addanother.dart';
import 'package:dms/screens/accounts/dangoteaccounts.dart';
import 'package:dms/screens/accounts/faileddelete.dart';
import 'package:dms/screens/profile/myprofile.dart';
import 'package:dms/utils/colors.dart';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class Saved extends StatefulWidget {
  const Saved({Key? key}) : super(key: key);

  @override
  _SavedState createState() => _SavedState();
}

class _SavedState extends State<Saved> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: dmsAppBar(context, '', showBack: true),
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
              // mypaddingr,
              //
              // InkWell(
              //   onTap: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => SuccessScreen()));
              //   },
              //   child: Icon(
              //     Icons.arrow_back_ios_outlined,
              //     color: appColorPrimary,
              //     size: _width * .04,
              //   ),
              // ),
              //mypaddingrh,
            ]),
            // mypaddingrh2,
            Container(
              height: _height * .237,
              width: _width * .5128,
              child: Image.asset(
                "assets/gif/save.gif",
              ),
            ),
            SizedBox(height: _height * .121),
            Text(
              "Saved",
              style: GoogleFonts.poppins(
                color: appColorPrimary,
                fontWeight: FontWeight.w600,
                fontSize: _height * .028,
                letterSpacing: .02,
              ),
            ),
            SizedBox(height: _height * .031),
            Text(
              "New Nickname Saved",
              style: GoogleFonts.poppins(
                color: appTextColorSecondary,
                fontWeight: FontWeight.w400,
                fontSize: _height * .019,
                letterSpacing: .02,
              ),
            ),
            SizedBox(height: _height * .2),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Myprofile()));
              },
              child: Container(
                width: _width * .85,
                height: _height * .063,
                color: appColorPrimary,
                child: Center(
                    child: Text(
                  "Go Back",
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
