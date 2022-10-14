import 'dart:convert';

import 'package:dms/constant.dart';
import 'package:dms/layout/appWidget.dart';
import 'package:dms/model/faqmodels.dart';
import 'package:dms/screens/faq/faq_details_screen.dart';
import 'package:dms/services/faqservices.dart';
import 'package:dms/utils/colors.dart';
import 'package:dms/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../../layout/loading_indicator_widget.dart';

class FAQCategorySelected extends StatefulWidget {
  int categoryId;
  String name;
  FAQCategorySelected(this.categoryId, this.name);

  @override
  State<FAQCategorySelected> createState() => _FAQCategorySelectedState();
}

class _FAQCategorySelectedState extends State<FAQCategorySelected> {
  bool emptyList = false;
  Faqcategory? faqCategory;
  List<Faq1>? faqList;

  var _opacity = 1.0;
  var _xOffset = 0.0;
  var _yOffset = 0.0;
  var _blurRadius = 0.0;
  var _spreadRadius = 0.0;
  @override
  void initState() {
    Provider.of<FaqBloc>(context, listen: false).isLoading = true;
    print(widget.categoryId);
    getCat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    final _screenHeight = MediaQuery.of(context).size.height;

    return Provider.of<FaqBloc>(context, listen: false).isLoading
        ? Scaffold(
            body: Center(child: LoadingIndicatorWidget()),
          )
        : Scaffold(
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
                    SizedBox(
                      height: _screenHeight * .02,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: _screenWidth * 0.00,
                          right: _screenWidth * 0.00),
                      child: Text(
                        "${widget.name} FAQs",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: _screenHeight * .0284,
                          color: appColorPrimary,
                        ),
                      ),
                      //child: text("Accounts FAQ", isBoldText: true, fontSize: 28.0),
                    ),
                    SizedBox(
                      height: _screenHeight * 0.0213,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: _screenWidth * 0.00,
                          right: _screenWidth * 0.00),
                      child: GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => FAQDetailsScreen()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: inputBackgroundColor,
                              border: Border.all(
                                  color: inputBorderColor,
                                  width: 1,
                                  style: BorderStyle.solid)),
                          height: 45,
                          width: _screenWidth * 0.90,
                          padding: EdgeInsets.symmetric(
                              horizontal: 14, vertical: 13),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.search,
                                color: iconColorSecondary,
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: _screenWidth * 0.01),
                                child: Text(
                                  "Search Question",
                                  style: GoogleFonts.poppins(
                                      color: iconColorSecondary,
                                      fontSize: _screenHeight * .015),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: _screenHeight * 0.02,
                    ),
                    emptyList == true
                        ? Text("")
                        : Column(
                            children: [
                              ...faqList!.map((e) => faqCustom(e)),
                            ],
                          )
                    // Column(
                    //   children: [
                    //     ListView.builder(
                    //         itemCount: 10,
                    //         scrollDirection: Axis.vertical,
                    //         physics: NeverScrollableScrollPhysics(),
                    //         shrinkWrap: true,
                    //         itemBuilder: (context, index) {
                    //           return Column(
                    //             children: [
                    //               Padding(
                    //                 padding: EdgeInsets.only(
                    //                     left: _screenWidth * 0.04,
                    //                     right: _screenWidth * 0.04),
                    //                 child: GestureDetector(
                    //                   onTap: () {
                    //                     Navigator.push(
                    //                         context,
                    //                         MaterialPageRoute(
                    //                             builder: (context) =>
                    //                                 FAQDetailsScreen()));
                    //                   },
                    //                   child: Container(
                    //                     // color: Colors.white70,
                    //                     alignment: Alignment.center,
                    //                     width: double.infinity,
                    //                     height: 70,
                    //                     child: Center(
                    //                       child: ListTile(
                    //                         // tileColor: Colors.white,
                    //                         leading: text(
                    //                             "How to change password $index",
                    //                             fontSize: _screenHeight * .019,
                    //                             textColor: appTextColorPrimary),
                    //                         selectedTileColor:
                    //                             Theme.of(context).primaryColor,
                    //                         selectedColor:
                    //                             Theme.of(context).dividerColor,
                    //                         trailing: Icon(
                    //                           Icons.arrow_forward_ios,
                    //                           size: _screenHeight * .024,
                    //                         ),

                    //                         // minLeadingWidth: double.maxFinite,
                    //                       ),
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ),
                    //               Divider(
                    //                 color: appTextColorPrimary
                    //                     .withOpacity(0.4), //color of divider
                    //                 height: _screenHeight *
                    //                     .00118, //height spacing of divider
                    //                 thickness: 1, //thickness of divier line
                    //               ),
                    //             ],
                    //           );
                    //         }),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: SafeArea(
              child: Container(
                width: double.infinity,
                height: _screenHeight * 0.252,
                margin:
                    const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 10.0, 0.0),
                // decoration: BoxDecoration(
                //   border:
                // ),
                decoration: BoxDecoration(
                    border: Border(
                        top:
                            BorderSide(color: Colors.black.withOpacity(0.13)))),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: _screenWidth * 0.026,
                      right: _screenWidth * 0.026,
                      top: _screenWidth * 0.02),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        faqIcon,
                        height: _screenHeight * 0.055,
                      ),
                      SizedBox(
                        height: _screenHeight * 0.01,
                      ),
                      text("Can’t find your question?",
                          fontSize: _screenHeight * .017,
                          textColor: appTextColorPrimary),
                      SizedBox(
                        height: _screenHeight * 0.02,
                      ),
                      text(
                          "Contact us at question@dangote.com for any queries and enquires.",
                          isCentered: true,
                          fontSize: _screenHeight * .017,
                          isLongText: true,
                          textColor: appTextColorPrimary),
                    ],
                  ),
                ),
              ),
            ),
          );
  }

  Widget faqCustom(Faq1 _faq) {
    final _screenWidth = MediaQuery.of(context).size.width;
    final _screenHeight = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    FAQDetailsScreen(_faq.question!, _faq.answer!)));
      },
      child: Container(
        height: _screenHeight * .08,
        child: Card(
          child: ListTile(
            leading: Text(
              _faq.question!,
              style: GoogleFonts.poppins(
                fontSize: _screenHeight * .017,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: _screenHeight * .02,
            ),
          ),
        ),
      ),
    );
  }

  void getCat() {
    Provider.of<FaqBloc>(context, listen: false)
        .getFaqCategorybyId(widget.categoryId)
        .then((value) => catOutput(value));
  }

  catOutput(String _list) {
    print(_list);
    var myfaqList = jsonDecode(_list);
    print(myfaqList);
    if (_list.contains("faqs")) {
      Provider.of<FaqBloc>(context, listen: false).isLoading = false;
      List myFaqs = myfaqList["data"]["faqs"];
      dynamic _value = myFaqs;
      print(myFaqs);
      setState(() {
        faqList = _value.map<Faq1>((e) => Faq1.fromJson(e)).toList();
      });
      if (myFaqs.isEmpty) {
        print("empty bro");
        setState(() {
          emptyList = true;
        });
        toast("No FAQs at the moment, Please check later");
      }
    } else {
      Provider.of<FaqBloc>(context, listen: false).isLoading = false;
      toast(myfaqList["message"].toString());
    }
  }
}
