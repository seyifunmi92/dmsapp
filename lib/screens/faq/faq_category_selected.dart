import 'package:dms/constant.dart';
import 'package:dms/layout/appWidget.dart';
import 'package:dms/screens/faq/faq_details_screen.dart';
import 'package:dms/utils/colors.dart';
import 'package:dms/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FAQCategorySelected extends StatefulWidget {
  const FAQCategorySelected({Key? key}) : super(key: key);

  @override
  State<FAQCategorySelected> createState() => _FAQCategorySelectedState();
}

class _FAQCategorySelectedState extends State<FAQCategorySelected> {
  var _opacity = 1.0;
  var _xOffset = 0.0;
  var _yOffset = 0.0;
  var _blurRadius = 0.0;
  var _spreadRadius = 0.0;

  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    final _screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: dmsAppBar(context, '', showBack: true),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: _screenHeight * .02,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: _screenWidth * 0.04, right: _screenWidth * 0.04),
              child: Text(
                "Accounts FAQ",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: _screenHeight * .0284,
                  color: appColorPrimary,
                ),
              ),
              //child: text("Accounts FAQ", isBoldText: true, fontSize: 28.0),
            ),
            SizedBox(
              height: _screenHeight * 0.0213,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: _screenWidth * 0.04, right: _screenWidth * 0.04),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FAQDetailsScreen()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: inputBackgroundColor,
                      border: Border.all(
                          color: inputBorderColor,
                          width: 1,
                          style: BorderStyle.solid)),
                  height: 45,
                  width: _screenWidth * 0.90,
                  padding: EdgeInsets.symmetric(horizontal: 14, vertical: 13),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.search,
                        color: iconColorSecondary,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: _screenWidth * 0.01),
                        child: Text(
                          "Search Question",
                          style: TextStyle(
                              color: iconColorSecondary,
                              fontFamily: fontRegular,
                              fontSize: textSizeMedium),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: _screenHeight * 0.02,
            ),
            Column(
              children: [
                ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: _screenWidth * 0.04,
                                right: _screenWidth * 0.04),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            FAQDetailsScreen()));
                              },
                              child: Container(
                                // color: Colors.white70,
                                alignment: Alignment.center,
                                width: double.infinity,
                                height: 70,
                                child: Center(
                                  child: ListTile(
                                    // tileColor: Colors.white,
                                    leading: text(
                                        "How to change password $index",
                                        fontSize: _screenHeight * .019,
                                        textColor: appTextColorPrimary),
                                    selectedTileColor:
                                        Theme.of(context).primaryColor,
                                    selectedColor:
                                        Theme.of(context).dividerColor,
                                    trailing: Icon(
                                      Icons.arrow_forward_ios,
                                      size: _screenHeight * .024,
                                    ),

                                    // minLeadingWidth: double.maxFinite,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: appTextColorPrimary
                                .withOpacity(0.4), //color of divider
                            height: _screenHeight *
                                .00118, //height spacing of divider
                            thickness: 1, //thickness of divier line
                          ),
                        ],
                      );
                    }),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          width: double.infinity,
          height: _screenHeight * 0.252,
          margin: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 10.0, 0.0),
          // decoration: BoxDecoration(
          //   border:
          // ),
          decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(color: Colors.black.withOpacity(0.13)))),
          child: Padding(
            padding: EdgeInsets.only(
                left: _screenWidth * 0.026,
                right: _screenWidth * 0.026,
                top: _screenWidth * 0.02),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  faqIcon,
                  height: _screenHeight * 0.055,
                ),
                SizedBox(
                  height: _screenHeight * 0.01,
                ),
                text("Can’t find your question?",
                    fontSize: _screenHeight * .017,
                    textColor: appTextColorPrimary),
                SizedBox(
                  height: _screenHeight * 0.02,
                ),
                text(
                    "Contact us at question@dangote.com for any queries and enquires.",
                    isCentered: true,
                    fontSize: _screenHeight * .017,
                    isLongText: true,
                    textColor: appTextColorPrimary),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
