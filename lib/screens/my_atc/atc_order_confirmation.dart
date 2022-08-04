import 'package:dms/layout/appWidget.dart';
import 'package:dms/utils/colors.dart';
import 'package:flutter/material.dart';

class ATCOrderComfirmation extends StatefulWidget {
  const ATCOrderComfirmation({Key? key}) : super(key: key);

  @override
  State<ATCOrderComfirmation> createState() => _ATCOrderComfirmationState();
}

class _ATCOrderComfirmationState extends State<ATCOrderComfirmation> {


  @override
  Widget build(BuildContext context) {

    final  _screenWidth = MediaQuery.of(context).size.width;
    final  _screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: dmsAppBar(context, '', showBack: true),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.only(left: _screenWidth * 0.04, right: _screenWidth * 0.04),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              text("My ATC", isBoldText: true, fontSize: 28.0),
              SizedBox(
                height: _screenHeight * 0.01,
              ),

              Card(
                color: Colors.white,
                elevation: 3,
                child: Padding(
                  padding: EdgeInsets.only(bottom: _screenHeight * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            text("Delivery type", isBoldText: true),
                            text("Self Collection", fontSize: 14.0),
                          ],
                        ),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            text("Truck Size", isBoldText: true),
                            text("3500kg", fontSize: 14.0),
                          ],
                        ),

                      ),
                      Divider(),
                      ListTile(
                        // tileColor: Colors.white,
                        leading: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            text("Delivery Date", isBoldText: true),
                            text("20/07/2022",  fontSize: 14.0),
                          ],
                        ),

                      ),
                      Divider(),
                      ListTile(
                        leading: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            text("Delivery Address", isBoldText: true),
                            text("Garwood Court, Ikorodu Road, Phase 2, Lagos Nigeria", isLongText: true, fontSize: 12.0),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
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

              SizedBox(
                height: _screenHeight * 0.02,
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
                        color:  appColorPrimary,
                      ),
                      primary:  Colors.white, // background
                      shape: RoundedRectangleBorder(),
                    ),
                    child: const Text(
                        "Cancel", style: TextStyle(color: appColorPrimary),
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
