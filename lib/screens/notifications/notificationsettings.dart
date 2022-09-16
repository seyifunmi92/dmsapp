import 'package:dms/layout/appWidget.dart';
import 'package:dms/layout/dms_drawer.dart';
import 'package:dms/screens/notifications/savenotifications.dart';
import 'package:dms/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'notificationdetails.dart';

class NotSettings extends StatefulWidget {
  const NotSettings({Key? key}) : super(key: key);

  @override
  _NotSettingsState createState() => _NotSettingsState();
}

class _NotSettingsState extends State<NotSettings> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: dmsAppBar(context, ""),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: _width * .07),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Notification Settings",
              style: GoogleFonts.poppins(
                fontSize: _height * .03,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.02,
                color: appColorPrimary,
              ),
            ),
            SizedBox(
              height: _height * .026,
            ),
            Text(
              "Switch toggle to change status update settings",
              style: GoogleFonts.poppins(
                  fontSize: _height * .0142,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.2,
                  color: Color(0xff8D93A1)),
            ),
            SizedBox(
              height: _height * .024,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Order status Update?",
                  style: GoogleFonts.poppins(
                      fontSize: _height * .01896,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff343434)),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: _height * .01,
                    ),
                    ToggleSwitch(
                      minHeight: _height * .0173,
                      minWidth: _width * .044,
                      cornerRadius: 15.0,
                      activeBgColors: [
                        [Colors.white70],
                        [Colors.white70]
                      ],
                      activeFgColor: Colors.white,
                      inactiveBgColor: Color(0xffC4C4C4),
                      //inactiveFgColor: Colors.white,
                      initialLabelIndex: 1,
                      totalSwitches: 2,
                      labels: ['True', 'False'],
                      radiusStyle: true,
                      onToggle: (index) {
                        print('switched to: $index');
                      },
                    ),
                  ],
                ),
              ],
            ),
            Divider(
              height: _height * .0679,
              color: Color(0xfECECECf),
            ),
            SizedBox(
              height: _height * .013,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Delivery status Update?",
                  style: GoogleFonts.poppins(
                      fontSize: _height * .01896,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff343434)),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: _height * .01,
                    ),
                    ToggleSwitch(
                      minHeight: _height * .0173,
                      minWidth: _width * .044,
                      cornerRadius: 15.0,
                      activeBgColors: [
                        [Colors.white],
                        [Colors.white]
                      ],
                      activeFgColor: Colors.white,
                      inactiveBgColor: appColorPrimary,
                      //inactiveFgColor: Colors.white,
                      initialLabelIndex: 1,
                      totalSwitches: 2,
                      // borderWidth: 0.1,

                      labels: ['True', 'False'],
                      radiusStyle: true,
                      onToggle: (index) {
                        print('switched to: $index');
                      },
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: _height * .55,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SaveNotifications()));
              },
              child: Container(
                width: _width * .92,
                height: _height * .0633,
                decoration: BoxDecoration(
                  //border: Border.all(color: Color(0xffB1BBC6)),
                  color: appColorPrimary,
                ),
                child: Center(
                    child: Text(
                  "Save",
                  style: GoogleFonts.poppins(
                    color: white,
                    fontSize: _height * .016,
                    fontWeight: FontWeight.w500,
                  ),
                )),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
