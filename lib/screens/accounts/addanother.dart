import 'package:dms/constant.dart';
import 'package:dms/layout/appWidget.dart';
import 'package:dms/screens/accounts/confirmotp.dart';
import 'package:dms/screens/auth/confirm_otp.dart';
import 'package:dms/screens/auth/new_distributor_notice.dart';
import 'package:dms/screens/auth/register_screen_contd.dart';
import 'package:dms/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddAnother extends StatefulWidget {
  const AddAnother({Key? key}) : super(key: key);

  @override
  _AddAnotherState createState() => _AddAnotherState();
}

class _AddAnotherState extends State<AddAnother> {
  var formKey = GlobalKey<FormState>();
  var sapIDCont = TextEditingController();
  var sapIDNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    final _screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: dmsAppBar(context, '', showBack: true),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.only(
              left: _screenWidth * 0.07, right: _screenWidth * 0.07),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: _screenHeight * 0.01,
              ),
              Text(
                "Add Another Account",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: _screenHeight * .0284,
                  color: appColorPrimary,
                  letterSpacing: .02,
                ),
              ),
              SizedBox(
                height: _screenHeight * 0.018,
              ),
              Text(
                "Kindly select your company and enter SAP ID to\nregister your account.",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: _screenHeight * .0142,
                  color: Color(0xff8d93a1),
                  letterSpacing: .02,
                ),
                //fontSize: 13.0,
                //textColor: appTextColorSecondary
              ),
              SizedBox(
                height: _screenHeight * 0.02,
              ),
              Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            color: inputBackgroundColor,
                            border: Border.all(
                                color: inputBorderColor,
                                width: 1,
                                style: BorderStyle.solid)),
                        height: _screenHeight * .06,
                        width: _screenWidth * 0.90,
                        padding:
                            EdgeInsets.symmetric(horizontal: 14, vertical: 13),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Select Country",
                              style: GoogleFonts.poppins(
                                  color: Color(0xffb1bbc6),
                                  fontWeight: FontWeight.w400,
                                  //fontFamily: fontRegular,
                                  fontSize: _screenHeight * .017),
                              textAlign: TextAlign.start,
                            ),
                            Icon(
                              Icons.arrow_drop_down_outlined,
                              color: iconColorSecondary,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: _screenHeight * 0.03,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            color: inputBackgroundColor,
                            border: Border.all(
                                color: inputBorderColor,
                                width: 1,
                                style: BorderStyle.solid)),
                        height: _screenHeight * .06,
                        width: _screenWidth * 0.90,
                        padding:
                            EdgeInsets.symmetric(horizontal: 14, vertical: 13),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Select Company",
                              style: GoogleFonts.poppins(
                                  color: Color(0xffb1bbc6),
                                  fontWeight: FontWeight.w400,
                                  //fontFamily: fontRegular,
                                  fontSize: _screenHeight * .017),
                              textAlign: TextAlign.start,
                            ),
                            Icon(
                              Icons.arrow_drop_down,
                              color: iconColorSecondary,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: _screenHeight * 0.03,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            color: inputBackgroundColor,
                            border: Border.all(
                                color: inputBorderColor,
                                width: 1,
                                style: BorderStyle.solid)),
                        height: _screenHeight * .06,
                        width: _screenWidth * 0.90,
                        padding:
                            EdgeInsets.symmetric(horizontal: 14, vertical: 13),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Enter SAP ID",
                              style: GoogleFonts.poppins(
                                  color: Color(0xffb1bbc6),
                                  fontWeight: FontWeight.w400,
                                  //fontFamily: fontRegular,
                                  fontSize: _screenHeight * .017),
                              textAlign: TextAlign.start,
                            ),
                            // Icon(
                            //   Icons.arrow_drop_down,
                            //   color: iconColorSecondary,
                            // ),
                          ],
                        ),
                      ),
                    ),
                    // TextFormField(
                    //   keyboardType: TextInputType.text,
                    //   autofocus: false,
                    //   controller: sapIDCont,
                    //   textCapitalization: TextCapitalization.words,
                    //   style: TextStyle(
                    //       color: appColorPrimary,
                    //       fontFamily: fontRegular,
                    //       fontSize: textSizeMedium),
                    //   decoration: InputDecoration(
                    //       filled: true,
                    //       fillColor: inputBackgroundColor,
                    //       focusColor: inputBorderColor,
                    //       hintText: "Enter SAP ID",
                    //       hintStyle: TextStyle(
                    //           color: iconColorSecondary,
                    //           fontFamily: fontRegular,
                    //           fontSize: textSizeMedium),
                    //       contentPadding:
                    //           EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    //       focusedBorder: OutlineInputBorder(
                    //           borderSide: BorderSide(
                    //               color: inputBorderColor, width: 0.5)),
                    //       enabledBorder: OutlineInputBorder(
                    //           borderSide: BorderSide(
                    //               color: iconColorSecondary,
                    //               style: BorderStyle.solid,
                    //               width: 0))),
                    //   textInputAction: TextInputAction.next,
                    //   focusNode: sapIDNode,
                    //   validator: (s) {
                    //     if (s!.isEmpty) return 'Field is required';
                    //     return null;
                    //   },
                    // ),
                    SizedBox(
                      height: _screenHeight * 0.39,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ConfirmOTP()));
                      },
                      child: Container(
                        width: _screenWidth * .85,
                        height: _screenHeight * .063,
                        color: appColorPrimary,
                        child: Center(
                            child: Text(
                          "Confirm",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            color: appWhite,
                            letterSpacing: 0.02,
                            fontSize: _screenHeight * .0174,
                          ),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
