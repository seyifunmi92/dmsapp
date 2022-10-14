import 'dart:convert';

import 'package:dms/constant.dart';
import 'package:dms/layout/appWidget.dart';
import 'package:dms/network/network_utils.dart';
import 'package:dms/screens/accounts/confirmotp.dart';
import 'package:dms/screens/auth/confirm_otp.dart';
import 'package:dms/screens/auth/new_distributor_notice.dart';
import 'package:dms/screens/auth/register_screen_contd.dart';
import 'package:dms/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../../blocs/company_bloc.dart';
import '../../blocs/country_bloc.dart';
import '../../layout/company_picker.dart';
import '../../layout/country_picker.dart';
import '../../utils/animate_controller.dart';
import '../../utils/next_screen.dart';

class AddAnother extends StatefulWidget {
  const AddAnother({Key? key}) : super(key: key);

  @override
  _AddAnotherState createState() => _AddAnotherState();
}

class _AddAnotherState extends State<AddAnother> {
  var formKey = GlobalKey<FormState>();
  var sapIDCont = TextEditingController();
  var sapIDNode = FocusNode();
  var renameCont = TextEditingController();
  bool isLoading = false;
  String selectedCountryCode = "";
  String selectedCompanyCode = "";

  @override
  void initState() {
    final CountryBloc cb = context.read<CountryBloc>();
    selectedCountryCode = cb.CountryId!;
    final CompanyBloc cob = context.read<CompanyBloc>();
    selectedCompanyCode = cob.CompanyId;
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
                        onTap: () {
                          nextScreenPopup(context, CountryPicker());
                        },
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
                                Provider.of<CountryBloc>(
                                    context)
                                    .Country
                                    .toString(),
                                style: GoogleFonts.poppins(
                                    color: Color(0xffb1bbc6),
                                    fontWeight: FontWeight.w400,
                                    //fontFamily: fontRegular,
                                    fontSize: _screenHeight * .017),
                                textAlign: TextAlign.start,
                              ),
                              Icon(
                                Icons.keyboard_arrow_down,
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
                        onTap: () {
                          nextScreenPopup(context, CompanyPicker());
                        },
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
                                Provider.of<CompanyBloc>(
                                    context)
                                    .Company
                                    .toString(),
                                style: GoogleFonts.poppins(
                                    color: Color(0xffb1bbc6),
                                    fontWeight: FontWeight.w400,
                                    //fontFamily: fontRegular,
                                    fontSize: _screenHeight * .017),
                                textAlign: TextAlign.start,
                              ),
                              Icon(
                                Icons.keyboard_arrow_down,
                                color: iconColorSecondary,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: _screenHeight * 0.03,
                      ),
                      Container(
                        width: _screenWidth * .85,
                        height: _screenHeight * .066,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          autofocus: false,
                          controller: sapIDCont,
                          textCapitalization: TextCapitalization.words,
                          style: TextStyle(
                              color: appColorPrimary,
                              fontFamily: fontRegular,
                              fontSize: textSizeMedium),
                          decoration: InputDecoration(
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
                                      width: 0))),
                          textInputAction: TextInputAction.next,
                          focusNode: sapIDNode,
                          validator: (s) {
                            if (s!.isEmpty) return 'Field is required';
                            return null;
                          },
                        ),
                      ),

                      SizedBox(
                        height: _screenHeight * 0.03,
                      ),

                      Container(
                        width: _screenWidth * .85,
                        height: _screenHeight * .066,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: TextFormField(
                          controller: renameCont,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            fillColor: inputBackgroundColor,
                            focusColor: inputBorderColor,
                            hintText: "Rename Account",
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
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          autofocus: false,
                          textCapitalization: TextCapitalization.words,
                          validator: (s) {
                            if (s!.isEmpty) return 'New name is required';
                            return null;
                          },
                        ),
                      ),

                      SizedBox(
                        height: _screenHeight * 0.32,
                      ),
                      InkWell(
                        onTap: () {
                          addAccount();
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => ConfirmOTP()));
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
      ),
    );
  }

  addAccount() async {
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

      Map req = {"distributorNumber": sapIDCont.text, "countryCode": selectedCountryCode, "companyCode": selectedCompanyCode, "friendlyName": renameCont.text};

      await postRequestWithToken('/sapaccount/link', req).then((value) {
        print(value);
        if (value.statusCode.isSuccessful()) {
          var data = jsonDecode(value.body);
          print(data);
          toast(data['message'], length: Toast.LENGTH_LONG);
          setState(() {
            isLoading = false;
          });
          var otpid = data['data']['otp']['otpDisplayId'];
          var countDown = data['data']['otp']['countDownInSeconds'];
          nextScreenCloseOthers(context, ConfirmOTP(otpDisplayId: otpid, countDownInSeconds: countDown,));
        } else {
          if (value.body.isJson()) {
            var data = jsonDecode(value.body);
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
