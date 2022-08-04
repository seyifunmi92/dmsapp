import 'package:dms/layout/appWidget.dart';
import 'package:dms/utils/colors.dart';
import 'package:flutter/material.dart';

class MyATCSelectBusiness extends StatelessWidget {
  const MyATCSelectBusiness({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final  _screenWidth = MediaQuery.of(context).size.width;
    final  _screenHeight = MediaQuery.of(context).size.height;
    var _opacity = 1.0;
    var _xOffset = 0.0;
    var _yOffset = 0.0;
    var _blurRadius = 5.0;
    var _spreadRadius = 3.0;

    return Scaffold(
      appBar: dmsDrawerAppBar(context, "", ),
      bottomSheet: Padding(
        padding: EdgeInsets.only(left: _screenWidth * 0.04, right: _screenWidth * 0.04),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget> [
            text("My ATC", isBoldText: true, fontSize: 28.0),
            SizedBox(
              height: _screenHeight * 0.01,
            ),
            text("Select account", fontSize: 13.0, textColor: appTextColorSecondary),

            Expanded(
              child: Padding(
                padding: EdgeInsets.all(_screenWidth * 0.01),
                child: ListView.builder(
                    itemCount: 2,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (context, index){
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: Container(
                          // color: Colors.white70,
                          alignment: Alignment.center,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(10),
                            color: Color(0xFFF2F2F2),

                          ),
                          child: Center(
                            child: ListTile(
                              // tileColor: Colors.white,
                              title: text("DB00023$index", isBoldText: true),
                              selectedTileColor:Theme.of(context).primaryColor,
                              selectedColor: Theme.of(context).dividerColor,
                              // minLeadingWidth: double.maxFinite,
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
