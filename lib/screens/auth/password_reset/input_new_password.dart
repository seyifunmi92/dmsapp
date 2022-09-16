import 'dart:convert';

import 'package:dms/blocs/login_bloc.dart';
import 'package:dms/constant.dart';
import 'package:dms/layout/appWidget.dart';
import 'package:dms/screens/auth/password_reset/pwd_reset_success.dart';
import 'package:dms/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../../../network/network_utils.dart';
import '../../../utils/animate_controller.dart';
import '../../../utils/next_screen.dart';

class InputNewPassword extends StatefulWidget {
  InputNewPassword({Key? key}) : super(key: key);

  @override
  State<InputNewPassword> createState() => _InputNewPasswordState();
}

class _InputNewPasswordState extends State<InputNewPassword> {
  var formKey = GlobalKey<FormState>();

  var passwordCont = TextEditingController();
  var confirmPasswordCont = TextEditingController();
  var passwordNode = FocusNode();
  var confirmPasswordNode = FocusNode();
  bool _isObscure = true;
  bool _isObscure2 = true;
  bool isLoading = false;
  String resetToken = "";

  @override
  void initState() {
    // final LogInBloc lb = context.read<LogInBloc>();
    // resetToken = lb.resetToken!;
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
                  height: _screenHeight * 0.02,
                ),
                text("Password Reset", isBoldText: true, fontSize: 28.0),
                SizedBox(
                  height: _screenHeight * 0.02,
                ),
                text("Kindly choose a new password and confirm",
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
                        obscureText: _isObscure,
                        style: TextStyle(
                            color: appColorPrimary,
                            fontFamily: fontRegular,
                            fontSize: textSizeMedium),
                        controller: passwordCont,
                        textCapitalization: TextCapitalization.words,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
                            ),
                            hoverColor: appColorPrimary,
                            filled: true,
                            fillColor: inputBackgroundColor,
                            focusColor: inputBorderColor,
                            hintStyle: TextStyle(
                                color: iconColorSecondary,
                                fontFamily: fontRegular,
                                fontSize: textSizeMedium),
                            hintText: "Enter Password",
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: inputBorderColor, width: 0.5)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: appShadowColor,
                                    style: BorderStyle.solid,
                                    width: 0))),
                        onFieldSubmitted: (s) => FocusScope.of(context)
                            .requestFocus(confirmPasswordNode),
                        textInputAction: TextInputAction.next,
                        focusNode: passwordNode,
                        validator: (s) {
                          if (s!.isEmpty) return 'Password is required';
                          return null;
                        },
                      ),
                      SizedBox(
                        height: _screenHeight * 0.03,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        autofocus: false,
                        obscureText: _isObscure2,
                        style: TextStyle(
                            color: appColorPrimary,
                            fontFamily: fontRegular,
                            fontSize: textSizeMedium),
                        controller: passwordCont,
                        textCapitalization: TextCapitalization.words,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isObscure2
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isObscure2 = !_isObscure2;
                                });
                              },
                            ),
                            hoverColor: appColorPrimary,
                            filled: true,
                            fillColor: inputBackgroundColor,
                            focusColor: inputBorderColor,
                            hintStyle: TextStyle(
                                color: iconColorSecondary,
                                fontFamily: fontRegular,
                                fontSize: textSizeMedium),
                            hintText: "Confirm Password",
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: inputBorderColor, width: 0.5)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: appShadowColor,
                                    style: BorderStyle.solid,
                                    width: 0))),
                        textInputAction: TextInputAction.next,
                        focusNode: confirmPasswordNode,
                        validator: (s) {
                          if (s!.isEmpty) return 'Password Confirmation is required';
                          return null;
                        },
                      ),
                      SizedBox(
                        height: _screenHeight * 0.35,
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
                              finishReset();
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
                            child: const Text("Confirm"),
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
                    top: BorderSide(color: Colors.black.withOpacity(0.13)))),
            child: Padding(
              padding: EdgeInsets.only(top: _screenHeight * 0.008),
              child: Row(
                children: [
                  Text("Have an account?"),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      " Login",
                      style: TextStyle(
                          fontFamily: fontBold, fontWeight: FontWeight.bold),
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

  finishReset() async {
    hideKeyboard(context);
    if (formKey.currentState!.validate()) {
      final LogInBloc lb2 = context.read<LogInBloc>();
      resetToken = lb2.resetToken!;
      isLoading = true;
      setState(() {});

      final LogInBloc lb = Provider.of<LogInBloc>(context, listen: false);

      Map req = {"resetToken": resetToken, "password": passwordCont.text};

      await postRequest('/reset/complete', req).then((value) {
        print(value);
        if (value.statusCode.isSuccessful()) {
          var data = jsonDecode(value.body);
          print(data);
          toast(data['message'], length: Toast.LENGTH_LONG);
          setState(() {
            isLoading = false;
          });

          nextScreenCloseOthers(context, PWDResetSuccess());

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
