import 'dart:convert';

import 'package:dms/blocs/login_bloc.dart';
import 'package:dms/constant.dart';
import 'package:dms/layout/appWidget.dart';
import 'package:dms/network/network_utils.dart';
import 'package:dms/screens/auth/password_reset/pwd_reset_confirm_otp.dart';
import 'package:dms/utils/colors.dart';
import 'package:dms/utils/next_screen.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../../../utils/animate_controller.dart';

class PasswordResetRequest extends StatefulWidget {
   PasswordResetRequest({Key? key}) : super(key: key);

  @override
  State<PasswordResetRequest> createState() => _PasswordResetRequestState();
}

class _PasswordResetRequestState extends State<PasswordResetRequest> {
  var formKey = GlobalKey<FormState>();

  var userNameCont = TextEditingController();

   var usernameNode = FocusNode();

   bool isLoading = false;

  @override
  Widget build(BuildContext context) {

    final  _screenWidth = MediaQuery.of(context).size.width;
    final  _screenHeight = MediaQuery.of(context).size.height;

    return ModalProgressHUD(
      inAsyncCall: isLoading,
      progressIndicator: AnimateWidget(),
      child: Scaffold(
        appBar: dmsAppBar(context, '', showBack: true),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.only(left: _screenWidth * 0.07, right: _screenWidth * 0.07),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: _screenHeight * 0.04,
                ),
                text("Password Reset", isBoldText: true, fontSize: 28.0),
                SizedBox(
                  height: _screenHeight * 0.02,
                ),
                text("Kindly enter registered  username", fontSize: 13.0, textColor: appTextColorSecondary),
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
                        keyboardType: TextInputType.emailAddress,
                        autofocus: false,
                        controller: userNameCont,
                        textCapitalization: TextCapitalization.words,
                        style: TextStyle(color: appColorPrimary, fontFamily: fontRegular, fontSize: textSizeMedium),
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: inputBackgroundColor,
                            focusColor: inputBorderColor,
                            hintText: "Enter Username",
                            hintStyle: TextStyle(color: iconColorSecondary, fontFamily: fontRegular, fontSize: textSizeMedium),
                            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: inputBorderColor, width: 0.5)),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: iconColorSecondary, style: BorderStyle.solid, width: 0))),
                        textInputAction: TextInputAction.next,
                        focusNode: usernameNode,
                        validator: (s) {
                          if (s!.isEmpty) return 'Username is required';
                          return null;
                        },
                      ),

                      SizedBox(
                        height: _screenHeight * 0.45,
                      ),

                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: double.infinity,
                          height: 55.0,
                          margin: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 10.0),
                          child: ElevatedButton(
                            onPressed: () async {
                              resetPassword();
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => PwdResetConfirmOTP()));
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(0),
                              textStyle: const TextStyle(
                                color:  Colors.white,
                              ),
                              primary:  appColorPrimary, // background
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)),
                            ),
                            child: const Text(
                                "Confirm"
                            ),
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

        bottomNavigationBar: SafeArea(
          child: Container(
            width: double.infinity,
            height: 70.0,
            margin: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 10.0, 0.0),
            // decoration: BoxDecoration(
            //   border:
            // ),
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        color: Colors.black.withOpacity(0.13)
                    )
                )
            ),
            child: Padding(
              padding: EdgeInsets.only(top: _screenHeight * 0.008),
              child: Row(
                children: [
                  Text(
                      "Have an account?"
                  ),
                  GestureDetector(
                    onTap: (){},
                    child: Text(
                      " Login",
                      style: TextStyle(fontFamily: fontBold, fontWeight: FontWeight.bold),
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

   resetPassword() async {
     hideKeyboard(context);
     if (formKey.currentState!.validate()) {
       isLoading = true;
       setState(() {});

       final LogInBloc lb = Provider.of<LogInBloc>(context, listen: false);
       Map req = {"userName": userNameCont.text};

       await postRequest('/reset', req).then((value) {
         print(value);
         if (value.statusCode.isSuccessful()) {
           var data = jsonDecode(value.body);
           print(data);
           lb.saveOtpId(data['data']['otp']['otpDisplayId']).then((value) => {print("otp saved $value")});
           toast(data['message'], length: Toast.LENGTH_LONG);
           setState(() {
             isLoading = false;
           });
           nextScreenCloseOthers(context, PwdResetConfirmOTP());
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
