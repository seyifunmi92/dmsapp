import 'package:dms/constant.dart';
import 'package:dms/layout/appWidget.dart';
import 'package:dms/utils/colors.dart';
import 'package:flutter/material.dart';

class NewSupportRequestDetail extends StatefulWidget {
  const NewSupportRequestDetail({Key? key}) : super(key: key);

  @override
  State<NewSupportRequestDetail> createState() =>
      _NewSupportRequestDetailState();
}

class _NewSupportRequestDetailState extends State<NewSupportRequestDetail> {
  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    final _screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: dmsAppBar(
        context,
        '',
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.only(
              left: _screenWidth * 0.04, right: _screenWidth * 0.04),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              text("New Support Request", isBoldText: true, fontSize: 28.0),
              SizedBox(
                height: _screenHeight * 0.01,
              ),
              ListView.builder(
                  itemCount: 2,
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Card(
                        elevation: 1.5,
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: double.infinity,
                              height: _screenHeight * 0.128,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: ListTile(
                                title: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Align(
                                        alignment: Alignment.topLeft,
                                        child: text("Support Details",
                                            textColor: appTextColorPrimary,
                                            isBoldText: true,
                                            fontFamily: fontBold)),
                                    Align(
                                        alignment: Alignment.topLeft,
                                        child: text(
                                          "Category",
                                          textColor: appTextColorPrimary,
                                          fontFamily: fontBold,
                                          fontSize: 12.0,
                                        )),
                                  ],
                                ),
                                selectedTileColor:
                                    Theme.of(context).primaryColor,
                                selectedColor: Theme.of(context).dividerColor,
                                trailing: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(""),
                                    SizedBox(
                                      height: _screenHeight * 0.02,
                                    ),
                                    Text(
                                      "Funding",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                                // minLeadingWidth: double.maxFinite,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(bottom: _screenHeight * 0.02),
                              child: Container(
                                alignment: Alignment.center,
                                width: double.infinity,
                                height: _screenHeight * 0.128,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: ListTile(
                                  title: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Align(
                                          alignment: Alignment.topLeft,
                                          child: text("Description",
                                              textColor: appTextColorPrimary,
                                              fontSize: 12.0,
                                              fontFamily: fontBold)),
                                      Align(
                                          alignment: Alignment.topLeft,
                                          child: text(
                                            "I’m having issues with funding wallet, money has left my account. I’m having issues with funding wallet, money has left my account",
                                            textColor: appTextColorPrimary,
                                            isLongText: true,
                                            fontSize: 12.0,
                                          )),
                                    ],
                                  ),
                                  selectedTileColor:
                                      Theme.of(context).primaryColor,
                                  selectedColor: Theme.of(context).dividerColor,

                                  // minLeadingWidth: double.maxFinite,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
