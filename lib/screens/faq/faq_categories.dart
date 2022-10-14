import 'dart:convert';
import 'dart:math';

import 'package:dms/constant.dart';
import 'package:dms/layout/appWidget.dart';
import 'package:dms/layout/dms_drawer.dart';
import 'package:dms/model/faqmodels.dart';
import 'package:dms/screens/faq/faq_category_selected.dart';
import 'package:dms/services/faqservices.dart';
import 'package:dms/utils/colors.dart';
import 'package:dms/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../../layout/loading_indicator_widget.dart';

class FAQCategories extends StatefulWidget {
  FAQCategories({Key? key}) : super(key: key);
  @override
  State<FAQCategories> createState() => _FAQCategoriesState();
}

class _FAQCategoriesState extends State<FAQCategories> {
  List<Faq>? faq;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool menuClicked = false;
  void initState() {
    Provider.of<FaqBloc>(context, listen: false).isLoading = true;
    faqCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    final _screenHeight = MediaQuery.of(context).size.height;
    return Provider.of<FaqBloc>(context, listen: false).isLoading
        ? Scaffold(body: Center(child: LoadingIndicatorWidget()))
        : Scaffold(
            backgroundColor: Colors.white,
            key: _scaffoldKey,
            appBar: dmsDrawerAppBar(
              context,
              '',
              () {
                _scaffoldKey.currentState!.openDrawer();
                setState(() {
                  menuClicked = true;
                });
              },
            ),
            drawer: DMSDrawer(),
            body: Padding(
              padding: EdgeInsets.only(
                  left: _screenWidth * 0.04, right: _screenWidth * 0.04),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    "FAQ Categories",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: _screenHeight * .0284,
                      color: appColorPrimary,
                    ),
                  ),
                  SizedBox(
                    height: _screenHeight * 0.01,
                  ),
                  Text(
                    "Select Category for Frequently Asked Questions",
                    style: GoogleFonts.poppins(
                        fontSize: _screenHeight * .0154,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff8D93A1)),
                  ),
                  SizedBox(
                    height: _screenHeight * 0.03,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //builder: (context) => FAQCategorySelected()));
                      },
                      child: Padding(
                          padding: EdgeInsets.all(_screenWidth * 0.01),
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 12.0),
                              child: Column(
                                children: [
                                  ...faq!.map((e) => itemCard(e)),
                                ],
                              ),
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          );
  }

  Widget itemCard(Faq myfaq) {
    final screenHeight = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  FAQCategorySelected(myfaq.categoryId!, myfaq.name!),
            ));
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: screenHeight * .005),
        child: Card(
          shadowColor: Colors.black12,
          child: Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: screenHeight * .095,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurStyle: BlurStyle.outer,
                  blurRadius: 3,
                  spreadRadius: 0,
                  offset: Offset.zero,
                ),
              ],
              color: appWhite,
              borderRadius: BorderRadius.circular(0),
            ),
            child: Center(
              child: ListTile(
                leading: Text(
                  myfaq.name!,
                  style: GoogleFonts.poppins(
                    fontSize: MediaQuery.of(context).size.height * .019,
                    color: Color(0xff000000),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                //selectedTileColor: Theme.of(context).primaryColor,
                //selectedColor: Theme.of(context).dividerColor,
                // minLeadingWidth: double.maxFinite,
                // trailing: Image.asset(
                //   image,
                //   height: screenHeight * 0.035,
                // ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void faqCategories() {
    Provider.of<FaqBloc>(context, listen: false)
        .getFaqCategory()
        .then((value) => faqOutput(value));
  }

  faqOutput(String faqpayload) {
    print(faqpayload);
    var faqList = jsonDecode(faqpayload);
    if (faqpayload.contains("categoryId")) {
      Provider.of<FaqBloc>(context, listen: false).isLoading = false;
      setState(() {
        faq = faqList.map<Faq>((e) => Faq.fromJson(e)).toList();
      });
    } else {
      Provider.of<FaqBloc>(context, listen: false).isLoading = false;
      toast("An error occured, please try again");
    }
  }
}
