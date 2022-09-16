import 'dart:convert';

import 'package:dms/blocs/login_bloc.dart';
import 'package:dms/layout/appWidget.dart';
import 'package:dms/network/network_utils.dart';
import 'package:dms/screens/auth/login_screen.dart';
import 'package:dms/screens/success_failure_screen/success.dart';
import 'package:dms/utils/colors.dart';
import 'package:dms/utils/next_screen.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../../utils/animate_controller.dart';

class RegisterScreenContd extends StatefulWidget {
  const RegisterScreenContd({Key? key}) : super(key: key);

  @override
  State<RegisterScreenContd> createState() => _RegisterScreenContdState();
}

class _RegisterScreenContdState extends State<RegisterScreenContd> {
  var formKey = GlobalKey<FormState>();
  var usernameCont = TextEditingController();
  var passwordCont = TextEditingController();
  var confirmPasswordCont = TextEditingController();
  var usernameNode = FocusNode();
  var passwordNode = FocusNode();
  var confirmPasswordNode = FocusNode();
  bool _isObscure = true;
  bool _isObscure2 = true;
  var userNameCont = TextEditingController();
  bool passwordVisible = true;
  bool emailErrShow = false;
  bool passErrShow = false;
  int closeCounter = 0;
  String registrationID = "";
  bool isLoading = false;


  @override
  void initState() {
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
            child: Form(
              key: formKey,
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
                      fontSize: _screenHeight * .03,
                    ),
                  ),
                  //text("Register", isBoldText: true, fontSize: 28.0),

                  SizedBox(
                    height: _screenHeight * 0.0166,
                  ),

