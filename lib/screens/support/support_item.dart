import 'package:dms/constant.dart';
import 'package:dms/layout/appWidget.dart';
import 'package:dms/layout/dms_drawer.dart';
import 'package:dms/screens/support/support_request_list.dart';
import 'package:dms/utils/colors.dart';
import 'package:dms/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../profile/contact.dart';

class SupportItem extends StatefulWidget {
  SupportItem({Key? key}) : super(key: key);

  @override
  State<SupportItem> createState() => _SupportItemState();
}

class _SupportItemState extends State<SupportItem> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool menuClicked = false;

  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    final _screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
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
      bottomSheet: Padding(
        padding: EdgeInsets.only(
            left: _screenWidth * 0.04, right: _screenWidth * 0.04),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: _screenHeight * 0.026,
            ),
            //ext("Support", isBoldText: true, fontSize: 28.0),
            Text(
              "Support",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: _screenHeight * .0284,
                color: appColorPrimary,
              ),
            ),
            SizedBox(
              height: _screenHeight * 0.026,
            ),
            Expanded(
              child: Padding(
                  padding: EdgeInsets.all(_screenWidth * 0.01),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => Con()));
                          },
                          child: itemCard(context, _screenHeight,
                              "View Contact Details", personIcon),
                        ),
                        SizedBox(
                          height: _screenHeight * 0.02,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SupportRequestList()));
                          },
                          child: itemCard(context, _screenHeight,
                              "Support Request List", supportIcon),
                        ),
                        // Container(
                        //   // color: Colors.white70,
                        //   alignment: Alignment.center,
                        //   width: double.infinity,
                        //   decoration: BoxDecoration(
                        //     color: appColorPrimaryLight,
                        //   ),
                        //   child: Center(
                        //     child: ListTile(
                        //       onTap: () {
                        //         Navigator.push(
                        //             context,
                        //             MaterialPageRoute(
                        //                 builder: (context) =>
                        //                     SupportRequestList()));
                        //       },
                        //       leading: text("Support Request List",
                        //           isBoldText: true),
                        //       selectedTileColor: Theme.of(context).primaryColor,
                        //       selectedColor: Theme.of(context).dividerColor,
                        //       // minLeadingWidth: double.maxFinite,
                        //       trailing: Image.asset(
                        //         supportIcon,
                        //         height: _screenHeight * 0.035,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Widget itemCard(
      BuildContext context, double screenHeight, String title, String image) {
    return Container(
      // color: Colors.white70,
      alignment: Alignment.center,
      width: double.infinity,
      height: screenHeight * .095,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurStyle: BlurStyle.outer,
            blurRadius: 10,
            spreadRadius: 0,
            offset: Offset.zero,
          ),
        ],
        color: appWhite,
        // borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: ListTile(
          leading: Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: MediaQuery.of(context).size.height * .019,
              color: Color(0xff000000),
              fontWeight: FontWeight.w400,
            ),
          ),
          // selectedTileColor: Theme.of(context).primaryColor,
          // selectedColor: Theme.of(context).dividerColor,
          // minLeadingWidth: double.maxFinite,
          trailing: Image.asset(
            image,
            height: screenHeight * 0.035,
          ),
        ),
      ),
    );
  }
}
