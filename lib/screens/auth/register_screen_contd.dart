import 'package:dms/constant.dart';
import 'package:dms/layout/appWidget.dart';
import 'package:dms/utils/colors.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {

    final  _screenWidth = MediaQuery.of(context).size.width;
    final  _screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: dmsAppBar(context, '', showBack: true),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.only(left: _screenWidth * 0.07, right: _screenWidth * 0.07),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: _screenHeight * 0.02,
              ),
              text("Register", isBoldText: true, fontSize: 28.0),
              SizedBox(
                height: _screenHeight * 0.02,
              ),
              text("Enter preferred Username & Password", fontSize: 13.0, textColor: appTextColorSecondary),
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
                      autofocus: true,
                      controller: usernameCont,
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
                      onFieldSubmitted: (s) => FocusScope.of(context).requestFocus(passwordNode),
                      textInputAction: TextInputAction.next,
                      focusNode: usernameNode,
                      validator: (s) {
                        if (s!.isEmpty) return 'Field is required';
                        return null;
                      },
                    ),
                    SizedBox(
                      height: _screenHeight * 0.03,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      autofocus: false,
                      obscureText: _isObscure,
                      style: TextStyle(color: appColorPrimary, fontFamily: fontRegular, fontSize: textSizeMedium),
                      controller: passwordCont,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isObscure ? Icons.visibility : Icons.visibility_off,
                            ), onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },),
                          hoverColor: appColorPrimary,
                          filled: true,
                          fillColor: inputBackgroundColor,
                          focusColor: inputBorderColor,
                          hintStyle: TextStyle(color: iconColorSecondary, fontFamily: fontRegular, fontSize: textSizeMedium),
                          hintText: "Enter Password",
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: inputBorderColor, width: 0.5)),
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: appShadowColor, style: BorderStyle.solid, width: 0))),
                      onFieldSubmitted: (s) => FocusScope.of(context).requestFocus(confirmPasswordNode),
                      textInputAction: TextInputAction.next,
                      focusNode: passwordNode,
                      validator: (s) {
                        if (s!.isEmpty) return 'Field is required';
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
                      style: TextStyle(color: appColorPrimary, fontFamily: fontRegular, fontSize: textSizeMedium),
                      controller: passwordCont,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isObscure2 ? Icons.visibility : Icons.visibility_off,
                            ), onPressed: () {
                            setState(() {
                              _isObscure2 = !_isObscure2;
                            });
                          },),
                          hoverColor: appColorPrimary,
                          filled: true,
                          fillColor: inputBackgroundColor,
                          focusColor: inputBorderColor,
                          hintStyle: TextStyle(color: iconColorSecondary, fontFamily: fontRegular, fontSize: textSizeMedium),
                          hintText: "Confirm Password",
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: inputBorderColor, width: 0.5)),
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: appShadowColor, style: BorderStyle.solid, width: 0))),
                      textInputAction: TextInputAction.next,
                      focusNode: confirmPasswordNode,
                      validator: (s) {
                        if (s!.isEmpty) return 'Field is required';
                        return null;
                      },
                    ),
                    SizedBox(
                      height: _screenHeight * 0.25,
                    ),

                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: double.infinity,
                        height: 55.0,
                        margin: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 10.0),
                        child: ElevatedButton(
                          onPressed: () async {
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
    );
  }
}
