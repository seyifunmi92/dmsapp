import 'package:dms/constant.dart';
import 'package:dms/layout/appWidget.dart';
import 'package:dms/utils/colors.dart';
import 'package:flutter/material.dart';

class MyATCOrderList extends StatefulWidget {
  const MyATCOrderList({Key? key}) : super(key: key);

  @override
  State<MyATCOrderList> createState() => _MyATCOrderListState();
}

class _MyATCOrderListState extends State<MyATCOrderList> {
  var _opacity = 1.0;
  var _xOffset = 0.0;
  var _yOffset = 0.0;
  var _blurRadius = 0.0;
  var _spreadRadius = 0.0;

  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    final _screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: dmsAppBar(context, '', showBack: true),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.only(
              left: _screenWidth * 0.04, right: _screenWidth * 0.04),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              text("My ATC", isBoldText: true, fontSize: 28.0),
              SizedBox(
                height: _screenHeight * 0.01,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      color: inputBackgroundColor,
                      border: Border.all(
                          color: inputBorderColor,
                          width: 1,
                          style: BorderStyle.solid)),
                  height: 45,
                  width: _screenWidth * 0.90,
                  padding: EdgeInsets.symmetric(horizontal: 14, vertical: 13),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.search,
                        color: iconColorSecondary,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: _screenWidth * 0.01),
                        child: Text(
                          "Search ATC",
                          style: TextStyle(
                              color: iconColorSecondary,
                              fontFamily: fontRegular,
                              fontSize: textSizeMedium),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: _screenHeight * 0.02,
              ),
              Column(
                children: [
                  ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Card(
                            elevation: 1,
                            shadowColor: appTextColorPrimary,
                            semanticContainer: true,
                            child: Container(
                              // color: Colors.white70,
                              alignment: Alignment.center,
                              width: double.infinity,
                              height: 70,
                              // decoration: BoxDecoration(
                              //   // borderRadius: BorderRadius.circular(10),
                              //   color: Colors.white,
                              //   // Color(0xFFF3F1FF),
                              //   boxShadow: [
                              //     BoxShadow(
                              //       color: Color.fromRGBO(0, 0, 0, _opacity),
                              //       offset: Offset(_xOffset, _yOffset),
                              //       blurRadius: _blurRadius,
                              //       spreadRadius: _spreadRadius,
                              //     )
                              //   ],
                              // ),
                              child: Center(
                                child: ListTile(
                                  // tileColor: Colors.white,
                                  title: Padding(
                                    padding: EdgeInsets.only(
                                        bottom: _screenWidth * 0.03),
                                    child: text("Order 12$index",
                                        isBoldText: true),
                                  ),
                                  selectedTileColor:
                                      Theme.of(context).primaryColor,
                                  selectedColor: Theme.of(context).dividerColor,
                                  trailing: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("12-05-22"),
                                      Container(
                                          color: Color(0xFF00CC08)
                                              .withOpacity(0.1),
                                          child: Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: Text(
                                              "Completed",
                                              style: TextStyle(
                                                  color: Color(0xFF00CC08)),
                                            ),
                                          ))
                                    ],
                                  ),
                                  // minLeadingWidth: double.maxFinite,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
