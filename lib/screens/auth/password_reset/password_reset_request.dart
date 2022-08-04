import 'package:dms/constant.dart';
import 'package:dms/layout/appWidget.dart';
import 'package:dms/utils/colors.dart';
import 'package:flutter/material.dart';

class PasswordResetRequest extends StatelessWidget {
   PasswordResetRequest({Key? key}) : super(key: key);

  var formKey = GlobalKey<FormState>();
  var userNameCont = TextEditingController();
   var usernameNode = FocusNode();

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
                height: _screenHeight * 0.04,
              ),
              text("Password Reset", isBoldText: true, fontSize: 28.0),
              // Text("Login", style: TextStyle(color: appColorPrimary, fontSize: textSizeLarge),),
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
                        if (s!.isEmpty) return 'Field is required';
                        return null;
                      },
                    ),

                    SizedBox(
                      height: _screenHeight * 0.4,
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
