import 'package:dms/layout/appWidget.dart';
import 'package:dms/screens/auth/login_screen.dart';
import 'package:dms/utils/colors.dart';
import 'package:flutter/material.dart';

class PWDResetSuccess extends StatefulWidget {
  const PWDResetSuccess({Key? key}) : super(key: key);

  @override
  State<PWDResetSuccess> createState() => _PWDResetSuccessState();
}

class _PWDResetSuccessState extends State<PWDResetSuccess> {
  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    final _screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: dmsAppBar(context, '', showBack: true),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.only(
              left: _screenWidth * 0.07, right: _screenWidth * 0.07),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: _screenHeight * 0.04,
              ),
              Image.asset(
                "assets/gif/checkmark.gif",
                alignment: Alignment.center,
                width: 200,
              ),
              SizedBox(
                height: _screenHeight * 0.13,
              ),
              text("Success", isBoldText: true, fontSize: 28.0),
              SizedBox(
                height: _screenHeight * 0.02,
              ),
              text("Password Reset Successful",
                  fontSize: 17.0, textColor: appTextColorSecondary),
              SizedBox(
                height: _screenHeight * 0.20,
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
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
                    child: const Text("Login"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
