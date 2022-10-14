import 'dart:convert';
import 'dart:io';

import 'package:dms/layout/appWidget.dart';
import 'package:dms/screens/carts/ordercancelsuccess.dart';
import 'package:dms/screens/carts/verifyyotp.dart';
import 'package:dms/utils/colors.dart';
import 'package:dms/utils/next_screen.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../../blocs/cart_bloc.dart';
import '../../blocs/country_bloc.dart';
import '../../model/cart_item_model.dart';
import '../../network/network_utils.dart';
import '../../utils/animate_controller.dart';
import '../my_atc/save_order_success.dart';

class OrderSummary extends StatefulWidget {
  int? total;
  int? cartItemTotal;
  int? dmsOrderId;
  List<CartItem>? shoppingCarts = [];

  String? selectedDeliveryMethodCode;
  String? selectedPlantTypeCode;
  String? selectedTruckSizeCode;
  String? selectedStateCode;
  String? selectedCountryCode;
  DateTime? selectedDeliveryDate;
  String? city;
  String? address;

  OrderSummary({this.total, this.cartItemTotal, this.dmsOrderId, this.shoppingCarts, this.selectedDeliveryMethodCode, this.selectedPlantTypeCode, this.selectedTruckSizeCode, this.selectedStateCode, this.selectedDeliveryDate,this.city,this.address,  this.selectedCountryCode});

  @override
  _OrderSummaryState createState() => _OrderSummaryState();
}

class checklist {
  String title;
  checklist(this.title);
}

class _OrderSummaryState extends State<OrderSummary> {

  bool isLoading = false;

  List<checklist> myTitle = [
    checklist("Bag of Cement"),
    checklist("Bag of Sugar"),
    checklist("Bag of Rice"),
  ];
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    var formatter = NumberFormat("#,###,000");