                  Text(
                    "Enter preferred Username & Password",
                    style: GoogleFonts.poppins(
                      color: Color(0xff8D93A1),
                      fontWeight: FontWeight.w400,
                      fontSize: _screenHeight * .015,
                    ),
                  ),
                  SizedBox(
                    height: _screenHeight * 0.0296,
                  ),
                  Container(
                    width: _screenWidth * .85,
                    height: _screenHeight * .066,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: TextFormField(
                      controller: userNameCont,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        fillColor: inputBackgroundColor,
                        focusColor: inputBorderColor,
                        hintText: "Enter Username",
                        hintStyle: GoogleFonts.poppins(
                            color: iconColorSecondary,
                            fontSize: _screenHeight * .0174),
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: inputBorderColor, width: 0.5)),
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
                      onFieldSubmitted: (s) =>
                          FocusScope.of(context).requestFocus(passwordNode),
                      validator: (s) {
                        if (s!.isEmpty) return 'Username is required';
                        return null;
                      },
                      focusNode: usernameNode,
                    ),
                  ),
                  SizedBox(
                    height: _screenHeight * 0.0296,
                  ),
                  Container(
                    width: _screenWidth * .85,
                    height: _screenHeight * .066,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: TextFormField(
                      obscureText: _isObscure,
                      controller: passwordCont,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObscure
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: Color.fromRGBO(196, 196, 196, 1),
                            size: _screenHeight * .0248,
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        ),
                        border: InputBorder.none,
                        filled: true,
                        fillColor: inputBackgroundColor,
                        focusColor: inputBorderColor,
                        hintText: "Enter Password",
                        hintStyle: GoogleFonts.poppins(
                            color: iconColorSecondary,
                            fontSize: _screenHeight * .0174),
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: inputBorderColor, width: 0.5)),
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
                      onFieldSubmitted: (s) =>
                          FocusScope.of(context).requestFocus(confirmPasswordNode),
                      focusNode: passwordNode,
                      validator: (s) {
                        if (s!.isEmpty) return 'Password is required';
                        else if (s.length < 8) return 'Use atleast 8 characters, including a number, an uppercase and a lowercase';
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: _screenHeight * 0.0296,
                  ),
                  Container(
                    width: _screenWidth * .85,
                    height: _screenHeight * .066,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: TextFormField(
                      obscureText: _isObscure,
                      controller: confirmPasswordCont,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObscure
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: Color.fromRGBO(196, 196, 196, 1),
                            size: _screenHeight * .02,
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        ),
                        border: InputBorder.none,
                        filled: true,
                        fillColor: inputBackgroundColor,
                        focusColor: inputBorderColor,
                        hintText: "Confirm Password",
                        hintStyle: GoogleFonts.poppins(
                            color: iconColorSecondary,
                            fontSize: _screenHeight * .0174),
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: inputBorderColor, width: 0.5)),
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
                      focusNode: confirmPasswordNode,
                      validator: (s) {
                        if (s!.isEmpty) return 'Confirm Password';
                        return null;
                      },
                    ),
                  ),

                  SizedBox(
                    height: _screenHeight * .02,
                  ),
                  Text(
                    "Kindly Upload a photo (Optional)",
                    style: GoogleFonts.poppins(
                      color: Color(0xff8D93A1),
                      fontWeight: FontWeight.w400,
                      fontSize: _screenHeight * .015,
                    ),
                  ),
                  SizedBox(
                    height: _screenHeight * .02,
                  ),

                  InkWell(
                      onTap: () {},
                      child: DottedBorder(
                        // strokeWidth: 1,
                        color: Color(0xffCDCFD2),
                        child: Container(
                          width: _screenWidth,
                          height: _screenHeight * .089,
                          child: Center(
                            child: Column(
                              //crossAxisAlignment: CrossAxisAlignment.,
                              children: [
                                SizedBox(
                                  height: _screenHeight * .02,
                                ),
                                Image.asset(
                                  "lib/assets/upload.png",
                                  height: _screenHeight * .0247,
                                ),
                                // Icon(Icons.upload_file),
                                Text(
                                  "Browse File",
                                  style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.w400,
                                    fontSize: _screenHeight * .013,
                                    color: Color(0xffB6BBC3),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // decoration: BoxDecoration(
                          //   border: Border.all(color: Colors.black),
                          // ),
                        ),
                      )
                    //  Container(
                    //   width: _screenWidth,
                    //   height: _screenHeight * .089,
                    //   child: Center(
                    //     child: Text("Browse File"),
                    //   ),
                    //   decoration: BoxDecoration(
                    //     border: Border.all(color: Colors.black),
                    //   ),
                    // ),
                  ),

                  // Form(
                  //   key: formKey,
                  //   autovalidateMode: AutovalidateMode.onUserInteraction,
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: <Widget>[
                  //       TextFormField(
                  //         keyboardType: TextInputType.text,
                  //         autofocus: true,
                  //         controller: usernameCont,
                  //         textCapitalization: TextCapitalization.words,
                  //         style: TextStyle(
                  //             color: appColorPrimary,
                  //             fontFamily: fontRegular,
                  //             fontSize: textSizeMedium),
                  //         decoration: InputDecoration(
                  //             filled: true,
                  //             fillColor: inputBackgroundColor,
                  //             focusColor: inputBorderColor,
                  //             hintText: "Enter Username",
                  //             hintStyle: TextStyle(
                  //                 color: iconColorSecondary,
                  //                 fontFamily: fontRegular,
                  //                 fontSize: textSizeMedium),
                  //             contentPadding:
                  //                 EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  //             focusedBorder: OutlineInputBorder(
                  //                 borderSide: BorderSide(
                  //                     color: inputBorderColor, width: 0.5)),
                  //             enabledBorder: OutlineInputBorder(
                  //                 borderSide: BorderSide(
                  //                     color: iconColorSecondary,
                  //                     style: BorderStyle.solid,
                  //                     width: 0))),
                  //         onFieldSubmitted: (s) =>
                  //             FocusScope.of(context).requestFocus(passwordNode),
                  //         textInputAction: TextInputAction.next,
                  //         focusNode: usernameNode,
                  //         validator: (s) {
                  //           if (s!.isEmpty) return 'Field is required';
                  //           return null;
                  //         },
                  //       ),
                  //       SizedBox(
                  //         height: _screenHeight * 0.03,
                  //       ),
                  //       TextFormField(
                  //         keyboardType: TextInputType.text,
                  //         autofocus: false,
                  //         obscureText: _isObscure,
                  //         style: TextStyle(
                  //             color: appColorPrimary,
                  //             fontFamily: fontRegular,
                  //             fontSize: textSizeMedium),
                  //         controller: passwordCont,
                  //         textCapitalization: TextCapitalization.words,
                  //         decoration: InputDecoration(
                  //             suffixIcon: IconButton(
                  //               icon: Icon(
                  //                 _isObscure
                  //                     ? Icons.visibility
                  //                     : Icons.visibility_off,
                  //               ),
                  //               onPressed: () {
                  //                 setState(() {
                  //                   _isObscure = !_isObscure;
                  //                 });
                  //               },
                  //             ),
                  //             hoverColor: appColorPrimary,
                  //             filled: true,
                  //             fillColor: inputBackgroundColor,
                  //             focusColor: inputBorderColor,
                  //             hintStyle: TextStyle(
                  //                 color: iconColorSecondary,
                  //                 fontFamily: fontRegular,
                  //                 fontSize: textSizeMedium),
                  //             hintText: "Enter Password",
                  //             contentPadding:
                  //                 EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  //             focusedBorder: OutlineInputBorder(
                  //                 borderSide: BorderSide(
                  //                     color: inputBorderColor, width: 0.5)),
                  //             enabledBorder: OutlineInputBorder(
                  //                 borderSide: BorderSide(
                  //                     color: appShadowColor,
                  //                     style: BorderStyle.solid,
                  //                     width: 0))),
                  //         onFieldSubmitted: (s) => FocusScope.of(context)
                  //             .requestFocus(confirmPasswordNode),
                  //         textInputAction: TextInputAction.next,
                  //         focusNode: passwordNode,
                  //         validator: (s) {
                  //           if (s!.isEmpty) return 'Field is required';
                  //           return null;
                  //         },
                  //       ),
                  //       SizedBox(
                  //         height: _screenHeight * 0.03,
                  //       ),
                  //       TextFormField(
                  //         keyboardType: TextInputType.text,
                  //         autofocus: false,
                  //         obscureText: _isObscure2,
                  //         style: TextStyle(
                  //             color: appColorPrimary,
                  //             fontFamily: fontRegular,
                  //             fontSize: textSizeMedium),
                  //         controller: passwordCont,
                  //         textCapitalization: TextCapitalization.words,
                  //         decoration: InputDecoration(
                  //             suffixIcon: IconButton(
                  //               icon: Icon(
                  //                 _isObscure2
                  //                     ? Icons.visibility
                  //                     : Icons.visibility_off,
                  //               ),
                  //               onPressed: () {
                  //                 setState(() {
                  //                   _isObscure2 = !_isObscure2;
                  //                 });
                  //               },
                  //             ),
                  //             hoverColor: appColorPrimary,
                  //             filled: true,
                  //             fillColor: inputBackgroundColor,
                  //             focusColor: inputBorderColor,
                  //             hintStyle: TextStyle(
                  //                 color: iconColorSecondary,
                  //                 fontFamily: fontRegular,
                  //                 fontSize: textSizeMedium),
                  //             hintText: "Confirm Password",
                  //             contentPadding:
                  //                 EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  //             focusedBorder: OutlineInputBorder(
                  //                 borderSide: BorderSide(
                  //                     color: inputBorderColor, width: 0.5)),
                  //             enabledBorder: OutlineInputBorder(
                  //                 borderSide: BorderSide(
                  //                     color: appShadowColor,
                  //                     style: BorderStyle.solid,
                  //                     width: 0))),
                  //         textInputAction: TextInputAction.next,
                  //         focusNode: confirmPasswordNode,
                  //         validator: (s) {
                  //           if (s!.isEmpty) return 'Field is required';
                  //           return null;
                  //         },
                  //       ),
                  //       SizedBox(
                  //         height: _screenHeight * 0.25,
                  //       ),
                  //       Align(
                  //         alignment: Alignment.bottomCenter,
                  //         child: Container(
                  //           width: double.infinity,
                  //           height: 55.0,
                  //           margin: const EdgeInsetsDirectional.fromSTEB(
                  //               10.0, 0.0, 10.0, 10.0),
                  //           child: ElevatedButton(
                  //             onPressed: () async {
                  //    Navigator.push(
                  //       context,
                  //        MaterialPageRoute(
                  //            builder: (context) => SuccessScreen()));

                  //   finish(context);
                  //   Navigator.of(context).pushAndRemoveUntil(
                  //       MaterialPageRoute(
                  //           builder: (context) => SuccessScreen()),
                  //       (Route<dynamic> route) => false);
                  //  },
                  //             style: ElevatedButton.styleFrom(
                  //               padding: const EdgeInsets.all(0),
                  //               textStyle: const TextStyle(
                  //                 color: Colors.white,
                  //               ),
                  //               primary: appColorPrimary, // background
                  //               shape: RoundedRectangleBorder(
                  //                   borderRadius: BorderRadius.circular(3.0)),
                  //             ),
                  //             child: const Text("Confirm"),
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  SizedBox(
                    height: _screenHeight * .16,
                  ),
                  Center(
                    child: Container(
                      height: _screenHeight * .0633,
                      width: _screenWidth * .965,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        color: appColorPrimary,
                      ),
                      child: InkWell(
                          onTap: () {
                            finishRegister();
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
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Container(
            width: double.infinity,
            height: _screenHeight * .07,
            // margin: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 10.0, 0.0),
            // decoration: BoxDecoration(
            //   border:
            // ),
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
                    "Have an account?",
                    style: GoogleFonts.poppins(
                      fontSize: _screenHeight * .015,
                      color: appColorPrimary,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginScreen()));
                    },
                    child: Text(
                      " Login",
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

  // void finishRegister() {
  //   nextScreenCloseOthers(context, SuccessScreen())
  // }

  finishRegister() async {
    hideKeyboard(context);
    if (formKey.currentState!.validate()) {
      final LogInBloc lb2 = context.read<LogInBloc>();
      registrationID = lb2.registrationID!;
      isLoading = true;
      setState(() {});

      Map req = {"registrationId": registrationID, "userName": userNameCont.text, "password": passwordCont.text};

      await postRequest('/register/complete', req).then((value) {
        print(value);
        if (value.statusCode.isSuccessful()) {
          var data = jsonDecode(value.body);
          print(data);
          toast(data['message'], length: Toast.LENGTH_LONG);
          setState(() {
            isLoading = false;
          });

          nextScreenCloseOthers(context, SuccessScreen());

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
