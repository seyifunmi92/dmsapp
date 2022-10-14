import 'dart:async';
import 'dart:convert';

import 'package:dms/blocs/country_bloc.dart';
import 'package:dms/blocs/login_bloc.dart';
import 'package:dms/layout/appWidget.dart';
import 'package:dms/layout/company_picker.dart';
import 'package:dms/layout/country_picker.dart';
import 'package:dms/screens/auth/confirm_otp.dart';
import 'package:dms/screens/auth/new_distributor_notice.dart';
import 'package:dms/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../../blocs/company_bloc.dart';
import '../../network/network_utils.dart';
import '../../utils/animate_controller.dart';
import '../../utils/next_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var formKey = GlobalKey<FormState>();
  var sapIDCont = TextEditingController();
  var sapIDNode = FocusNode();
  String selectedCountryCode = "";
  String selectedCompanyCode = "";
  bool isLoading = false;


  @override
  void initState() {
    final CountryBloc cb = context.read<CountryBloc>();
    selectedCountryCode = cb.CountryId!;
    final CompanyBloc cob = context.read<CompanyBloc>();
    selectedCompanyCode = cob.CompanyId;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    final _screenHeight = MediaQuery.of(context).size.height;

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
                  height: _screenHeight * 0.026,
                ),
                Text(
                  "Register",
                  style: GoogleFonts.poppins(
                    color: appColorPrimary,
                    fontWeight: FontWeight.w600,
                    fontSize: _screenHeight * .0284,
                  ),
                ),
                SizedBox(
                  height: _screenHeight * 0.0166,
                ),
                Text(
                  "Kindly select your company and enter SAP ID to\nregister your account.",
                  style: GoogleFonts.poppins(
                    color: Color.fromRGBO(141, 147, 161, 1),
                    fontWeight: FontWeight.w400,
                    fontSize: _screenHeight * .014,
                  ),
                ),

                //fontSize: 13.0,
                // textColor: appTextColorSecondary)

                SizedBox(
                  height: _screenHeight * 0.026,
                ),
                Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          nextScreenPopup(context, CountryPicker());
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => CountryPicker()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: inputBackgroundColor,
                              border: Border.all(
                                  color: inputBorderColor,
                                  width: 1,
                                  style: BorderStyle.solid)),
                          height: _screenHeight * .0628,
                          width: _screenWidth * 0.86,
                          padding:
                              EdgeInsets.symmetric(horizontal: 14, vertical: 13),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                            Provider.of<CountryBloc>(
                                context)
                                .Country
                                .toString(),
                                  style: GoogleFonts.poppins(
                                      color: Color(0xffB1BBC6),
                                      fontWeight: FontWeight.w400,
                                      // fontFamily: fontRegular,
                                      fontSize: _screenHeight * .015),
                                  textAlign: TextAlign.start,
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  color: iconColorSecondary,
                                  size: _screenHeight * .027,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: _screenHeight * 0.026,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CompanyPicker()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: inputBackgroundColor,
                              border: Border.all(
                                  color: inputBorderColor,
                                  width: 1,
                                  style: BorderStyle.solid)),
                          height: _screenHeight * .0628,
                          width: _screenWidth * 0.86,
                          padding:
                              EdgeInsets.symmetric(horizontal: 14, vertical: 13),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                Provider.of<CompanyBloc>(
                                    context)
                                    .Company
                                    .toString(),
                                style: GoogleFonts.poppins(
                                    color: Color(0xffB1BBC6),
                                    fontWeight: FontWeight.w400,
                                    // fontFamily: fontRegular,
                                    fontSize: _screenHeight * .015),
                                textAlign: TextAlign.start,
                              ),
                              Icon(
                                Icons.keyboard_arrow_down,
                                color: iconColorSecondary,
                                size: _screenHeight * .027,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: _screenHeight * 0.026,
                      ),
                      Container(
                        width: _screenWidth * .85,
                        height: _screenHeight * .066,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: TextFormField(
                          controller: sapIDCont,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            fillColor: inputBackgroundColor,
                            focusColor: inputBorderColor,
                            hintText: "Enter SAP ID",
                            hintStyle: GoogleFonts.poppins(
                                color: iconColorSecondary,
                                fontSize: _screenHeight * .015),
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: inputBorderColor, width: 0.5)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: iconColorSecondary,
                                    style: BorderStyle.solid,
                                    width: 0)),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          autofocus: false,
                          textCapitalization: TextCapitalization.words,
                          validator: (s) {
                            if (s!.isEmpty) return 'SAP ID is required';
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: _screenHeight * 0.326,
                      ),
                      // Align(
                      //   alignment: Alignment.bottomCenter,
                      //   child: Container(
                      //     width: double.infinity,
                      //     height: 55.0,
                      //     margin: const EdgeInsetsDirectional.fromSTEB(
                      //         10.0, 0.0, 10.0, 10.0),
                      //     child: ElevatedButton(
                      //       onPressed: () async {
                      //         // Navigator.push(
                      //         //     context,
                      //         //     MaterialPageRoute(
                      //         //         builder: (context) => ConfirmOtp()));
                      //         finish(context);
                      //         Navigator.of(context).pushAndRemoveUntil(
                      //             MaterialPageRoute(
                      //                 builder: (context) => ConfirmOtp()),
                      //             (Route<dynamic> route) => false);
                      //       },
                      //       style: ElevatedButton.styleFrom(
                      //         padding: const EdgeInsets.all(0),
                      //         textStyle: const TextStyle(
                      //           color: Colors.white,
                      //         ),
                      //         primary: appColorPrimary, // background
                      //         shape: RoundedRectangleBorder(
                      //             borderRadius: BorderRadius.circular(3.0)),
                      //       ),
                      //       child: const Text("Confirm"),
                      //     ),
                      //   ),
                      // ),
                      Center(
                        child: Container(
                          height: _screenHeight * .0633,
                          width: _screenWidth * .965,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                            color: appColorPrimary,
                          ),
                          child: InkWell(
                              onTap: () async {
                                register();
                              },
                              child: Center(
                                child: Text(
                                  "Confirm",
                                  style: GoogleFonts.poppins(
                                    color: appWhite,
                                    fontWeight: FontWeight.w500,
                                    fontSize: _screenHeight * .017,
                                    //fontSize: _width * .0376,
                                  ),
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
        bottomNavigationBar: SafeArea(
          child: Container(
            width: double.infinity,
            height: _screenHeight * .07,
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(color: Colors.black.withOpacity(0.13)))),
            child: Padding(
              padding: EdgeInsets.only(
                  top: _screenHeight * 0.001, left: _screenWidth * .07),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Not an existing Distributor?",
                    style: GoogleFonts.poppins(
                      fontSize: _screenHeight * .015,
                      color: appColorPrimary,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewDistributorNotify()));
                    },
                    child: Text(
                      " Click here",
                      style: GoogleFonts.poppins(
                        fontSize: _screenHeight * .015,
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

  register() async {
    hideKeyboard(context);
    if (formKey.currentState!.validate()) {
      final CountryBloc cb = context.read<CountryBloc>();
      selectedCountryCode = cb.CountryId!;
      final CompanyBloc cob = context.read<CompanyBloc>();
      selectedCompanyCode = cob.CompanyId;
      if(selectedCompanyCode == "" || selectedCountryCode == ""){
        return toast("Select Country & Company to proceed");
      }
      isLoading = true;
      setState(() {});

      final LogInBloc lb = Provider.of<LogInBloc>(context, listen: false);
      Map req = {"distributorNumber": sapIDCont.text, "countryCode": selectedCountryCode, "channelCode": "Mobile", "deviceId": lb.deviceID, "companyCode": selectedCompanyCode};

      await postRequest('/register', req).then((value) {
        print(value);
        if (value.statusCode.isSuccessful()) {
          var data = jsonDecode(value.body);
          print(data);
          lb.saveOtpId((data['data']['otp']['otpDisplayId']).toString()).then((value) => {print("otp saved $value")});
          toast(data['message'], length: Toast.LENGTH_LONG);
          setState(() {
            isLoading = false;
          });
          nextScreenCloseOthers(context, ConfirmOtp());
        } else {
          if (value.body.isJson()) {
            var data = jsonDecode(value.body);
            print("Omo Error $data");
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
