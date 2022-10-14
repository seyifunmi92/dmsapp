import 'dart:convert';

import 'package:dms/constant.dart';
import 'package:dms/layout/appWidget.dart';
import 'package:dms/model/ordermodels.dart';
import 'package:dms/screens/accounts/accountdelete.dart';
import 'package:dms/screens/auth/confirm_otp.dart';
import 'package:dms/screens/auth/login_screen.dart';
import 'package:dms/screens/auth/new_distributor_notice.dart';
import 'package:dms/screens/auth/password_reset/input_new_password.dart';
import 'package:dms/screens/auth/password_reset/password_reset_request.dart';
import 'package:dms/screens/auth/register_screen_contd.dart';
import 'package:dms/screens/dashboard/dashboard.dart';
import 'package:dms/screens/faq/faq_categories.dart';
import 'package:dms/screens/my%20orders/newmyordrs.dart';
import 'package:dms/screens/my%20orders/orderdetails.dart';
import 'package:dms/screens/my_atc/my_atc_detail.dart';
import 'package:dms/splashscreen/splashscreen.dart';
import 'package:dms/screens/support/new_support_request.dart';
import 'package:dms/utils/colors.dart';
import 'package:dms/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import '../../layout/loading_indicator_widget.dart';
import '../../services/orderservices.dart';
import 'myorders.dart';

class MyOrders2 extends StatefulWidget {
  String status;
  String sapNumber;
  String accountType;
  MyOrders2(this.status, this.sapNumber, this.accountType);
  @override
  _MyOrders2State createState() => _MyOrders2State();
}

