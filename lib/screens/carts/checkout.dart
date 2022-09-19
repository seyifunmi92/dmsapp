import 'dart:convert';
import 'dart:io';

import 'package:dms/constant.dart';
import 'package:dms/layout/appWidget.dart';
import 'package:dms/screens/accounts/accountdelete.dart';
import 'package:dms/screens/auth/confirm_otp.dart';
import 'package:dms/screens/auth/login_screen.dart';
import 'package:dms/screens/auth/new_distributor_notice.dart';
import 'package:dms/screens/auth/password_reset/input_new_password.dart';
import 'package:dms/screens/auth/password_reset/password_reset_request.dart';
import 'package:dms/screens/auth/register_screen_contd.dart';
import 'package:dms/screens/carts/carts.dart';
import 'package:dms/screens/carts/cartscheduledelivery.dart';
import 'package:dms/screens/carts/ordersummary.dart';
import 'package:dms/screens/dashboard/dashboard.dart';
import 'package:dms/screens/faq/faq_categories.dart';
import 'package:dms/screens/my_atc/my_atc_detail.dart';
import 'package:dms/screens/my_atc/schedule_delivery.dart';
import 'package:dms/screens/products/productDetails.dart';
import 'package:dms/splashscreen/splashscreen.dart';
import 'package:dms/screens/support/new_support_request.dart';
import 'package:dms/utils/colors.dart';
import 'package:dms/utils/next_screen.dart';
import 'package:dms/utils/theme.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../../blocs/cart_bloc.dart';
import '../../layout/loading_indicator_widget.dart';
import '../../model/cart_item_model.dart';
import '../../network/network_utils.dart';

class Checkout extends StatefulWidget {
  int total;
  int cartTotal;
  Checkout(this.total, this.cartTotal);

  @override
  _CheckoutState createState() => _CheckoutState();
}

class checklist {
  String title;
  checklist(this.title);
}

class _CheckoutState extends State<Checkout> {

  bool isLoading = false;
  List<CartItem> shoppingCarts = [];



  List<checklist> myTitle = [
    checklist("Bag of Cement"),
    checklist("Bag of Sugar"),
    checklist("Bag of Rice"),
  ];
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    var containerwidth = _width * .85;
    var containerheight = _height * .32;

