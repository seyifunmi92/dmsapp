import 'package:dms/constant.dart';
import 'package:dms/layout/appWidget.dart';
import 'package:dms/screens/carts/ordersuccess.dart';
import 'package:dms/screens/my_atc/atccancel.dart';
import 'package:dms/screens/my_atc/save_order_success.dart';
import 'package:dms/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VerifyyOTP extends StatefulWidget {
  const VerifyyOTP({Key? key}) : super(key: key);

  @override
  _VerifyyOTPState createState() => _VerifyyOTPState();
}

class _VerifyyOTPState extends State<VerifyyOTP> {
  var formKey = GlobalKey<FormState>();
  var otpCont = TextEditingController();
  var otpNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    var mypaddingr = SizedBox(width: _width * 0.07);
    return Scaffold(
      appBar: dmsAppBar(context, '', showBack: true),
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
            "00:15s",
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OrderPlacedSuccess()));
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
}
