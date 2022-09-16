import 'package:dms/constant.dart';
import 'package:dms/layout/appWidget.dart';
import 'package:dms/screens/dashboard/dashboard.dart';
import 'package:dms/screens/my_atc/my_atc_select_business.dart';
import 'package:dms/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SaveOrderSuccessScreen extends StatefulWidget {
  const SaveOrderSuccessScreen({Key? key}) : super(key: key);

  @override
  State<SaveOrderSuccessScreen> createState() => _SaveOrderSuccessScreenState();
}

class _SaveOrderSuccessScreenState extends State<SaveOrderSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    final _screenWidth = MediaQuery.of(context).size.width;
    final _screenHeight = MediaQuery.of(context).size.height;

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
              "Success",
              style: GoogleFonts.poppins(
                color: appColorPrimary,
                fontWeight: FontWeight.w600,
                fontSize: _height * .028,
                letterSpacing: .02,
              ),
            ),
            SizedBox(height: _height * .031),
            Text(
              "ATC Saved Successfully",
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
                    MaterialPageRoute(builder: (context) => DashBoard()));
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
      // body: SingleChildScrollView(
      //   scrollDirection: Axis.vertical,
      //   child: Padding(
      //     padding: EdgeInsets.only(left: _screenWidth * 0.07, right: _screenWidth * 0.07),
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       children: [
      //         SizedBox(
      //           height: _screenHeight * 0.04,
      //         ),
      //         Image.asset("assets/gif/save.gif", alignment: Alignment.center, width: 200,),
      //         SizedBox(
      //           height: _screenHeight * 0.13,
      //         ),
      //         text("Saved", isBoldText: true, fontSize: 28.0),
      //         SizedBox(
      //           height: _screenHeight * 0.02,
      //         ),
      //         text("ATC Saved Successfully", fontSize: 17.0, textColor: appTextColorSecondary),
      //         SizedBox(
      //           height: _screenHeight * 0.20,
      //         ),

      //         Align(
      //           alignment: Alignment.bottomCenter,
      //           child: Container(
      //             width: double.infinity,
      //             height: 55.0,
      //             margin: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 10.0),
      //             child: ElevatedButton(
      //               onPressed: () async {
      //               },
      //               style: ElevatedButton.styleFrom(
      //                 padding: const EdgeInsets.all(0),
      //                 textStyle: const TextStyle(
      //                   color:  Colors.white,
      //                 ),
      //                 primary:  appColorPrimary, // background
      //                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)),
      //               ),
      //               child: const Text(
      //                   "Go Back"
      //               ),
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      //),
    );
  }
}
