import 'package:dms/constant.dart';
import 'package:dms/layout/appWidget.dart';
import 'package:dms/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

  @override
  Widget build(BuildContext context) {

    final  _screenWidth = MediaQuery.of(context).size.width;
    final  _screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.only(left: _screenWidth * 0.07, right: _screenWidth * 0.07),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: _screenHeight * 0.08),
                  child: Image.asset('assets/images/logo.png', height: MediaQuery.of(context).size.height * 0.08,)
              ),
              SizedBox(
                height: _screenHeight * 0.04,
              ),
              text("Login", isBoldText: true, fontSize: 28.0),
              // Text("Login", style: TextStyle(color: appColorPrimary, fontSize: textSizeLarge),),
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
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: TextFormField(
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
                            textInputAction: TextInputAction.next,
                            focusNode: passwordNode,
                            validator: (s) {
                              if (s!.isEmpty) return 'Field is required';
                              return null;
                            },
                          ),
                        ),

                        // Visibility(
                        //     visible: passErrShow,
                        //     child: SvgPicture.asset("assets/svg/error.svg")),

                      ],
                    ),
                    SizedBox(
                      height: _screenHeight * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                            width: _screenWidth * 0.4
                        ),
                        InkWell(
                          onTap: () {
                            // ShSignIn().launch(context);
                          },
                          child: Text('I forgot my password', style: TextStyle(color: appColorPrimary, fontWeight: FontWeight.w500, fontFamily: fontBold),),
                        ),
                      ],
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
                              "Login"
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
                    "Don’t have an account?"
                ),
                GestureDetector(
                  onTap: (){},
                  child: Text(
                      " Register",
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