    addCost() async {
      int sum = 0;
      for (var i = 0; i < shoppingCarts.length; i++) {
        sum += shoppingCarts[i].product!.price!;
      }

      return sum;
    }
    var formatter = NumberFormat("#,###,000");
    return Scaffold(
      backgroundColor: appWhite,
      appBar: dmsAppBar(context, ""),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          SizedBox(
            height: _height * .018,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: _width * .075),
            child: Row(
              children: [
                Text(
                  "Checkout",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: _height * .02814,
                    color: appColorPrimary,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: _height * .014),
          shoppingCarts.isEmpty ? LoadingIndicatorWidget() : Container(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: _width * .075),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurStyle: BlurStyle.outer,
                    blurRadius: 10,
                    spreadRadius: 0,
                    offset: Offset.zero,
                  ),
                ],
                color: appWhite,
              ),
              // color: appWhite,
              height: _height * .3565,
              width: _width * .85,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(_width * .04, _height * .012,
                        _width * .04, _height * .012),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Products",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: _height * .0211,
                                color: Color(0xff333542)),
                          ),
                          SizedBox(
                            height: _height * .0059,
                          ),
                          ...shoppingCarts.map(
                                  (e) => itemListName(e.product!.name!, _height))
                          // Text(
                          //   myTitle[0].title,
                          //   style: GoogleFonts.poppins(
                          //     fontSize: _height * .019,
                          //     fontWeight: FontWeight.w300,
                          //     color: Color(0xff7A7C85),
                          //   ),
                          // ),
                          // SizedBox(height: _height * .004),
                          // Text(
                          //   myTitle[1].title,
                          //   style: GoogleFonts.poppins(
                          //     fontSize: _height * .019,
                          //     fontWeight: FontWeight.w300,
                          //     color: Color(0xff7A7C85),
                          //   ),
                          // ),
                          // SizedBox(height: _height * .004),
                          // Text(
                          //   myTitle[2].title,
                          //   style: GoogleFonts.poppins(
                          //     fontSize: _height * .019,
                          //     fontWeight: FontWeight.w300,
                          //     color: Color(0xff7A7C85),
                          //   ),
                          // ),
                        ]),
                  ),
                  SizedBox(
                    height: _height * .0188,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: _width * .05),
                    child: DottedLine(
                      dashColor: Color(0xffcbcbcb).withOpacity(0.6),
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: _width * .05),
                  //   child: Divider(
                  //     height: _height * .01,
                  //     color: Color(0xffCBCBCB),
                  //   ),
                  // ),
                  SizedBox(height: _height * .0234),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: _width * .05),
                    child: Text(
                      "Product Quantity",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: _height * .0188,
                          color: Color(0xff333542)),
                    ),
                  ),
                  SizedBox(height: _height * .003),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: _width * .05),
                    child: Text(
                      shoppingCarts.length.toString(),
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w300,
                          fontSize: _height * .0188,
                          color: Color(0xff333542)),
                    ),
                  ),
                  SizedBox(
                    height: _height * .0188,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: _width * .05),
                    child: DottedLine(
                      dashColor: Color(0xffcbcbcb).withOpacity(0.6),
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: _width * .05),
                  //   child: Divider(
                  //     height: _height * .01,
                  //     color: Color(0xffCBCBCB),
                  //   ),
                  // ),
                  SizedBox(height: _height * .0188),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: _width * .05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Price",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: _height * .0188,
                              color: Color(0xff7A7C85)),
                        ),

                        FutureBuilder(
                          future: addCost(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              var _total = snapshot.data!;
                              return Text(
                                "\N${formatter.format(_total)}.00",
                                style: GoogleFonts.poppins(
                                    fontSize: _height * .023,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff27AE60)),
                              );
                            } else {
                              return CircularProgressIndicator();
                            }
                          },
                        ),

                        // Text(
                        //   "N${formatter.format(widget.total)}.00",
                        //   style: GoogleFonts.poppins(
                        //       fontSize: _height * .023,
                        //       fontWeight: FontWeight.w700,
                        //       color: Color(0xff27AE60)),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: _height * .35,
          ),
          FutureBuilder(
            future: addCost(),
            builder: (context, snapshot) {
      if (snapshot.hasData) {
      var _total = snapshot.data!;
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: _width * .05),
        child: Row(children: [
          Center(
            child: InkWell(
              onTap: () {
                processCheckout(int.parse(_total.toString()));
              },
              child: Container(
                height: _height * .0633,
                width: _width * .9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  color: appColorPrimary,
                ),
                child: Center(
                  child: Text(
                    "Schedule Delivery",
                    style: GoogleFonts.poppins(
                      color: appWhite,
                      fontWeight: FontWeight.w600,
                      fontSize: _height * .017,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]),
      );
    }else {
        return CircularProgressIndicator();
      }
            }
          ),


        ]),
      ),
    );
  }


  Widget itemListName(String name, double _height){
    return Padding(
      padding: EdgeInsets.only(bottom: _height * .004),
      child: Text(
        name,
        style: GoogleFonts.poppins(
          fontSize: _height * .019,
          fontWeight: FontWeight.w300,
          color: Color(0xff7A7C85),
        ),
      ),
    );
  }

  void getAllCartItem() async {

    final CartBloc cb = Provider.of<CartBloc>(context, listen: false);
    final baseUrl = cb.cartBaseUrl;
    print(baseUrl);
    try {

      setState(() {
        isLoading = true;
      });
      var response = await getRequestWithToken('$baseUrl/cart');

      if (this.mounted) {
        if (response.statusCode == 200) {
          var decodedData = jsonDecode(response.body);
          List? newdata = decodedData["data"]["shoppingCart"]["shoppingCartItems"];
          setState(() {
            shoppingCarts = newdata!.map((m) => CartItem.fromJson(m)).toList();
            isLoading = false;
          });
        }
      }
    } on SocketException {
      setState(() {
        isLoading = false;
      });
      throw 'No Internet connection';
    }
  }

  void processCheckout(_total) async {
    try {

      setState(() {
        isLoading = true;
      });
      Map req = {"channelCode": "Mobile"};
      var response = await postRequestWithToken('https://dms-order-ms.azurewebsites.net/api/order/cart/checkout', req);

      if (this.mounted) {
        if (response.statusCode == 200) {
          var decodedData = jsonDecode(response.body);
          int newdata = decodedData["data"]["dmsOrder"]["dmsOrderId"];
          setState(() {
            isLoading = false;
          });
          nextScreen(context, Schedule(int.parse(_total.toString()), shoppingCarts.length, newdata));

        }
      }
    } on SocketException {
      setState(() {
        isLoading = false;
      });
      throw 'No Internet connection';
    }
  }
}
