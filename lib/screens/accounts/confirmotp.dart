import 'dart:async';
import 'dart:convert';

import 'package:dms/layout/appWidget.dart';
import 'package:dms/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../network/network_utils.dart';
import '../../utils/next_screen.dart';
import 'accountsuccess.dart';

class ConfirmOTP extends StatefulWidget {

  String otpDisplayId;
  int countDownInSeconds;

  ConfirmOTP({Key? key, required this.otpDisplayId, required this.countDownInSeconds}) : super(key: key);

  @override
  _ConfirmOTPState createState() => _ConfirmOTPState(otpDisplayId, countDownInSeconds);
}

class _ConfirmOTPState extends State<ConfirmOTP> {

  var formKey = GlobalKey<FormState>();
  var otpCont = TextEditingController();
  var otpNode = FocusNode();
  bool isLoading = false;
  bool isCounting = false;
  Timer? countdownTimer;
  String otpId = "";
  int countDownInSecond = 0;
  Duration myDuration = Duration(minutes: 5);

  _ConfirmOTPState(String otpDisplayId, int countDownInSeconds){
    this.otpId = otpDisplayId;
    this.countDownInSecond = countDownInSeconds;
  }

  @override
  void initState() {
    myDuration = Duration(seconds: countDownInSecond);
    startTimer();
    super.initState();
  }

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
    setState(() => myDuration = Duration(seconds: countDownInSecond));
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
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    var mypaddingr = SizedBox(width: _width * 0.07);

    String strDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));
    String sec = "s";

    return Scaffold(
      backgroundColor: appWhite,
      appBar: dmsAppBar(context, ""),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          //SizedBox(height: _height * .05),
          SizedBox(
            height: _height * .01,
          ),
          // mypaddingrh,
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
            height: _height * .0178,
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
            "$minutes:$seconds$sec",
            style: GoogleFonts.poppins(
              fontSize: _height * .0284,
              color: Color(0xffFF1414),
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: _height * .015,
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
            height: _height * .48,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: _width * 0.07),
            child: Row(children: [
              InkWell(
                onTap: () {
                  validateOTP();
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => RegSuccess()));
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
    );
  }

  void resendOTP() async {
    isLoading = true;
    setState(() {});
    Map req = {"otpDisplayId": otpId};

    await postRequestWithToken('/otp/resend', req).then((value) {
      if (value.statusCode.isSuccessful()) {
        var data = jsonDecode(value.body);
        toast(data['message']);
        resetTimer();
        startTimer();
        setState(() {
          isLoading = false;
        });
      } else {
        if (value.body.isJson()) {
          var data = jsonDecode(value.body);
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
      isLoading = true;
      setState(() {});

      Map req = {"otpDisplayId": otpId, "otpCode": otpCont.text};

      await postRequestWithToken('/sapaccount/otp/validate', req).then((value) {
        print(value);
        if (value.statusCode.isSuccessful()) {
          var data = jsonDecode(value.body);
          print(data);
          toast(data['message'], length: Toast.LENGTH_LONG);
          setState(() {
            isLoading = false;
          });
          nextScreenReplace(context, AccountSuccess());
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
      setState(() {});
    }
  }

}
