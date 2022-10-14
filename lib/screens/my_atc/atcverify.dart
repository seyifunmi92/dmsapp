import 'dart:async';
import 'dart:convert';

import 'package:dms/constant.dart';
import 'package:dms/layout/appWidget.dart';
import 'package:dms/model/ordermodels.dart';
import 'package:dms/screens/my_atc/atccancel.dart';
import 'package:dms/screens/my_atc/save_order_success.dart';
import 'package:dms/services/orderservices.dart';
import 'package:dms/utils/animate_controller.dart';
import 'package:dms/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import 'atcsuccess.dart';

class ATCverify extends StatefulWidget {
  int otpId;
  ATCverify(this.otpId);

  @override
  _ATCverifyState createState() => _ATCverifyState();
}

class _ATCverifyState extends State<ATCverify> {
  bool activeButton = false;
  bool completeTxt = false;
  var formKey = GlobalKey<FormState>();
  TextEditingController otpController = TextEditingController();
  var otpNode = FocusNode();
  bool isLoading = false;
  bool isCounting = false;
  Timer? countdownTimer;
  Duration myDuration = Duration(minutes: 5);
  void startTimer() {
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
    isCounting = true;
  }

  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }

  void setCountDown() {
    final reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
        isCounting = false;
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  @override
  void initState() {
    print(widget.otpId);
    Provider.of<OrderBloc>(context, listen: false).isLoading = false;
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (otpController.text.length == 6) {
      activeButton = true;
    } else {
      activeButton = false;
    }
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    final _screenWidth = MediaQuery.of(context).size.width;
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));
    String sec = "s";
    var mypaddingr = SizedBox(width: _width * 0.07);
    return ModalProgressHUD(
      inAsyncCall: Provider.of<OrderBloc>(context, listen: false).isLoading,
      progressIndicator: AnimateWidget(),
      child: Scaffold(
        appBar: dmsAppBar(context, '', showBack: true),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            SizedBox(height: _height * .031),
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
              child: Form(
                key: formKey,
                child: Container(
                  width: _width * .85,
                  height: _height * .066,
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    autofocus: false,
                    controller: otpController,
                    textCapitalization: TextCapitalization.words,
                    style: TextStyle(
                      color: appColorPrimary,
                      fontSize: _height * .017,
                    ),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: inputBackgroundColor,
                        focusColor: inputBorderColor,
                        hintText: "OTP",
                        hintStyle: TextStyle(
                            color: iconColorSecondary,
                            fontFamily: fontRegular,
                            fontWeight: FontWeight.w400,
                            fontSize: _height * .017),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: _screenWidth * .35),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: inputBorderColor, width: 0.5)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: iconColorSecondary,
                                style: BorderStyle.solid,
                                width: 0))),
                    textInputAction: TextInputAction.next,
                    focusNode: otpNode,
                    validator: (s) {
                      if (s!.isEmpty) return 'OTP is required';
                      return null;
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: _height * .03,
            ),
            Text(
              "$minutes:$seconds$sec",
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
                InkWell(
                  onTap: () {
                    otpController.clear();
                    myresendOtp();
                  },
                  child: Text(
                    "Resend OTP",
                    style: GoogleFonts.poppins(
                      color: Color(0xff8D93A1),
                      fontSize: _height * .019,
                    ),
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
                    if (otpController.text.isNotEmpty && activeButton == true) {
                      setState(() {
                        Provider.of<OrderBloc>(context, listen: false)
                            .isLoading = true;
                      });
                      confirmOtp();
                    }
                  },
                  child: Container(
                    width: _width * .85,
                    height: _height * .06,
                    decoration: BoxDecoration(
                      color: activeButton ? appColorPrimary : Colors.grey,
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
      ),
    );
  }

  void confirmOtp() {
    Provider.of<OrderBloc>(context, listen: false)
        .validOtp(widget.otpId, otpController.text)
        .then((value) => otpOutput(value));
  }

  myresendOtp() {
    Provider.of<OrderBloc>(context, listen: false)
        .resendOtp(widget.otpId)
        .then((value) => output(value));
  }

  output(String reOtp) {
    print(reOtp);
    var result = jsonDecode(reOtp);
    if (result["status"] == "Successful") {
      setState(() {
        Provider.of<OrderBloc>(context, listen: false).isLoading = false;
      });
      toast(result["message"]);
      if (result == null) {
        toast("An Error Occured");
      }
    } else {
      setState(() {
        Provider.of<OrderBloc>(context, listen: false).isLoading = false;
      });
      toast(result["message"]);
    }
  }

  otpOutput(String otp) {
    var myOtp = jsonDecode(otp);
    if (myOtp["status"] == "Successful") {
      setState(() {
        otpController.clear();
        Provider.of<OrderBloc>(context, listen: false).isLoading = false;
      });
      Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ATCsuccess()));
    } else if (myOtp["message"] == "Error-O-14") {
      setState(() {
        otpController.clear();
        Provider.of<OrderBloc>(context, listen: false).isLoading = false;
      });
      print("wrong otp");
      toast(myOtp["statusCode"], length: Toast.LENGTH_LONG);
    } else if (myOtp["message"] == "Error-O-13") {
      setState(() {
        otpController.clear();
        Provider.of<OrderBloc>(context, listen: false).isLoading = false;
      });
      print("expired otp");
      toast(myOtp["statusCode"], length: Toast.LENGTH_LONG);
    } else {
      toast(myOtp["statusCode"]);
    }
  }
}
