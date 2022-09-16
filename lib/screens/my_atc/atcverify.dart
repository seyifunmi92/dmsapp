import 'package:dms/constant.dart';
import 'package:dms/layout/appWidget.dart';
import 'package:dms/screens/my_atc/atccancel.dart';
import 'package:dms/screens/my_atc/save_order_success.dart';
import 'package:dms/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'atcsuccess.dart';

class ATCverify extends StatefulWidget {
  const ATCverify({Key? key}) : super(key: key);

  @override
  _ATCverifyState createState() => _ATCverifyState();
}

class _ATCverifyState extends State<ATCverify> {
  var formKey = GlobalKey<FormState>();
  var otpCont = TextEditingController();
  var otpNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    final _screenWidth = MediaQuery.of(context).size.width;
    final _screenHeight = MediaQuery.of(context).size.height;
    var mypaddingr = SizedBox(width: _width * 0.07);

    return Scaffold(
      appBar: dmsAppBar(context, '', showBack: true),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          //SizedBox(height: _height * .05),
          SizedBox(
            height: _height * .031,
          ),
          // mypaddingrh,
          Row(
            children: [
              mypaddingr,
              Text(
                "Verify Account",
                style: GoogleFonts.poppins(
                  fontSize: _height * .0284,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.02,
                  color: appColorPrimary,
                ),
              ),
            ],
          ),
          SizedBox(
            height: _height * .0178,
          ),
          Row(
            children: [
              mypaddingr,
              Text(
                "Kindly enter OTP sent to your registered number",
                style: GoogleFonts.poppins(
                  fontSize: _height * .0142,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.02,
                  color: Color(0xff8D93A1),
                ),
              ),
            ],
          ),
          SizedBox(
            height: _height * .0296,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: _width * 0.07),
            child: Row(children: [
              Container(
                width: _width * .85,
                height: _height * .06,
                decoration: BoxDecoration(
                  color: Colors.blueGrey[50],
                  border: Border.all(
                    color: Color(0xff7C95B1),
                  ),
                ),
                child: Center(
                    child: Row(
                  children: [
                    SizedBox(
                      width: _width * .06,
                    ),
                    Text(
                      "Enter OTP",
                      style: GoogleFonts.poppins(
                        fontSize: _height * .017,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffB1BBC6),
                      ),
                    ),
                    // SizedBox(
                    //   width: _width * .4,
                    // ),
                    // InkWell(
                    //   onTap: () {},
                    //   child: const Icon(
                    //     Icons.keyboard_arrow_down,
                    //     color: Color(0xff999999),
                    //   ),
                    // ),
                  ],
                )),
              ),
            ]),
          ),
          SizedBox(
            height: _height * .03,
          ),
          Text(
            "00:15s",
            style: GoogleFonts.poppins(
              fontSize: _height * .0284,
              color: Color(0xffFF1414),
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: _height * .019,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Didnt Receive Code?",
                style: GoogleFonts.poppins(
                  color: appColorPrimary,
                  fontSize: _height * .019,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                width: _width * .02,
              ),
              Text(
                "Resend OTP",
                style: GoogleFonts.poppins(
                  color: Color(0xffB2ACAC),
                  fontSize: _height * .019,
                ),
              ),
            ],
          ),
          SizedBox(
            height: _height * .48,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: _width * 0.07),
            child: Row(children: [
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ATCsuccess()));
                  //finish(context);
                  // Navigator.of(context).pushAndRemoveUntil(
                  //     MaterialPageRoute(builder: (context) => ATCsuccess()),
                  //     (Route<dynamic> route) => false);
                },
                child: Container(
                  width: _width * .85,
                  height: _height * .06,
                  decoration: BoxDecoration(
                    color: appColorPrimary,
                  ),
                  child: Center(
                    child: Text(
                      "Confirm",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: _height * .0174,
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ]),
      ),
      // body: SingleChildScrollView(
      //   scrollDirection: Axis.vertical,
      //   child: Padding(
      //     padding: EdgeInsets.only(
      //         left: _screenWidth * 0.07, right: _screenWidth * 0.07),
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         SizedBox(
      //           height: _screenHeight * 0.02,
      //         ),
      //         text("Verify Account", isBoldText: true, fontSize: 26.0),
      //         SizedBox(
      //           height: _screenHeight * 0.02,
      //         ),
      //         text("Kindly enter OTP sent to your registered number",
      //             fontSize: 13.0, textColor: appTextColorSecondary),
      //         SizedBox(
      //           height: _screenHeight * 0.02,
      //         ),
      //         Form(
      //           key: formKey,
      //           autovalidateMode: AutovalidateMode.onUserInteraction,
      //           child: Column(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: <Widget>[
      //               TextFormField(
      //                 keyboardType: TextInputType.text,
      //                 autofocus: false,
      //                 controller: otpCont,
      //                 textCapitalization: TextCapitalization.words,
      //                 style: TextStyle(
      //                     color: appColorPrimary,
      //                     fontFamily: fontRegular,
      //                     fontSize: textSizeMedium),
      //                 decoration: InputDecoration(
      //                     filled: true,
      //                     fillColor: inputBackgroundColor,
      //                     focusColor: inputBorderColor,
      //                     hintText: "Enter OTP",
      //                     hintStyle: TextStyle(
      //                         color: iconColorSecondary,
      //                         fontFamily: fontRegular,
      //                         fontSize: textSizeMedium),
      //                     contentPadding:
      //                         EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      //                     focusedBorder: OutlineInputBorder(
      //                         borderSide: BorderSide(
      //                             color: inputBorderColor, width: 0.5)),
      //                     enabledBorder: OutlineInputBorder(
      //                         borderSide: BorderSide(
      //                             color: iconColorSecondary,
      //                             style: BorderStyle.solid,
      //                             width: 0))),
      //                 textInputAction: TextInputAction.next,
      //                 focusNode: otpNode,
      //                 validator: (s) {
      //                   if (s!.isEmpty) return 'Field is required';
      //                   return null;
      //                 },
      //               ),
      //               SizedBox(
      //                 height: _screenHeight * 0.02,
      //               ),
      //               text("00:15s",
      //                   isBoldText: true,
      //                   textColor: Colors.red,
      //                   fontFamily: fontBold,
      //                   fontSize: 28.0),
      //               SizedBox(
      //                 height: _screenHeight * 0.02,
      //               ),
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: [
      //                   Text(
      //                     "Didnt Receive Code?",
      //                     style: TextStyle(
      //                         fontFamily: fontBold,
      //                         color: Color(0xff100C57),
      //                         fontWeight: FontWeight.bold),
      //                   ),
      //                   GestureDetector(
      //                     onTap: () {},
      //                     child: Text(
      //                       "  Resend OTP",
      //                       style: TextStyle(
      //                           color: iconColorSecondary,
      //                           fontFamily: fontBold,
      //                           fontWeight: FontWeight.bold),
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //               SizedBox(
      //                 height: _screenHeight * 0.38,
      //               ),
      //               Align(
      //                 alignment: Alignment.bottomCenter,
      //                 child: Container(
      //                   width: double.infinity,
      //                   height: 55.0,
      //                   margin: const EdgeInsetsDirectional.fromSTEB(
      //                       10.0, 0.0, 10.0, 10.0),
      //                   child: ElevatedButton(
      //                     onPressed: () async {
      //                       Navigator.push(
      //                           context,
      //                           MaterialPageRoute(
      //                               builder: (context) => ATCsuccess()));
      //                     },
      //                     style: ElevatedButton.styleFrom(
      //                       padding: const EdgeInsets.all(0),
      //                       textStyle: const TextStyle(
      //                         color: Colors.white,
      //                       ),
      //                       primary: appColorPrimary, // background
      //                       shape: RoundedRectangleBorder(
      //                           borderRadius: BorderRadius.circular(3.0)),
      //                     ),
      //                     child: const Text("Confirm"),
      //                   ),
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
