import 'package:dms/layout/appWidget.dart';
import 'package:dms/utils/colors.dart';
import 'package:flutter/material.dart';

class MyATCDetail extends StatefulWidget {
  const MyATCDetail({Key? key}) : super(key: key);

  @override
  State<MyATCDetail> createState() => _MyATCDetailState();
}

class _MyATCDetailState extends State<MyATCDetail> {


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
              text("ATC", isBoldText: true, fontSize: 28.0),
              SizedBox(
                height: _screenHeight * 0.01,
              ),

              Card(
                color: Colors.white,
                elevation: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          text("Item", isBoldText: true),
                          text("00010", fontSize: 14.0),
                        ],
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          text("Material", isBoldText: true),
                          text("200000000", fontSize: 14.0),
                        ],
                      ),

                    ),
                    Divider(),
                    ListTile(
                      // tileColor: Colors.white,
                      leading: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          text("Description", isBoldText: true),
                          text("Non-fortified",  fontSize: 14.0),
                        ],
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          text("Quantity", isBoldText: true),
                          text("900.00", fontSize: 14.0),
                        ],
                      ),

                    ),
                    Divider(),
                    ListTile(
                      leading: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          text("UOM", isBoldText: true),
                          text("Bag", fontSize: 14.0),
                        ],
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          text("Price Unit", isBoldText: true),
                          text("934.88", fontSize: 14.0),
                        ],
                      ),

                    ),
                    Divider(),

                    ListTile(
                      // tileColor: Colors.white,
                      leading: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          text("Order ID", isBoldText: true),
                          text("OR1234", fontSize: 14.0),
                        ],
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          text("Date", isBoldText: true),
                          text("27/05/2022", fontSize: 14.0),
                        ],
                      ),

                    ),
                    Divider(
                      indent: 5.0,
                    ),

                    ListTile(
                      // tileColor: Colors.white,
                      leading: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          text("Reference", isBoldText: true),
                          text("48120945", fontSize: 14.0),
                        ],
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          text("Plant", isBoldText: true),
                          text("DSR Apapa PD", fontSize: 14.0),
                        ],
                      ),

                    ),
                    Divider(),

                    ListTile(
                      // tileColor: Colors.white,
                      leading: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          text("Destination", isBoldText: true),
                          text("Abeokuta", fontSize: 14.0),
                        ],
                      ),

                    ),
                    Divider(),
                            Padding(
                              padding: EdgeInsets.all(_screenHeight * 0.02),
                              child: Column(
                                children: [
                                  Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    text("VAT",),
                                    text("N3,000", isBoldText: true, textColor: Color(0xFF27AE60),),
                                  ],
                          ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      text("Total Price",),
                                      text("N20,000", isBoldText: true, textColor: Color(0xFF27AE60),),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                  ],
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
                        color:  Colors.white,
                      ),
                      primary:  appColorPrimary, // background
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)),
                    ),
                    child: const Text(
                        "Schedule Delivery"
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
