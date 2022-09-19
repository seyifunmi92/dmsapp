import 'dart:convert';

import 'package:dms/layout/appWidget.dart';
import 'package:dms/layout/dms_drawer.dart';
import 'package:dms/screens/my%20orders/orderdetails.dart';
import 'package:dms/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../../layout/loading_indicator_widget.dart';
import '../../model/ordermodels.dart';
import '../../services/orderservices.dart';

class SavedOrders extends StatefulWidget {
  String status;
  String sapNumber;
  SavedOrders(this.status, this.sapNumber);

  @override
  _SavedOrdersState createState() => _SavedOrdersState();
}

class _SavedOrdersState extends State<SavedOrders> {
  bool emptyList = false;
  List<DmsOrder>? _dmsData;
  @override
  void initState() {
    Provider.of<OrderBloc>(context, listen: false).isLoading = true;
    getDMS();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provider.of<OrderBloc>(context, listen: false).isLoading
        ? Scaffold(
            body: Center(child: LoadingIndicatorWidget()),
          )
        : Scaffold(
            backgroundColor: appWhite,
            appBar: dmsAppBar(context, ""),
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
                      "Saved Orders",
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
                              //fontFamily: fontRegular,
                              fontSize: _height * .014,
                            ),
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
                    //child: Icon(Icons.filter),
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
              : Row(
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
                builder: (context) => OrderDetails(_orderDms.dmsorderId!)));
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
                    Text(
                      _orderDms.estimatedNetvalue != 0.00
                          ? "\₦${_format.format(_orderDms.estimatedNetvalue)}"
                          : "\₦0.00",
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
                      width: _width * .305,
                      decoration: BoxDecoration(
                          color: Color(0xffE4EBF3).withOpacity(0.5),
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                          child: Text(
                        _orderDms.orderType!.code!,
                        style: GoogleFonts.openSans(
                            fontSize: _height * .0118,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff8D93A1)),
                      )),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        "lib/assets/dell.png",
                        height: _height * .016,
                      ),
                    ),
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
                              "Status",
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
            print(bodyT["message"]);
          });
        } else {
          toast(bodyT["message"]);
        }
      }
    }
  }
}
