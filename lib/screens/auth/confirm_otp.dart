import 'dart:async';
import 'dart:convert';

import 'package:dms/blocs/login_bloc.dart';
import 'package:dms/constant.dart';
import 'package:dms/layout/appWidget.dart';
import 'package:dms/screens/auth/login_screen.dart';
import 'package:dms/screens/auth/register_screen_contd.dart';
import 'package:dms/utils/animate_controller.dart';
import 'package:dms/utils/colors.dart';
import 'package:dms/utils/next_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../../network/network_utils.dart';

class ConfirmOtp extends StatefulWidget {
  const ConfirmOtp({Key? key}) : super(key: key);

  @override
  State<ConfirmOtp> createState() => _ConfirmOtpState();
}

class _ConfirmOtpState extends State<ConfirmOtp> {
  var formKey = GlobalKey<FormState>();
  var otpCont = TextEditingController();
  var otpNode = FocusNode();
  bool isLoading = false;
  bool isCounting = false;
  String otpID = "";
  Timer? countdownTimer;
  Duration myDuration = Duration(minutes: 5);

  void startTimer() {
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
    isCounting = true;
  }
  // Step 4
  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }
  // Step 5
  void resetTimer() {
    stopTimer();
    setState(() => myDuration = Duration(minutes: 5));
  }
  // Step 6
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
    // final LogInBloc lb = context.read<LogInBloc>();
    // otpID = lb.otpID!;
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));
    String sec = "s";

    var mypaddingr = SizedBox(width: _width * 0.07);

    return ModalProgressHUD(
      inAsyncCall: isLoading,
      progressIndicator: AnimateWidget(),
      child: Scaffold(
        appBar: dmsAppBar(context, '', showBack: true),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            SizedBox(
              height: _height * .031,
            ),
            Row(
              children: [
                mypaddingr,
                Text(
                  "Confirm OTP",
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
                  "Kindly enter OTP sent to your\nOlixxxxxx@gmail.com and xxxxxxx7893",
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
                    controller: otpCont,
                    textCapitalization: TextCapitalization.words,
                    style: TextStyle(
                        color: appColorPrimary,
                      fontSize: _height * .017,),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: inputBackgroundColor,
                        focusColor: inputBorderColor,
                        hintText: "Enter OTP",
                        hintStyle: TextStyle(
                            color: iconColorSecondary,
                            fontFamily: fontRegular,
                            fontWeight: FontWeight.w400,
                            fontSize: _height * .017),
                        contentPadding:
                        EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
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
              // Row(children: [
              //   Container(
              //     width: _width * .85,
              //     height: _height * .06,
              //     decoration: BoxDecoration(
              //       color: Colors.blueGrey[50],
              //       border: Border.all(
              //         color: Color(0xff7C95B1),
              //       ),
              //     ),
              //     child: Center(
              //         child: Row(
              //       children: [
              //         SizedBox(
              //           width: _width * .06,
              //         ),
              //         Text(
              //           "Enter OTP",
              //           style: GoogleFonts.poppins(
              //             fontSize: _height * .017,
              //             fontWeight: FontWeight.w400,
              //             color: Color(0xffB1BBC6),
              //           ),
              //         ),
              //       ],
              //     )),
              //   ),
              // ]),
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
                GestureDetector(
                  onTap: (){
                    isCounting ? null : resendOTP();
                  },
                  child: Text(
                    "Resend OTP",
                    style: GoogleFonts.poppins(
                      color: isCounting ? Color(0xff8D93A1) : appColorPrimary,
                      fontSize: _height * .019,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: _height * .4,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _width * 0.07),
              child: Row(children: [
                InkWell(
                  onTap: () {
                    validateOTP();
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

        bottomNavigationBar: SafeArea(
          child: Container(
            width: double.infinity,
            height: _height * .07,
            //margin: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 10.0, 0.0),
            // decoration: BoxDecoration(
            //   border:
            // ),
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(color: Colors.black.withOpacity(0.13)))),
            child: Padding(
              padding: EdgeInsets.only(
                  left: _width * 0.07, top: _height * .001),
              child: Row(
                children: [
                  Text(
                    "Have an account?",
                    style: GoogleFonts.poppins(
                      fontSize: _height * .015,
                      color: appColorPrimary,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      nextScreenPopup(context, LoginScreen());
                    },
                    child: Text(
                      " Login",
                      style: GoogleFonts.poppins(
                        fontSize: _height * .015,
                        color: appColorPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void resendOTP() async {
    isLoading = true;
    setState(() {});
    final LogInBloc lb = context.read<LogInBloc>();
    lb.getOtpIdToken();
    otpID = lb.otpID!;
    Map req = {"otpDisplayId": otpID};

    await postRequest('/otp/resend', req).then((value) {
      if (value.statusCode.isSuccessful()) {
        var data = jsonDecode(value.body);
        print(data);
        toast(data['message']);
        resetTimer();
        startTimer();
        setState(() {
          isLoading = false;
        });
      } else {
        if (value.body.isJson()) {
          var data = jsonDecode(value.body);
          print(data);
          toast(data['message']);
          setState(() {
            isLoading = false;
          });
        }
      }
    }).catchError((e) {
      isLoading = false;
      toast(e.toString());
      print(e.toString());
      setState(() {});
    });
  }



  validateOTP() async {
    hideKeyboard(context);
    if (formKey.currentState!.validate()) {
      final LogInBloc lb1 = context.read<LogInBloc>();
      otpID = lb1.otpID!;
      isLoading = true;
      setState(() {});

      final LogInBloc lb = Provider.of<LogInBloc>(context, listen: false);

      Map req = {"otpDisplayId": otpID, "otpCode": otpCont.text};

      await postRequest('/register/otp/validate', req).then((value) {
        print(value);
        if (value.statusCode.isSuccessful()) {
          var data = jsonDecode(value.body);
          print(data);
          lb.saveRegistrationID((data['data']['registration']['registrationId']).toString());
          toast(data['message'], length: Toast.LENGTH_LONG);
          setState(() {
            isLoading = false;
          });

          nextScreenReplace(context, RegisterScreenContd());

        } else {
          if (value.body.isJson()) {
            var data = jsonDecode(value.body);
            print(data);
            toast(data['message'], length: Toast.LENGTH_LONG);
            setState(() {
              isLoading = false;
            });
          }
        }
      }).catchError((e) {
        isLoading = false;
        toast("We are unable to complete your request at this time", length: Toast.LENGTH_LONG);
        print(e.toString());
        setState(() {});

      });
    } else {
      isLoading = false;
      // autoValidate = true;
      setState(() {});
    }
  }
}
