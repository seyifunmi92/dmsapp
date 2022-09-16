import 'package:dms/constant.dart';
import 'package:dms/layout/appWidget.dart';
import 'package:dms/screens/accounts/accountdelete.dart';
import 'package:dms/screens/auth/confirm_otp.dart';
import 'package:dms/screens/auth/login_screen.dart';
import 'package:dms/screens/auth/new_distributor_notice.dart';
import 'package:dms/screens/auth/password_reset/input_new_password.dart';
import 'package:dms/screens/auth/password_reset/password_reset_request.dart';
import 'package:dms/screens/auth/register_screen_contd.dart';
import 'package:dms/screens/dashboard/dashboard.dart';
import 'package:dms/screens/faq/faq_categories.dart';
import 'package:dms/screens/my_atc/my_atc_detail.dart';
import 'package:dms/splashscreen/splashscreen.dart';
import 'package:dms/screens/support/new_support_request.dart';
import 'package:dms/utils/colors.dart';
import 'package:dms/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';

class OrderItems extends StatefulWidget {
  const OrderItems({Key? key}) : super(key: key);
  @override
  _OrderItemsState createState() => _OrderItemsState();
}

class orderItems {
  String imageUrl;
  String title;
  String sapID;
  String quantity;
  String amount;
  orderItems(this.imageUrl, this.title, this.sapID, this.quantity, this.amount);
}

class _OrderItemsState extends State<OrderItems> {
  List<orderItems> myItems = [
    orderItems(
        "lib/assets/dang.png", "Bags of Cement", "SAP1234353", "300", "1650"),
    orderItems(
        "lib/assets/dang.png", "Bags of Cement", "SAP1234353", "300", "1650"),
    orderItems(
        "lib/assets/dang.png", "Bags of Cement", "SAP1234353", "300", "1650"),
    orderItems(
        "lib/assets/dang.png", "Bags of Cement", "SAP1234353", "300", "1650"),
    orderItems(
        "lib/assets/dang.png", "Bags of Cement", "SAP1234353", "300", "1650"),
  ];
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    var mypadr = SizedBox(width: _width * .04);
    return Scaffold(
      backgroundColor: appWhite,
      appBar: dmsAppBar(context, ""),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: _width * .04),
            child: Row(
              children: [
                Text(
                  "Order Items",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: _height * .03,
                    color: appColorPrimary,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: _height * .013),
          Expanded(
            child: ListView.builder(
                itemCount: myItems.length > 6 ? 5 : myItems.length,
                itemBuilder: (BuildContext context, int index) {
                  var _listD = myItems[index];
                  return InkWell(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(_width * .04, _height * .018,
                          _width * .04, _height * .018),
                      child: Container(
                        decoration: BoxDecoration(
                          color: appWhite,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurStyle: BlurStyle.outer,
                              blurRadius: 10,
                              spreadRadius: 0,
                              offset: Offset.zero,
                            ),
                          ],
                        ),
                        width: _width * 85,
                        height: _height * .148,
                        // color: appWhite,
                        child: Padding(
                          padding: EdgeInsets.all(_width * .03),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: _width * .16,
                                height: _height * .105,
                                child: Image.asset(
                                  _listD.imageUrl,
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                              mypadr,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _listD.title,
                                    style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.w700,
                                      fontSize: _height * .02,
                                      color: Color(0xff343434),
                                    ),
                                  ),
                                  SizedBox(height: _height * .002),
                                  Text(
                                    _listD.sapID,
                                    style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.w400,
                                      fontSize: _height * .014,
                                      color: Color(0xff8F9090),
                                    ),
                                  ),
                                  SizedBox(height: _height * .0023),
                                  Text(
                                    "Quantity : ${_listD.quantity} Bags",
                                    style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.w400,
                                      fontSize: _height * .012,
                                      color: Color(0xff8F9090),
                                    ),
                                  ),
                                  SizedBox(height: _height * .0023),
                                  Text(
                                    "N${_listD.amount}",
                                    style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.w700,
                                      fontSize: _height * .02,
                                      color: Color(0xff27AE60),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
