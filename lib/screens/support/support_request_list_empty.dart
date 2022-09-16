import 'package:dms/layout/appWidget.dart';
import 'package:dms/utils/colors.dart';
import 'package:flutter/material.dart';

class SupportRequestListEmptyScreen extends StatefulWidget {
  const SupportRequestListEmptyScreen({Key? key}) : super(key: key);

  @override
  State<SupportRequestListEmptyScreen> createState() => _SupportRequestListEmptyScreenState();
}

class _SupportRequestListEmptyScreenState extends State<SupportRequestListEmptyScreen> {

  @override
  Widget build(BuildContext context) {

    final  _screenWidth = MediaQuery.of(context).size.width;
    final  _screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: dmsAppBar(context, '', showBack: true),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.only(left: _screenWidth * 0.04, right: _screenWidth * 0.04),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget> [
              text("Support Request", isBoldText: true, fontSize: 28.0),
              SizedBox(
                height: _screenHeight * 0.13,
              ),
              Image.asset("assets/gif/empty1.png", alignment: Alignment.center, width: 200,),
              SizedBox(
                height: _screenHeight * 0.013,
              ),
              Center(child: text("Support Request List Empty", fontSize: 17.0, textColor: appTextColorSecondary)),
              SizedBox(
                height: _screenHeight * 0.17,
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
                        "Create New Request"
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
