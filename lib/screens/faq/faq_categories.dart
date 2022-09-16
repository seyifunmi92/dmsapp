import 'package:dms/constant.dart';
import 'package:dms/layout/appWidget.dart';
import 'package:dms/layout/dms_drawer.dart';
import 'package:dms/screens/faq/faq_category_selected.dart';
import 'package:dms/utils/colors.dart';
import 'package:dms/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FAQCategories extends StatefulWidget {
  FAQCategories({Key? key}) : super(key: key);

  @override
  State<FAQCategories> createState() => _FAQCategoriesState();
}

class _FAQCategoriesState extends State<FAQCategories> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool menuClicked = false;

  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    final _screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
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
            //text("FAQ Categories", isBoldText: true, fontSize: 28.0),
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FAQCategorySelected()));
                },
                child: Padding(
                    padding: EdgeInsets.all(_screenWidth * 0.01),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Column(
                        children: [
                          itemCard(
                              context, _screenHeight, "Account", personIcon),
                          SizedBox(
                            height: _screenHeight * 0.02,
                          ),
                          itemCard(context, _screenHeight, "Orders", orderIcon),
                          SizedBox(
                            height: _screenHeight * 0.02,
                          ),
                          itemCard(context, _screenHeight, "Delivery Schedule",
                              deliveryIcon),
                          SizedBox(
                            height: _screenHeight * 0.02,
                          ),
                          itemCard(context, _screenHeight,
                              "Authority to Collect (ATC)", atcIcon),
                          SizedBox(
                            height: _screenHeight * 0.02,
                          ),
                          itemCard(
                              context, _screenHeight, "Wallets", walletIcon),
                          SizedBox(
                            height: _screenHeight * 0.02,
                          ),
                          itemCard(
                              context, _screenHeight, "Others", othersIcon),
                        ],
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget itemCard(
      BuildContext context, double screenHeight, String title, String image) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: screenHeight * .095,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurStyle: BlurStyle.outer,
            blurRadius: 8,
            spreadRadius: 0,
            offset: Offset.zero,
          ),
        ],
        color: appWhite,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: ListTile(
          leading: Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: MediaQuery.of(context).size.height * .019,
              color: Color(0xff000000),
              fontWeight: FontWeight.w400,
            ),
          ),
          selectedTileColor: Theme.of(context).primaryColor,
          selectedColor: Theme.of(context).dividerColor,
          // minLeadingWidth: double.maxFinite,
          trailing: Image.asset(
            image,
            height: screenHeight * 0.035,
          ),
        ),
      ),
    );
  }
}
