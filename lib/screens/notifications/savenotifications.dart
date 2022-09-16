import 'package:dms/layout/appWidget.dart';
import 'package:dms/layout/dms_drawer.dart';
import 'package:dms/screens/notifications/notificationsettings.dart';
import 'package:dms/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'notificationdetails.dart';

class SaveNotifications extends StatefulWidget {
  const SaveNotifications({Key? key}) : super(key: key);

  @override
  _SaveNotificationsState createState() => _SaveNotificationsState();
}

class _SaveNotificationsState extends State<SaveNotifications> {
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
              "Notification Settings Saved",
              style: GoogleFonts.poppins(
                color: Color(0xff8D93A1),
                fontWeight: FontWeight.w400,
                fontSize: _height * .019,
                letterSpacing: .02,
              ),
            ),
            Text(
              "Successfully",
              style: GoogleFonts.poppins(
                color: Color(0xff8D93A1),
                fontWeight: FontWeight.w400,
                fontSize: _height * .019,
                letterSpacing: .02,
              ),
            ),
            SizedBox(height: _height * .195),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NotSettings()));
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
