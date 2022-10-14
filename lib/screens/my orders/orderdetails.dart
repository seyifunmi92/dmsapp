import 'dart:convert';
import 'package:dms/constant.dart';
import 'package:dms/layout/appWidget.dart';
import 'package:dms/layout/loading_indicator_widget.dart';
import 'package:dms/model/cart_item_model.dart';
import 'package:dms/model/ordermodels.dart';
import 'package:dms/screens/accounts/accountdelete.dart';
import 'package:dms/screens/auth/confirm_otp.dart';
import 'package:dms/screens/auth/login_screen.dart';
import 'package:dms/screens/auth/new_distributor_notice.dart';
import 'package:dms/screens/auth/password_reset/input_new_password.dart';
import 'package:dms/screens/auth/password_reset/password_reset_request.dart';
import 'package:dms/screens/auth/register_screen_contd.dart';
import 'package:dms/screens/carts/cartscheduledelivery.dart';
import 'package:dms/screens/dashboard/dashboard.dart';
import 'package:dms/screens/faq/faq_categories.dart';
import 'package:dms/screens/my%20orders/orderhistory.dart';
import 'package:dms/screens/my%20orders/orderitems.dart';
import 'package:dms/screens/my_atc/my_atc_detail.dart';
import 'package:dms/screens/my_atc/myatcbg.dart';
import 'package:dms/screens/my_atc/myatcc.dart';
import 'package:dms/services/orderservices.dart';
import 'package:dms/splashscreen/splashscreen.dart';
import 'package:dms/screens/support/new_support_request.dart';
import 'package:dms/utils/colors.dart';
import 'package:dms/utils/theme.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class OrderDetails extends StatefulWidget {
  int orderId;
  String accountType;
  OrderDetails(this.orderId, this.accountType);

  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  int totalA = 0;
  double totB = 0;
  bool noAtc = false;
  final _format = NumberFormat("#,###,000.00");
  List<OrderItem9>? _itemDms;
  List<CartItem>? itemD;
  DmsOrder9? _itemOrder;
  GetSapOrderDetails? _getsapdetails;
  TotalyPrice? _total;
  TotalyQuantity? qtotal;
  @override
  void initState() {
    _orderDetails(widget.orderId);
    Provider.of<OrderBloc>(context, listen: false).isLoading = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.accountType == "CC"
        ? Provider.of<OrderBloc>(context, listen: false).isBG = false
        : Provider.of<OrderBloc>(context, listen: false).isBG = true;

    double _height = MediaQuery.of(context).size.height;
    return Provider.of<OrderBloc>(context, listen: false).isLoading
        ? Scaffold(
            body: Center(child: LoadingIndicatorWidget()),
          )
        : Scaffold(
            backgroundColor: appWhite,
            appBar: dmsAppBar(context, "", actions: [
              TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Text(
                      "Download Receipt",
                      style: GoogleFonts.poppins(
                        color: appColorPrimary,
                        fontWeight: FontWeight.w500,
                        fontSize: _height * .012,
                      ),
                    ),
                  ],
                ),
              ),
            ]),
            body: _body(context),
          );
  }

  Widget _body(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    var contHeight = MediaQuery.of(context).size.height * .71;
    var mypadr = SizedBox(width: _width * .04);
    var mypadh = SizedBox(height: _height * .008);
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: _width * .04),
            child: Column(
              children: [
                SizedBox(
                  height: _height * 0.026,
                ),
                Row(
                  children: [
                    Text(
                      "Order Details",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: _height * .03,
                        color: appColorPrimary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          mypadh,
          Row(
            children: [
              mypadr,
              Container(
                width: _width * .92,
                height: _height * .73,
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
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: Column(children: [
                    SizedBox(height: _height * .02),
                    Row(
                      children: [
                        mypadr,
                        Text(
                          "Order Items",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: _height * .02,
                            color: Color(0xff333542),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: _height * .006),
                    ..._itemDms!.map((e) => itemsCustom(e)),
                    SizedBox(height: contHeight * .005),
                    SizedBox(height: _height * 0.03),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: _width * .05),
                      child: DottedLine(
                        dashColor: Color(0xffcbcbcb).withOpacity(0.6),
                      ),
                    ),
                    SizedBox(
                      height: _height * .02,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: _width * .04),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Order ID",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              color: Color(0xff333542),
                              fontSize: _height * .02,
                            ),
                          ),
                          Text(
                            "Product Quantity",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              color: Color(0xff333542),
                              fontSize: _height * .02,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: _height * .004,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: _width * .04),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //mypadr,
                          Text(
                            "OR${_itemOrder!.id}",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w300,
                              color: Color(0xff333542),
                              fontSize: _height * .016,
                            ),
                          ),
                          Text(
                            qtotal!.totalQuantity.toString(),
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w300,
                              color: Color(0xff333542),
                              fontSize: _height * .016,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: _height * .02,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: _width * .05),
                      child: DottedLine(
                        dashColor: Color(0xffcbcbcb).withOpacity(0.6),
                      ),
                    ),
                    SizedBox(
                      height: _height * .02,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: _width * .04),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Delivery Date",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              color: Color(0xff333542),
                              fontSize: _height * .02,
                            ),
                          ),
                          Text(
                            "Order Reason",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              color: Color(0xff333542),
                              fontSize: _height * .02,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: _height * .004,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: _width * .04),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _itemOrder!.deliveryDate != null
                              ? Text(
                                  _itemOrder!.deliveryDate!.day.toString() +
                                      "-" +
                                      _itemOrder!.deliveryDate!.month
                                          .toString() +
                                      "-" +
                                      _itemOrder!.deliveryDate!.year.toString(),
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w300,
                                    color: Color(0xff333542),
                                    fontSize: _height * .016,
                                  ),
                                )
                              : Text(""),
                          Text(
                            "Sales",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w300,
                              color: Color(0xff333542),
                              fontSize: _height * .016,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: _height * .025,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: _width * .05),
                      child: DottedLine(
                        dashColor: Color(0xffcbcbcb).withOpacity(0.6),
                      ),
                    ),
                    SizedBox(
                      height: _height * .014,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: _width * .04),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //mypadr,
                          Text(
                            "Status",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              color: Color(0xff333542),
                              fontSize: _height * .02,
                            ),
                          ),

                          Text(
                            "",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w300,
                              color: Color(0xff333542),
                              fontSize: _height * .02,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: contHeight * .005,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: _width * .04),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _itemOrder!.orderStatus!.code.toString(),
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w300,
                              color: Color(0xff333542),
                              fontSize: _height * .016,
                            ),
                          ),
                          Text(
                            "",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w300,
                              color: Color(0xff333542),
                              fontSize: _height * .02,
                            ),
                          ),
                        ],
                      ),
                    ),
                    //mypadh,
                    SizedBox(
                      height: _height * .020,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: _width * .05),
                      child: DottedLine(
                        dashColor: Color(0xffcbcbcb).withOpacity(0.6),
                      ),
                    ),
                    SizedBox(
                      height: _height * .02,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: _width * .04),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //mypadr,
                          Text(
                            "Delivery Address",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              color: Color(0xff333542),
                              fontSize: _height * .02,
                            ),
                          ),

                          Text(
                            "",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              color: Color(0xff333542),
                              fontSize: _height * .02,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: _height * .02,
                    ),
                    Row(
                      children: [
                        mypadr,
                        _itemOrder!.deliveryAddress != null
                            ? Text(
                                _itemOrder!.deliveryAddress!,
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff7A7C85),
                                  fontSize: _height * .02,
                                ),
                              )
                            : Text(""),
                      ],
                    ),
                    SizedBox(
                      height: _height * .01,
                    ),
                    Row(
                      children: [
                        mypadr,
                        Text(
                          "",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            color: Color(0xff7A7C85),
                            fontSize: _height * .02,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: _height * .03,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: _width * .05),
                      child: DottedLine(
                        dashColor: Color(0xffcbcbcb).withOpacity(0.6),
                      ),
                    ),

                    SizedBox(
                      height: _height * .015,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: _width * .04),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Price",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              color: Color(0xff7A7C85),
                              fontSize: _height * .02,
                            ),
                          ),
                          Text(
                            _itemOrder!.estimatedNetValue != 0.00
                                ? "\N${_format.format(_total!.totalPrice)}"
                                : "\N0.00",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w700,
                              color: Color(0xff27AE60),
                              fontSize: _height * .024,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
            ],
          ),
          SizedBox(height: _height * .01),
          noAtc == true
              ? Row(
                  children: [
                    mypadr,
                    InkWell(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => Schedule(
                        //             _itemOrder!.estimatedNetValue!.toInt(),
                        //             _itemOrder!.orderItems!.length,
                        //             _itemOrder!.id,
                        //             itemD != null ? itemD! : List.empty(),
                        //             _itemDms!,
                        //             "New/Saved")));
                      },
                      child: Container(
                        width: _width * .92,
                        height: _height * .0633,
                        decoration: BoxDecoration(
                          color: appColorPrimary,
                        ),
                        child: Center(
                            child: Text(
                          "Proceed To Schedule",
                          style: GoogleFonts.poppins(
                            color: white,
                            fontSize: _height * .016,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                      ),
                    ),
                  ],
                )
              : Row(
                  children: [
                    mypadr,
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Provider.of<OrderBloc>(
                                            context,
                                            listen: false)
                                        .isBG
                                    ? MyAtcBg()
                                    : MyATCC(
                                        _itemOrder!.distributorSapAccount!
                                            .distributorSapAccountId!,
                                        _itemOrder!.orderSapNumber)));
                      },
                      child: Container(
                        width: _width * .92,
                        height: _height * .0633,
                        decoration: BoxDecoration(
                          //border: Border.all(color: Color(0xffB1BBC6)),
                          color: appColorPrimary,
                        ),
                        child: Center(
                            child: Text(
                          "View ATCs",
                          style: GoogleFonts.poppins(
                            color: white,
                            fontSize: _height * .016,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                      ),
                    ),
                  ],
                ),
          SizedBox(
            height: _height * .01,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: _width * .04),
            child: Row(children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => OrderHistory())));
                },
                child: Center(
                  child: Container(
                    height: _height * .0633,
                    width: _width * .92,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                      border: Border.all(color: appColorPrimary),
                      color: appWhite,
                    ),
                    child: Center(
                      child: Text(
                        "View Order History",
                        style: GoogleFonts.poppins(
                          color: Color(0xff000000),
                          fontWeight: FontWeight.w500,
                          fontSize: _height * .016,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ),
          SizedBox(
            height: _height * .1,
          ),
        ],
      ),
    );
  }

  Widget itemsCustom(OrderItem9 _order) {
    var _productQty = _order.product!.name!.length;
    print(_productQty);
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _width * .04),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            _order.product!.name!,
            style: GoogleFonts.poppins(
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.w500,
              fontSize: _height * .02,
              color: Color(0xff100C57),
            ),
          ),
          Text(
            _order.quantity.toString(),
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w300,
              fontSize: _height * .02,
              color: Color(0xff7A7C85),
            ),
          ),
        ],
      ),
    );
  }

  priceTotal() async {
    double totalPrice = 0;
    _itemDms != null
        ? _itemDms!.forEach((element) {
            totalPrice += element.product!.price! * element.quantity!.toInt();
            print(totalPrice);
          })
        : null;
    return totalPrice;
  }

  qtyTotal() async {
    double totalQuantity = 0;
    _itemDms != null
        ? _itemDms!.forEach((element) {
            totalQuantity += element.quantity!.toDouble();
            print(totalQuantity);
          })
        : null;
    return totalQuantity;
  }

  myOut(double totalQ) {
    if (totalQ != bool) {
      var myQuantity = jsonDecode(totalQ.toString());
      if (myQuantity.toString().contains(".")) {
        setState(() {
          qtotal = TotalyQuantity(totalQuantity: totalQ);
        });
      } else {
        print("Error Occured");
      }
    }
  }

  pOutput(double totalP) {
    if (totalP != bool) {
      var myPrice = jsonDecode(totalP.toString());
      if (myPrice.toString().contains(".")) {
        setState(() {
          _total = TotalyPrice(totalPrice: totalP);
        });
      } else {
        print("Exception Occured");
      }
    }
  }

  void _orderDetails(int orderId) {
    Provider.of<OrderBloc>(context, listen: false)
        .getDMSOrderdetails(widget.orderId)
        .then((value) => _output(value));
  }

  _output(String _orderD) {
    print("Lets get dms order details now");
    var dataT = jsonDecode(_orderD);
    if (_orderD.contains("data")) {
      if (dataT["status"] == "Successful") {
        var mData = dataT["data"]["dmsOrder"];
        var myD2 = dataT["data"]["dmsOrder"]["orderItems"];
        List _listyy = myD2;
        Provider.of<OrderBloc>(context, listen: false).isLoading = false;
        setState(() {
          _itemDms =
              _listyy.map<OrderItem9>((e) => OrderItem9.fromJson(e)).toList();
          _itemOrder = DmsOrder9.fromJson(mData);
        });
        priceTotal().then((myValue) => pOutput(myValue));
        qtyTotal().then((value) => myOut(value));
        if (dataT["data"]["dmsOrder"]["orderSapNumber"] == null) {
          setState(() {
            noAtc = true;
          });
        }
      } else if (dataT["responseCode" == 401]) {
        Provider.of<OrderBloc>(context, listen: false).isLoading = false;
        toast("Unauthorized Request");
      } else if (dataT["responseCode" == 404]) {
        Provider.of<OrderBloc>(context, listen: false).isLoading = false;
        toast("Not Found");
      } else {
        setState(() {
          Provider.of<OrderBloc>(context, listen: false).isLoading = false;
          toast(dataT["message"]);
        });
      }
    }
  }

  _sapOutput(String sapDetails) {
    print("Lets get SAP order details now");
    var dataT2 = jsonDecode(sapDetails);
    print(dataT2.runtimeType);
    if (sapDetails.contains("data")) {
      print(sapDetails.runtimeType);
      if (dataT2["responseCode"] == 200) {
        Provider.of<OrderBloc>(context, listen: false).isLoading = false;
        setState(() {
          _getsapdetails = GetSapOrderDetails.fromJson(dataT2);
        });
      } else if (dataT2["responseCode" == 401]) {
        Provider.of<OrderBloc>(context, listen: false).isLoading = false;
        toast("Unauthorized Request");
      } else if (dataT2["responseCode" == 404]) {
        Provider.of<OrderBloc>(context, listen: false).isLoading = false;
        toast("Not Found");
      } else {
        setState(() {
          _getsapdetails = GetSapOrderDetails.fromJson(dataT2);
        });
        toast(_getsapdetails!.message);
      }
    }
  }
}
