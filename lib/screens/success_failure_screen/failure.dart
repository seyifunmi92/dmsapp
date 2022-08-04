import 'package:dms/layout/appWidget.dart';
import 'package:dms/utils/colors.dart';
import 'package:flutter/material.dart';

class FailureScreen extends StatelessWidget {
  const FailureScreen({Key? key}) : super(key: key);

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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: _screenHeight * 0.04,
              ),
              Image.asset("assets/gif/cancel.gif", alignment: Alignment.center, width: 200,),
              SizedBox(
                height: _screenHeight * 0.13,
              ),
              text("Failure", isBoldText: true, fontSize: 28.0),
              SizedBox(
                height: _screenHeight * 0.02,
              ),
              text("Account registration Failed", fontSize: 13.0, textColor: appTextColorSecondary),
              SizedBox(
                height: _screenHeight * 0.20,
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
                        "Try Again"
                    ),
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
