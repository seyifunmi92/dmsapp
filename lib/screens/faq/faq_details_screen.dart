import 'package:dms/constant.dart';
import 'package:dms/layout/appWidget.dart';
import 'package:dms/utils/colors.dart';
import 'package:dms/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FAQDetailsScreen extends StatefulWidget {
  String question;
  String answer;
  FAQDetailsScreen(this.question, this.answer);

  @override
  State<FAQDetailsScreen> createState() => _FAQDetailsScreenState();
}

class _FAQDetailsScreenState extends State<FAQDetailsScreen> {
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
                widget.question,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: _screenHeight * .0284,
                  color: appColorPrimary,
                ),
              ),
              // child: text("How to disable your account", isLongText: true, isBoldText: true, fontSize: 28.0),
            ),
            SizedBox(
              height: _screenHeight * 0.018,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: _screenWidth * 0.04, right: _screenWidth * 0.04),
              child: Column(
                children: [
                  ListView.builder(
                      itemCount: 1,
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              // color: Colors.white70,
                              alignment: Alignment.center,
                              width: double.infinity,
                              height: _screenHeight * 0.172,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurStyle: BlurStyle.outer,
                                    blurRadius: 8,
                                    spreadRadius: 0,
                                    offset: Offset.zero,
                                  ),
                                ],
                                color: appWhite,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: ListTile(
                                  title: text(
                                    widget.answer,
                                    textColor: appTextColorPrimary,
                                    isLongText: true,
                                    fontSize: _screenHeight * .017,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: _screenHeight * 0.02,
                            ),
                          ],
                        );
                      }),
                ],
              ),
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
