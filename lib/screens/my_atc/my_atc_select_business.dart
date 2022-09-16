import 'package:dms/layout/appWidget.dart';
import 'package:dms/layout/dms_drawer.dart';
import 'package:dms/screens/my_atc/my_atc_order_list.dart';
import 'package:dms/screens/my_atc/myatcc.dart';
import 'package:dms/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyATCSelectBusiness extends StatefulWidget {
  MyATCSelectBusiness({Key? key}) : super(key: key);

  @override
  State<MyATCSelectBusiness> createState() => _MyATCSelectBusinessState();
}

class _MyATCSelectBusinessState extends State<MyATCSelectBusiness> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool menuClicked = false;

  @override
  Widget build(BuildContext context) {
    // final _screenWidth = MediaQuery.of(context).size.width;
    // final _screenHeight = MediaQuery.of(context).size.height;

    // return Scaffold(/
    //   key: _scaffoldKey,
    //   // backgroundColor: Color(0xFFF2F2F2),
    //   appBar: dmsDrawerAppBar(
    //     context,
    //     '',
    //     () {
    //       _scaffoldKey.currentState!.openDrawer();
    //       setState(() {
    //         menuClicked = true;
    //       });
    //     },
    //   ),
    //   drawer: DMSDrawer(),
    //   bottomSheet: Padding(
    //     padding: EdgeInsets.only(
    //         left: _screenWidth * 0.04, right: _screenWidth * 0.04),
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.start,
    //       crossAxisAlignment: CrossAxisAlignment.stretch,
    //       children: <Widget>[
    //         text("My ATC", isBoldText: true, fontSize: 28.0),
    //         SizedBox(
    //           height: _screenHeight * 0.01,
    //         ),
    //         text("Select account",
    //             fontSize: 13.0, textColor: appTextColorSecondary),
    //         Expanded(
    //           child: Padding(
    //             padding: EdgeInsets.all(_screenWidth * 0.01),
    //             child: ListView.builder(
    //                 itemCount: 2,
    //                 scrollDirection: Axis.vertical,
    //                 shrinkWrap: true,
    //                 itemBuilder: (context, index) {
    //                   return Padding(
    //                     padding: const EdgeInsets.only(bottom: 12.0),
    //                     child: Material(
    //                       elevation: 1,
    //                       surfaceTintColor: Colors.white,
    //                       shadowColor: Colors.black,
    //                       child: Container(
    //                         height: _screenHeight * 0.11,
    //                         // color: Colors.white70,
    //                         alignment: Alignment.center,
    //                         width: double.infinity,
    //                         decoration: BoxDecoration(
    //                           // borderRadius: BorderRadius.circular(10),
    //                           // color: Color(0xFFF2F2F2),
    //                           color: changeColorHue(appWhite),
    //                         //   gradient: LinearGradient(
    //                         //   begin: Alignment.topRight, end: Alignment.bottomLeft, colors: [Color(0xFFF2F2F2), Color(0xFFF1F1F1),],
    //                         // ),
    //                         ),
    //                         child: Center(
    //                           child: ListTile(
    //                             onTap: () {
    //                               Navigator.push(
    //                                   context,
    //                                   MaterialPageRoute(
    //                                       builder: (context) => MyATCC()));
    //                             },
    //                             // tileColor: Colors.white,
    //                             title: text("DB00023$index", isBoldText: true),
    //                             selectedTileColor: Theme.of(context).primaryColor,
    //                             selectedColor: Theme.of(context).dividerColor,
    //                             // minLeadingWidth: double.maxFinite,
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                   );
    //                 }),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );

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
                "My ATC",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: _height * .0284,
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
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyATCC()));
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
                    Text("DB00230",
                        style: GoogleFonts.poppins(
                          color: appColorPrimary,
                          fontSize: _height * .019,
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
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyATCC()));
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
                    Text("DB00231",
                        style: GoogleFonts.poppins(
                          color: appColorPrimary,
                          fontSize: _height * .019,
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