class _MyOrders2State extends State<MyOrders2> {
  bool emptyList = false;
  List<DmsOrder>? _dmsData;
  List<GetSapOrders> _getsapOrders = [];
  GetSapOrders? _getSapOrders1;
  List<GetDmsOrders> _getOrders = [];
  GetDmsOrders? _getOrders1;
  @override
  void initState() {
    Provider.of<OrderBloc>(context, listen: false).isLoading = true;
    getDMS();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.accountType == "CC"
        ? Provider.of<OrderBloc>(context, listen: false).isBG = false
        : Provider.of<OrderBloc>(context, listen: false).isBG = true;
    return Provider.of<OrderBloc>(context, listen: false).isLoading
        ? Scaffold(
            body: Center(child: LoadingIndicatorWidget()),
          )
        : Scaffold(
            backgroundColor: appWhite,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              shadowColor: Colors.transparent,
              leading: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyOrders()));
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: appColorPrimary,
                ),
              ),
            ),
            body: _body(context),
          );
  }

  Widget _body(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
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
                      "Submitted Orders",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: _height * .0284,
                        color: appColorPrimary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          mypadh,
          mypadh,
          mypadh,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: _width * .04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        color: inputBackgroundColor,
                        border: Border.all(
                            color: inputBorderColor,
                            width: 1,
                            style: BorderStyle.solid)),
                    height: _height * .0533,
                    width: _width * 0.73,
                    padding: EdgeInsets.only(
                        left: _width * .05, top: _height * .006),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.search_rounded,
                          color: Color(0xffB7BBC5),
                          size: _height * .0313,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: _width * 0.01),
                          child: Text(
                            "Search with Order Number",
                            style: GoogleFonts.poppins(
                                color: Color(0xffB7BBC5),
                                fontWeight: FontWeight.w400,
                                fontSize: _height * .014),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return _filterDialog(context);
                        });
                  },
                  child: Container(
                    color: appColorPrimary,
                    height: _height * .0569,
                    width: _width * .1205,
                    child: Image.asset(
                      "lib/assets/new.png",
                      height: _height * 0.019,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: _height * .024),
          emptyList
              ? Column(
                  children: [
                    SizedBox(
                      height: _height * .28,
                    ),
                    Text(
                      "You have no ${widget.status} order at the moment",
                      style: GoogleFonts.poppins(
                          color: appColorPrimary,
                          fontSize: _height * .018,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                )
              : Column(
                  children: [
                    mypadr,
                    ..._dmsData!.map((e) => _boxCustom1(e)),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _boxCustom1(DmsOrder _orderDms) {
    final _format = NumberFormat("#,###,000.00");
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    var mypadhh = SizedBox(height: _height * .02);
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    OrderDetails(_orderDms.dmsorderId!, widget.accountType)));
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: _height * .01),
        child: Container(
          width: _width * .92,
          height: _height * .104,
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
            borderRadius: BorderRadius.circular(5),
          ),
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: _height * .013,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _width * .05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Order${_orderDms.dmsorderId}",
                          style: GoogleFonts.openSans(
                            fontSize: _height * .02,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      _orderDms.dateCreated!.day.toString() +
                          "-" +
                          _orderDms.dateCreated!.month.toString() +
                          "-" +
                          _orderDms.dateCreated!.year.toString(),
                      style: GoogleFonts.openSans(
                        fontSize: _height * .02,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              mypadhh,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _width * .05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: _height * .0284,
                      width: _width * .20,
                      decoration: BoxDecoration(
                          color: Color(0xffE4EBF3),
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                          child: Text(
                        _orderDms.orderType!.name!,
                        style: GoogleFonts.openSans(
                            fontSize: _height * .01,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff8D93A1)),
                      )),
                    ),
                    // InkWell(
                    //   onTap: () {},
                    //   child: Image.asset(
                    //     "lib/assets/dell.png",
                    //     height: _height * .016,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Widget _filterDialog(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    var containerheight = _height * .354;
    var _mypadding = SizedBox(height: containerheight * .12);
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: appWhite,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        height: containerheight,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                _width * .06, _height * .037, _width * .06, _height * .037),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Filter Orders",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: _height * .0284,
                        color: appColorPrimary,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: _height * .023,
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
                    height: _height * .0533,
                    width: _width,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: _width * .04),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Date Created",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: _height * .0166,
                                color: Color(0xffB1BBC6),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Icon(
                                Icons.calendar_month,
                                color: Color(0xff999999),
                                size: _height * .025,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: _height * .018,
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
                    height: _height * .0533,
                    width: _width,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: _width * .04),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "_getOrders[2].data!.isAtc.toString()",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: _height * .0166,
                                color: Color(0xffB1BBC6),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Icon(
                                Icons.arrow_drop_down,
                                color: Color(0xff999999),
                                size: _height * .0296,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: _height * .022,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: _width,
                    height: _height * .0633,
                    decoration: BoxDecoration(
                      color: appColorPrimary,
                    ),
                    child: Center(
                        child: Text(
                      "Set Filter",
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
          ),
        ),
      ),
    );
  }

  void getDMS() {
    Provider.of<OrderBloc>(context, listen: false)
        .getmyDMSOrders(widget.status, widget.sapNumber)
        .then((value) => _output(value));
  }

  _output(String dmsList) {
    List empty = [];
    var bodyT = jsonDecode(dmsList);
    if (dmsList.contains("data")) {
      if (bodyT["status"] == "Successful") {
        if (bodyT["data"]["dmsOrders"] != empty) {
          Provider.of<OrderBloc>(context, listen: false).isLoading = false;
          dynamic _gettX = bodyT;
          List myList = _gettX["data"]["dmsOrders"];
          if (myList.isEmpty) {
            emptyList = true;
            toast("Oops.No Orders");
          }
          setState(() {
            _dmsData =
                myList.map<DmsOrder>((e) => DmsOrder.fromJson(e)).toList();
          });
        } else {
          Provider.of<OrderBloc>(context, listen: false).isLoading = false;
          toast(bodyT["message"]);
        }
      }
    }
  }

  void getOrders() {
    Provider.of<OrderBloc>(context, listen: false)
        .getmyDMSOrders(widget.status, widget.sapNumber)
        .then((value) => _outputY(value));
    Provider.of<OrderBloc>(context, listen: false)
        .getmySAPOrders()
        .then((value) => _sapOutput(value));
  }

  _outputY(String orderList) {
    print("There you go.Seyi");
    var _data = jsonDecode(orderList);
    if (orderList.contains("data")) {
      print(_data.runtimeType);
      if (_data["responseCode"] == 200) {
        Provider.of<OrderBloc>(context, listen: false).isLoading = false;
        dynamic _value = _data;
        setState(() {
          _getOrders = _value
              .map<GetDmsOrders>((e) => GetDmsOrders.fromJson(e))
              .toList();
          print(_getOrders[0].data!.countryCode);
        });
      } else if (_data["responseCode" == 401]) {
        Provider.of<OrderBloc>(context, listen: false).isLoading = false;
        toast("Unauthorized Request");
      } else if (_data["responseCode" == 404]) {
        Provider.of<OrderBloc>(context, listen: false).isLoading = false;
        toast("Resource Not Found");
      } else {
        setState(() {
          _getOrders1 = GetDmsOrders.fromJson(_data);
        });
        toast(_getOrders1!.message);
      }
    }
  }

  _sapOutput(String sapList) {
    print("There you go.Seyi");
    var _sapdata = jsonDecode(sapList);
    if (sapList.contains("data")) {
      print(_sapdata.runtimeType);
      if (_sapdata["responseCode"] == 200) {
        Provider.of<OrderBloc>(context, listen: false).isLoading = false;
        dynamic _value = _sapdata;
        setState(() {
          _getOrders = _value
              .map<GetSapOrders>((e) => GetSapOrders.fromJson(e))
              .toList();
          print(_getsapOrders[0].datab!.items);
        });
      } else if (_sapdata["responseCode" == 401]) {
        Provider.of<OrderBloc>(context, listen: false).isLoading = false;
        toast("Unauthorized Request");
      } else if (_sapdata["responseCode" == 404]) {
        Provider.of<OrderBloc>(context, listen: false).isLoading = false;
        toast("Resource Not Found");
      } else {
        setState(() {
          _getSapOrders1 = GetSapOrders.fromJson(_sapdata);
        });
        toast(_getSapOrders1!.message);
      }
    }
  }
}
