import 'dart:async';
import 'dart:convert';

import 'package:dms/blocs/login_bloc.dart';
import 'package:dms/constant.dart';
import 'package:dms/layout/appWidget.dart';
import 'package:dms/screens/auth/login_screen.dart';
import 'package:dms/screens/auth/password_reset/input_new_password.dart';
import 'package:dms/utils/colors.dart';
import 'package:dms/utils/next_screen.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../../../network/network_utils.dart';
import '../../../utils/animate_controller.dart';

class PwdResetConfirmOTP extends StatefulWidget {
  const PwdResetConfirmOTP({Key? key}) : super(key: key);

  @override
  State<PwdResetConfirmOTP> createState() => _PwdResetConfirmOTPState();
}

class _PwdResetConfirmOTPState extends State<PwdResetConfirmOTP> {
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
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    final _screenHeight = MediaQuery.of(context).size.height;

    String strDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));
    String sec = "s";

    return ModalProgressHUD(
      inAsyncCall: isLoading,
      progressIndicator: AnimateWidget(),
      child: Scaffold(
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
                  height: _screenHeight * 0.02,
                ),
                text("Confirm OTP", isBoldText: true, fontSize: 28.0),
                SizedBox(
                  height: _screenHeight * 0.02,
                ),
                text("Kindly enter OTP sent to your registered number",
                    fontSize: 13.0, textColor: appTextColorSecondary),
                SizedBox(
                  height: _screenHeight * 0.02,
                ),
                Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        keyboardType: TextInputType.text,
                        autofocus: false,
                        controller: otpCont,
                        textCapitalization: TextCapitalization.words,
                        style: TextStyle(
                            color: appColorPrimary,
                            fontFamily: fontRegular,
                            fontSize: textSizeMedium),
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: inputBackgroundColor,
                            focusColor: inputBorderColor,
                            hintText: "Enter OTP",
                            hintStyle: TextStyle(
                                color: iconColorSecondary,
                                fontFamily: fontRegular,
                                fontSize: textSizeMedium),
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
                      SizedBox(
                        height: _screenHeight * 0.02,
                      ),
                      text("$minutes:$seconds$sec",
                          isBoldText: true,
                          textColor: Colors.red,
                          fontFamily: fontBold,
                          fontSize: 28.0),
                      SizedBox(
                        height: _screenHeight * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Didnt Receive Code?",
                            style: TextStyle(
                                fontFamily: fontBold,
                                fontWeight: FontWeight.bold),
                          ),
                          GestureDetector(
                            onTap: () {
                              isCounting ? null : resendOTP();
                            },
                            child: Text(
                              "  Resend OTP",
                              style: TextStyle(
                                  color: isCounting ? Color(0xff8D93A1) : appColorPrimary,
                                  fontFamily: fontBold,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: _screenHeight * 0.33,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: double.infinity,
                          height: 55.0,
                          margin: const EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 10.0),
                          child: ElevatedButton(
                            onPressed: () async {
                              validateOTP();
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => InputNewPassword()));
                              // nextScreen(context, InputNewPassword());
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(0),
                              textStyle: const TextStyle(
                                color: Colors.white,
                              ),
                              primary: appColorPrimary, // background
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3.0)),
                            ),
                            child: const Text("Next"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        // bottomNavigationBar: SafeArea(
        //   child: Container(
        //     width: double.infinity,
        //     height: 70.0,
        //     margin: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 10.0, 0.0),
        //     // decoration: BoxDecoration(
        //     //   border:
        //     // ),
        //     decoration: BoxDecoration(
        //         border: Border(
        //             top: BorderSide(color: Colors.black.withOpacity(0.13)))),
        //     child: Padding(
        //       padding: EdgeInsets.only(top: _screenHeight * 0.008),
        //       child: Row(
        //         children: [
        //           Text("Have an account?"),
        //           GestureDetector(
        //             onTap: () {
        //               nextScreen(context, LoginScreen());
        //             },
        //             child: Text(
        //               " Login",
        //               style: TextStyle(
        //                   fontFamily: fontBold, fontWeight: FontWeight.bold),
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
      ),
    );
  }


  void resendOTP() async {
    final LogInBloc lb = context.read<LogInBloc>();
    otpID = lb.otpID!;
    isLoading = true;
    setState(() {});
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
      final LogInBloc lb2 = context.read<LogInBloc>();
      otpID = lb2.otpID!;
      isLoading = true;
      setState(() {});

      final LogInBloc lb = Provider.of<LogInBloc>(context, listen: false);

      Map req = {"otpDisplayId": otpID, "otpCode": otpCont.text};

      await postRequest('/reset/otp/validate', req).then((value) {
        print(value);
        if (value.statusCode.isSuccessful()) {
          var data = jsonDecode(value.body);
          print(data);
          lb.saveResetToken(data['data']['reset']['resetToken']);
          toast(data['message'], length: Toast.LENGTH_LONG);
          setState(() {
            isLoading = false;
          });

          nextScreenReplace(context, InputNewPassword());

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