    return ModalProgressHUD(
      inAsyncCall: isLoading,
      progressIndicator: AnimateWidget(),
      child: Scaffold(
        backgroundColor: appWhite,
        appBar: dmsAppBar(context, "", actions: [
          TextButton(
            onPressed: () {
              saveOrder();
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => SaveOrderSuccessScreen()));
            },
            child: Row(
              children: [
                Icon(
                  Icons.save,
                  size: _height * .024,
                ),
                SizedBox(
                  width: _width * 0.01,
                ),
                Text(
                  "Save Order",
                  style: GoogleFonts.poppins(
                    decoration: TextDecoration.underline,
                    color: appColorPrimary,
                    //fontWeight: FontWeight.w600,
                    fontSize: _height * .014,
                  ),
                ),
              ],
            ),
          ),
        ]),
        body: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _width * .075),
              child: Row(
                children: [
                  Text(
                    "Order Summary",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: _height * .028,
                      color: appColorPrimary,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: _height * .020),
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
                //color: appWhite,
                height: _height * .64,
                width: _width * .85,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(_width * .04, _height * .02,
                          _width * .04, _height * .02),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Products",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: _height * .02,
                                  color: Color(0xff333542)),
                            ),
                            SizedBox(
                              height: _height * .006,
                            ),
                            ...widget.shoppingCarts!.map(
                                    (e) => productLineItem(e, _height)),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     Text(
                            //       myTitle[0].title,
                            //       style: GoogleFonts.poppins(
                            //         fontSize: _height * .02,
                            //         fontWeight: FontWeight.w300,
                            //         color: Color(0xff7A7C85),
                            //       ),
                            //     ),
                            //     Text(
                            //       "${myTitle.length - 2}",
                            //       style: GoogleFonts.poppins(
                            //         fontSize: _height * .02,
                            //         fontWeight: FontWeight.w300,
                            //         color: Color(0xff7A7C85),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                          ]),
                    ),
                    SizedBox(height: _height * .01),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: _width * .05),
                      child: DottedLine(
                        dashColor: Color(0xffcbcbcb).withOpacity(0.6),
                      ),
                    ),
                    SizedBox(height: _height * .012),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: _width * .05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Delivery Type",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: _height * .02,
                                color: Color(0xff333542)),
                          ),
                          Text(
                            "Truck Size",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: _height * .02,
                                color: Color(0xff333542)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: _height * .002),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: _width * .05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                      Provider.of<CartBloc>(
                          context)
                          .selectedDeliveryMethod,
                            // widget.selectedDeliveryMethodCode!,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w300,
                                fontSize: _height * .017,
                                color: Color(0xff333542)),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 6,
                          ),
                          Text(
                              Provider.of<CartBloc>(
                                  context)
                                  .selectedTruckSize,
                            // widget.selectedTruckSizeCode!,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w300,
                                fontSize: _height * .017,
                                color: Color(0xff333542)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: _height * .012),
                    SizedBox(height: _height * .01),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: _width * .05),
                      child: DottedLine(
                        dashColor: Color(0xffcbcbcb).withOpacity(0.6),
                      ),
                    ),
                    SizedBox(height: _height * .012),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: _width * .05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Delivery Date",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: _height * .019,
                                color: Color(0xff333542)),
                          ),
                          Text(
                            "Product Quantity",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: _height * .019,
                                color: Color(0xff333542)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: _height * .004),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: _width * .05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${widget.selectedDeliveryDate!.day}/${widget.selectedDeliveryDate!.month}/${widget.selectedDeliveryDate!.year}",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w300,
                                fontSize: _height * .017,
                                color: Color(0xff333542)),
                          ),
                          Text(
                            widget.cartItemTotal.toString(),
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w300,
                                fontSize: _height * .017,
                                color: Color(0xff333542)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: _height * .012),
                    SizedBox(height: _height * .01),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: _width * .05),
                      child: DottedLine(
                        dashColor: Color(0xffcbcbcb).withOpacity(0.6),
                      ),
                    ),
                    SizedBox(height: _height * .01),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: _width * .05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Delivery Address",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: _height * .019,
                                color: Color(0xff333542)),
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(height: _height * .02),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: _width * .05),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Text(
                    //         "",
                    //         style: GoogleFonts.poppins(
                    //             fontWeight: FontWeight.w300,
                    //             fontSize: _height * .02,
                    //             color: Color(0xff7A7C85)),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    SizedBox(height: _height * .01),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: _width * .05),
                      child: Text(
                        "${widget.address},\n ${widget.city} ${Provider.of<CountryBloc>(context).State}",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w300,
                            fontSize: _height * .02,
                            color: Color(0xff7A7C85)),
                        textAlign: TextAlign.justify,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 10,
                      ),
                    ),
                    SizedBox(height: _height * .012),
                    SizedBox(height: _height * .01),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: _width * .05),
                      child: DottedLine(
                        dashColor: Color(0xffcbcbcb).withOpacity(0.6),
                      ),
                    ),
                    SizedBox(height: _height * .012),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: _width * .05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Price",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: _height * .02,
                                color: Color(0xff7A7C85)),
                          ),
                          Text(
                            "N${formatter.format(widget.total)}",
                            style: GoogleFonts.poppins(
                                fontSize: _height * .024,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff27AE60)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: _height * .034,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _width * .05),
              child: Row(children: [
                InkWell(
                  onTap: () {
                    submitOrder();
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => VerifyyOTP()));
                  },
                  child: Center(
                    child: Container(
                      height: _height * .0633,
                      width: _width * .9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        color: appColorPrimary,
                      ),
                      child: Center(
                        child: Text(
                          "Confirm",
                          style: GoogleFonts.poppins(
                            color: appWhite,
                            fontWeight: FontWeight.w500,
                            fontSize: _height * .0174,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            SizedBox(
              height: _height * .02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _width * .05),
              child: Row(children: [
                InkWell(
                  onTap: () {
                    // showDialog(
                    //     context: context,
                    //     builder: (BuildContext context) {
                    //       return _myDialog(context);
                    //     });
                    showGeneralDialog(
                      context: context,
                      pageBuilder: (ctx, a1, a2) {
                        return Container();
                      },
                      transitionBuilder: (ctx, a1, a2, child) {
                        var curve = Curves.easeInOut.transform(a1.value);
                        return Transform.scale(
                          scale: curve,
                          child: _myDialog(ctx),
                        );
                      },
                      transitionDuration: const Duration(milliseconds: 300),
                    );
                  },
                  child: Center(
                    child: Container(
                      height: _height * .0633,
                      width: _width * .9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        border: Border.all(color: appColorPrimary),
                        color: appWhite,
                      ),
                      child: Center(
                        child: Text(
                          "Cancel",
                          style: GoogleFonts.poppins(
                            color: Color(0xff000000),
                            fontWeight: FontWeight.w500,
                            fontSize: _height * .0174,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ]),
        ),
      ),
    );
  }

  Widget _myDialog(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    var containerheight = _height * .5142;
    var _mypadding = SizedBox(height: containerheight * .12);
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        height: containerheight,
        //color: Colors.black,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              _mypadding,
              Image.asset(
                "lib/assets/dmsquestionmark.png",
                height: _height * .142,
                width: _width * .307,
                //width: 31.71,
              ),
              _mypadding,
              Text(
                "Are you sure you want to",
                style: GoogleFonts.poppins(
                  color: Color(0xff8D93A1),
                  fontSize: _height * .02,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "Cancel Order",
                style: GoogleFonts.poppins(
                  color: Color(0xff8D93A1),
                  fontSize: _height * .02,
                  fontWeight: FontWeight.w400,
                ),
              ),
              _mypadding,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _width * .09365),
                child: Row(children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      //color: Color(0xffFFFFFF),
                      width: _width * .382,
                      height: _height * .0633,
                      child: Center(
                          child: Text(
                        "No",
                        style: GoogleFonts.poppins(
                          fontSize: _height * .0174,
                          color: Color(0xff000000),
                        ),
                      )),
                      decoration: BoxDecoration(
                        border: Border.all(color: appColorPrimary),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: _width * .0487,
                  ),
                  InkWell(
                    onTap: () {
                      // cancelOrder();
                      nextScreen(context, OrderCancel());
                    },
                    child: Container(
                      width: _width * .382,
                      height: _height * .0633,
                      decoration: const BoxDecoration(
                        color: appColorPrimary,
                      ),
                      child: Center(
                          child: Text(
                        "Yes",
                        style: GoogleFonts.poppins(
                          color: white,
                          fontSize: _height * .0174,
                        ),
                      )),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget productLineItem(CartItem shoppingCart, _height){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          shoppingCart.product!.name!,
          style: GoogleFonts.poppins(
            fontSize: _height * .02,
            fontWeight: FontWeight.w300,
            color: Color(0xff7A7C85),
          ),
        ),
        Text(
          shoppingCart.quantity.toString(),
          style: GoogleFonts.poppins(
            fontSize: _height * .02,
            fontWeight: FontWeight.w300,
            color: Color(0xff7A7C85),
          ),
        ),
      ],
    );
  }

  void saveOrder() async {
    final CartBloc cb = Provider.of<CartBloc>(context, listen: false);
    final baseUrl = cb.cartBaseUrl;
    final countryCode = cb.countryCode;
    try {

      setState(() {
        isLoading = true;
      });
      Map req = {
        "dmsOrderId": widget.dmsOrderId,
        "truckSizeCode": widget.selectedTruckSizeCode,
        "deliveryMethodCode": widget.selectedDeliveryMethodCode,
        "plantCode": widget.selectedPlantTypeCode,
        "deliveryAddress": widget.address,
        "deliveryCity": widget.city,
        "deliveryStateCode": widget.selectedStateCode,
        "deliveryCountryCode": countryCode,
        "deliveryDate": widget.selectedDeliveryDate!.toIso8601String()
      };
      var response = await postRequestWithToken('$baseUrl/order/dms/save', req);

      if (this.mounted) {
        if (response.statusCode == 200) {
          var decodedData = jsonDecode(response.body);
          // String newdata = decodedData["data"];
          setState(() {
            isLoading = false;
          });
          toast(decodedData["message"], length: Toast.LENGTH_LONG);

          nextScreen(context, SaveOrderSuccessScreen());
        }
      }
    } on SocketException {
      setState(() {
        isLoading = false;
      });
      throw 'No Internet connection';
    }
  }

  void submitOrder() async {
    final CartBloc cb = Provider.of<CartBloc>(context, listen: false);
    final baseUrl = cb.cartBaseUrl;
    final countryCode = cb.countryCode;
    try {

      setState(() {
        isLoading = true;
      });

      Map req = {
        "dmsOrderId": widget.dmsOrderId,
        "truckSizeCode": widget.selectedTruckSizeCode,
        "deliveryMethodCode": widget.selectedDeliveryMethodCode,
        "plantCode": widget.selectedPlantTypeCode,
        "deliveryAddress": widget.address,
        "deliveryCity": widget.city,
        "deliveryStateCode": widget.selectedStateCode,
        "deliveryCountryCode": countryCode,
        "deliveryDate": widget.selectedDeliveryDate!.toIso8601String()
      };

      var response = await postRequestWithToken('$baseUrl/order/dms/order/submit', req);

      if (this.mounted) {
        if (response.statusCode == 200) {
          var decodedData = jsonDecode(response.body);
          var newdata = decodedData["data"]["otp"]["otpid"];
          setState(() {
            isLoading = false;
          });
          toast(decodedData["message"], length: Toast.LENGTH_LONG);
          nextScreen(context, VerifyOtp(otpId: newdata,));

        }else if(response.body.isJson()){
          var data = jsonDecode(response.body);
          print(data);
          toast(data['message'], length: Toast.LENGTH_LONG);
          setState(() {
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

  void cancelOrder() async {
    final CartBloc cb = Provider.of<CartBloc>(context, listen: false);
    final baseUrl = cb.cartBaseUrl;
    final distributorsapId = cb.distributorSapAccountId;
    try {

      setState(() {
        isLoading = true;
      });
      Map req = {
          "dmsOrderId": widget.dmsOrderId,
          "orderSapNumber": "549765",
          "distributorSapAccountId": distributorsapId,
      };
      var response = await patchRequestWithToken('$baseUrl/order/dms/cancel', req);

      if (this.mounted) {
        if (response.statusCode.isSuccessful()) {
          var decodedData = jsonDecode(response.body);
          setState(() {
            isLoading = false;
          });
          toast(decodedData["message"], length: Toast.LENGTH_LONG);

          nextScreen(context, OrderCancel());
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
