import 'dart:convert';

import 'package:dms/blocs/login_bloc.dart';
import 'package:dms/constant.dart';
import 'package:dms/layout/appWidget.dart';
import 'package:dms/network/network_utils.dart';
import 'package:dms/screens/auth/password_reset/password_reset_request.dart';
import 'package:dms/screens/auth/register_screen.dart';
import 'package:dms/screens/dashboard/dashboard.dart';
import 'package:dms/screens/home_screen.dart';
import 'package:dms/screens/onboarding/newonboard.dart';
import 'package:dms/screens/onboarding/onboarding1.dart';
import 'package:dms/services/api_services.dart';
import 'package:dms/utils/colors.dart';
import 'package:dms/utils/next_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../../utils/animate_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();
  var userNameCont = TextEditingController();
  var passwordCont = TextEditingController();
  var usernameNode = FocusNode();
  var passwordNode = FocusNode();
  bool _isObscure = true;
  bool passwordVisible = true;
  bool emailErrShow = false;
  bool passErrShow = false;
  int closeCounter = 0;
  bool isLoading = false;
  String deviceID = "";
  String ipAddress = "";

  loginIn() async {
    hideKeyboard(context);
    if (formKey.currentState!.validate()) {
      isLoading = true;
      setState(() {});

      final LogInBloc lb = Provider.of<LogInBloc>(context, listen: false);
      deviceID = lb.deviceID;
      ipAddress = lb.ipAddress;

      Map req = {"userName": userNameCont.text, "password": passwordCont.text, "channelCode": "Mobile", "deviceId": deviceID, "ipAddress": ipAddress};

      await postRequest('/login', req).then((value) {
        print(value);
        if (value.statusCode.isSuccessful()) {
          var data = jsonDecode(value.body);
          print(data);
          lb.saveLoggedInToken(data['data']['bearerToken']);
          lb.setSignIn();
          toast(data['message']);
          setState(() {
            isLoading = false;
          });

          nextScreenCloseOthers(context, DashBoard());

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

  @override
  void initState() {
    final LogInBloc lb = context.read<LogInBloc>();
    deviceID = lb.deviceID;
    ipAddress = lb.ipAddress;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    final _screenHeight = MediaQuery.of(context).size.height;


    return WillPopScope(
      onWillPop: () async {
        if (closeCounter == 1) {
          print("You have to click again");
          closeCounter++;
        } else {
          SystemNavigator.pop();
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => NewOnboard()));
        }
        return true;
      },
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
        progressIndicator: AnimateWidget(),
        child: Scaffold(
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: EdgeInsets.only(
                  left: _screenWidth * 0.07, right: _screenWidth * 0.07),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: _screenHeight * .049,
                  ),
                  Container(
                      child: Image.asset(
                    'assets/images/logo.png',
                    height: MediaQuery.of(context).size.height * 0.051,
                    //width: _screenWidth * .26,
                  )),
                  SizedBox(
                    height: _screenHeight * 0.0516,
                  ),
                  Text(
                    "Login",
                    style: GoogleFonts.poppins(
                      color: appColorPrimary,
                      fontWeight: FontWeight.w600,
                      fontSize: _screenHeight * .03,
                    ),
                  ),
                  // Text("Login", style: TextStyle(color: appColorPrimary, fontSize: textSizeLarge),),
                  SizedBox(
                    height: _screenHeight * 0.026,
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
                    height: _screenHeight * 0.0285,
                  ),
                  Form(
                    key: formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
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
                            onFieldSubmitted: (s) =>
                                FocusScope.of(context).requestFocus(passwordNode),
                            validator: (s) {
                              if (s!.isEmpty) return 'Username is required';
                              return null;
                            },
                            //focusNode: usernameNode,
                          ),
                        ),
                        // TextFormField(
                        //   //cursorHeight: 70,
                        //   keyboardType: TextInputType.emailAddress,
                        //   autofocus: false,
                        //   controller: userNameCont,
                        //   textCapitalization: TextCapitalization.words,
                        //   style: TextStyle(
                        //       color: appColorPrimary,
                        //       fontFamily: fontRegular,
                        //       fontSize: textSizeMedium),
                        // decoration: InputDecoration(
                        //     filled: true,
                        //     fillColor: inputBackgroundColor,
                        //     focusColor: inputBorderColor,
                        //     hintText: "Enter Username",
                        //     hintStyle: GoogleFonts.poppins(
                        //         color: iconColorSecondary,

                        //         //fontFamily: fontRegular,
                        //         fontSize: _screenHeight * .0174),
                        //     contentPadding:
                        //         EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        //     focusedBorder: OutlineInputBorder(
                        //         borderSide: BorderSide(
                        //             color: inputBorderColor, width: 0.5)),
                        //     enabledBorder: OutlineInputBorder(
                        //         borderSide: BorderSide(
                        //             color: iconColorSecondary,
                        //             style: BorderStyle.solid,
                        //             width: 0))),
                        // onFieldSubmitted: (s) =>
                        //     FocusScope.of(context).requestFocus(passwordNode),
                        // textInputAction: TextInputAction.next,
                        // focusNode: usernameNode,
                        // validator: (s) {
                        //   if (s!.isEmpty) return 'Field is required';
                        //   return null;
                        // },
                        // ),
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
                            onFieldSubmitted: (s) =>
                                FocusScope.of(context).requestFocus(passwordNode),
                            focusNode: passwordNode,
                            validator: (s) {
                              if (s!.isEmpty) return 'Password is required';
                              return null;
                            },
                          ),
                        ),
                        // Row(
                        //   children: [
                        //     Expanded(
                        //       flex: 1,
                        //       child: TextFormField(
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
                        //                     ? Icons.visibility_outlined
                        //                     : Icons.visibility_off_outlined,
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
                        //             hintStyle: GoogleFonts.poppins(
                        //                 color: iconColorSecondary,

                        //                 //fontFamily: fontRegular,
                        //                 fontSize: _screenHeight * .0174),
                        //             hintText: "Enter Password",
                        //             contentPadding: EdgeInsets.fromLTRB(
                        //                 20.0, 15.0, 20.0, 15.0),
                        //             focusedBorder: OutlineInputBorder(
                        //                 borderSide: BorderSide(
                        //                     color: inputBorderColor, width: 0.5)),
                        //             enabledBorder: OutlineInputBorder(
                        //                 borderSide: BorderSide(
                        //                     color: iconColorSecondary,
                        //                     style: BorderStyle.solid,
                        //                     width: 0))),
                        //         textInputAction: TextInputAction.next,
                        //         focusNode: passwordNode,
                        //         validator: (s) {
                        //           if (s!.isEmpty) return 'Field is required';
                        //           return null;
                        //         },
                        //       ),
                        //     ),
                        //     // Visibility(
                        //     //     visible: passErrShow,
                        //     //     child: SvgPicture.asset("assets/svg/error.svg")),
                        //   ],
                        // ),
                        SizedBox(
                          height: _screenHeight * 0.03,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            SizedBox(width: _screenWidth * 0.4),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PasswordResetRequest()));
                              },
                              child: Text(
                                'I forgot my password',
                                style: GoogleFonts.poppins(
                                    color: appColorPrimary,
                                    fontWeight: FontWeight.w500,

                                    //fontFamily: fontRegular,
                                    fontSize: _screenHeight * .015),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: _screenHeight * 0.309,
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
                        //         finish(context);
                        //         Navigator.of(context).pushAndRemoveUntil(
                        //             MaterialPageRoute(
                        //                 builder: (context) => DashBoard()),
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
                        //       child: const Text("Login"),
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
                                onTap: () {
                                  loginIn();
                                },
                                child: Center(
                                  child: Text(
                                    "Login",
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
                        SizedBox(
                          height: _screenHeight * .043,
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
              //margin: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 10.0, 0.0),
              // decoration: BoxDecoration(
              //   border:
              // ),
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(color: Colors.black.withOpacity(0.13)))),
              child: Padding(
                padding: EdgeInsets.only(
                    left: _screenWidth * 0.07, top: _screenHeight * .001),
                child: Row(
                  children: [
                    Text(
                      "Don’t have an account?",
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
                                builder: (context) => RegisterScreen()));
                      },
                      child: Text(
                        " Register",
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
      ),
    );
  }

  Widget _exitDialog(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    var containerheight = _height * .5142;
    var _mypadding = SizedBox(
      height: containerheight * .12,
    );
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: appWhite,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        height: containerheight,
        //color: Colors.black,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              _mypadding,
              Image.asset(
                "lib/assets/dmsquestionmark.png",
                height: _height * .142,
                width: _width * .307,
                //width: 31.71,
              ),
              _mypadding,
              Text(
                "In",
                style: GoogleFonts.poppins(
                  color: Color(0xff8D93A1),
                  fontSize: _width * .041,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "",
                style: GoogleFonts.poppins(
                  color: Color(0xff8D93A1),
                  fontSize: _width * .041,
                  fontWeight: FontWeight.w400,
                ),
              ),
              _mypadding,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _width * .09365),
                child: Row(children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      //color: Color(0xffFFFFFF),
                      width: _width * .382,
                      height: _height * .0633,
                      child: Center(
                          child: Text(
                        "No",
                        style: GoogleFonts.poppins(
                          fontSize: _width * .0376,
                          color: Color(0xff000000),
                        ),
                      )),
                      decoration: BoxDecoration(
                        border: Border.all(color: appColorPrimary),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: _width * .0487,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    child: Container(
                      //color: Color(0xffFFFFFF),
                      width: _width * .382,
                      height: _height * .0633,
                      decoration: BoxDecoration(
                        color: appColorPrimary,
                      ),
                      child: Center(
                          child: Text(
                        "Yes",
                        style: GoogleFonts.poppins(
                          color: appWhite,
                          fontSize: _width * .0376,
                        ),
                      )),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
