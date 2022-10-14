import 'dart:convert';
import 'package:dms/constant.dart';
import 'package:dms/layout/appWidget.dart';
import 'package:dms/layout/loading_indicator_widget.dart';
import 'package:dms/screens/accounts/accountdelete.dart';
import 'package:dms/screens/auth/confirm_otp.dart';
import 'package:dms/screens/auth/login_screen.dart';
import 'package:dms/screens/auth/new_distributor_notice.dart';
import 'package:dms/screens/auth/password_reset/input_new_password.dart';
import 'package:dms/screens/auth/password_reset/password_reset_request.dart';
import 'package:dms/screens/auth/register_screen_contd.dart';
import 'package:dms/screens/dashboard/dashboard.dart';
import 'package:dms/screens/faq/faq_categories.dart';
import 'package:dms/screens/my%20orders/filternew.dart';
import 'package:dms/screens/my%20orders/myorders.dart';
import 'package:dms/screens/my%20orders/newmyordrs.dart';
import 'package:dms/screens/my%20orders/ordercancelsuccess.dart';
import 'package:dms/screens/my%20orders/orderdetails.dart';
import 'package:dms/screens/my%20orders/orderhistory.dart';
import 'package:dms/screens/my%20orders/orderitems.dart';
import 'package:dms/screens/my_atc/my_atc_detail.dart';
import 'package:dms/services/orderservices.dart';
import 'package:dms/splashscreen/splashscreen.dart';
import 'package:dms/screens/support/new_support_request.dart';
import 'package:dms/utils/animate_controller.dart';
import 'package:dms/utils/colors.dart';
import 'package:dms/utils/theme.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../../model/ordermodels.dart';

class NewOrdery extends StatefulWidget {
  String status;
  String sapNumber;
  NewOrdery(this.status, this.sapNumber);
  @override
  _NewOrderyState createState() => _NewOrderyState();
}

class _NewOrderyState extends State<NewOrdery> {
  bool noAtc = false;
  bool date1 = false;
  bool date2 = false;
  bool orderCancelUnsuccessful = false;
  bool emptyList = false;
  CancelOrder? orderCancel;
  List<DmsOrder>? _dmsData;
  @override
  void initState() {
    Provider.of<OrderBloc>(context, listen: false).isLoading = true;
    getDMS();
    Provider.of<OrderBloc>(context, listen: false).getSelectedDate1("date1") ==
            null
        ? null
        : Provider.of<OrderBloc>(context, listen: false)
            .getSelectedDate1("date1");

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
                      "New Orders",
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
                          return Filter(widget.status, widget.sapNumber);
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
                          fontSize: _height * .02,
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
                builder: (context) => OrderDetails(_orderDms.dmsorderId!, "")));
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
                          ? "\N${_format.format(_orderDms.estimatedNetvalue)}"
                          : "\N0.00",
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
                          color: Color(0xffE4EBF3).withOpacity(0.5),
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                          child: Text(
                        _orderDms.orderType!.name!,
                        style: GoogleFonts.openSans(
                            fontSize: _height * .0118,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff8D93A1)),
                      )),
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return _cancelDialog(_orderDms);
                            });
                      },
                      child: Image.asset(
                        "lib/assets/dell.png",
                        height: _height * .020,
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

  void cancelOrder(
      int dmsOrderId, String orderSapnumber, int distributorSapAccountid) {
    Provider.of<OrderBloc>(context, listen: false)
        .cancelOrderDms(dmsOrderId, orderSapnumber, distributorSapAccountid)
        .then((value) => (output(value)));
  }

  output(String payLoad) {
    print("Seyileee");
    print(payLoad);
    var bodyT = jsonDecode(payLoad);
    if (bodyT["status"] == "Successful") {
      print("Order Canceled");
      orderCancelUnsuccessful
          ? Navigator.pop(context)
          : Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      OrderCancel(widget.status, widget.sapNumber)));
    } else {
      Provider.of<OrderBloc>(context, listen: false).isLoading = false;
      setState(() {
        orderCancelUnsuccessful = true;
        orderCancel = CancelOrder.fromJson(bodyT);
      });
      toast(orderCancel!.message);
    }
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

  Widget _cancelDialog(DmsOrder _cancel) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    var containerheight = _height * .4142;
    var _mypadding = SizedBox(height: containerheight * .08);
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
                "Are you sure you want to cancel this order",
                style: GoogleFonts.poppins(
                  color: Color(0xff8D93A1),
                  fontSize: _height * .02,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "",
                style: GoogleFonts.poppins(
                  color: Color(0xff8D93A1),
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
                      Provider.of<OrderBloc>(context, listen: false).isLoading =
                          true;
                      print(
                          "great, isloading = ${Provider.of<OrderBloc>(context, listen: false).isLoading}");
                      Provider.of<OrderBloc>(context, listen: false).isLoading
                          ? showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Scaffold(
                                  backgroundColor: Colors.transparent,
                                  body: Center(child: LoadingIndicatorWidget()),
                                );
                              })
                          : null;
                      cancelOrder(_cancel.dmsorderId!, "String",
                          int.parse(widget.sapNumber));
                    },
                    child: Container(
                      width: _width * .382,
                      height: _height * .0633,
                      decoration: BoxDecoration(
                        color: appColorPrimary,
                      ),
                      child: Center(
                          child: Text(
                        "Yes",
                        style: GoogleFonts.poppins(
                          color: appWhite,
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
}

class Filter extends StatefulWidget {
  String status;
  String sapNumber;
  Filter(this.status, this.sapNumber);
  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  bool emptyList = false;
  bool filterSuccess = false;
  bool validator = false;
  bool datePicked = false;
  String? finalDate1;
  String? finalDate2;
  DateTime? currentDateInit;
  DateTime? currentDate1;
  DateTime? currentDate2;
  List<DmsOrder>? filterData;
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    var containerheight = _height * .354;
    return ModalProgressHUD(
      inAsyncCall: Provider.of<OrderBloc>(context, listen: false).isLoading,
      progressIndicator: AnimateWidget(),
      child: Scaffold(
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
                    onTap: () {
                      dateCall1();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: inputBackgroundColor,
                          border: Border.all(
                              color:
                                  Provider.of<OrderBloc>(context, listen: false)
                                          .dateSelected1
                                      ? Colors.blueGrey[500]!
                                      : inputBorderColor,
                              width: 1,
                              style: BorderStyle.solid)),
                      height: _height * .0533,
                      width: _width,
                      child: Center(
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: _width * .04),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Provider.of<OrderBloc>(context, listen: false)
                                      .dateSelected1
                                  ? Text(finalDate1 ?? "Select From Date",
                                      style: GoogleFonts.openSans(
                                        fontWeight: FontWeight.w300,
                                        fontSize: _height * .018,
                                        color: Colors.blueGrey[900],
                                        letterSpacing: 0.5,
                                      ))
                                  : Text(
                                      "Select From Date",
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        fontSize: _height * .0166,
                                        color: Color(0xffB1BBC6),
                                      ),
                                    ),
                              Icon(
                                Icons.calendar_month,
                                color: Provider.of<OrderBloc>(context,
                                            listen: false)
                                        .dateSelected1
                                    ? Colors.blueGrey[500]
                                    : Color(0xff999999),
                                size: _height * .02,
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
                    onTap: () {
                      dateCall2();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: inputBackgroundColor,
                          border: Border.all(
                              color:
                                  Provider.of<OrderBloc>(context, listen: false)
                                          .dateSelected2
                                      ? Colors.blueGrey[500]!
                                      : inputBorderColor,
                              width: 1,
                              style: BorderStyle.solid)),
                      height: _height * .0533,
                      width: _width,
                      child: Center(
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: _width * .04),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Provider.of<OrderBloc>(context, listen: false)
                                      .dateSelected2
                                  ? Text(
                                      finalDate2 != null
                                          ? finalDate2!
                                          : "Select To Date",
                                      style: GoogleFonts.openSans(
                                        fontWeight: FontWeight.w300,
                                        fontSize: _height * .018,
                                        color: Colors.blueGrey[900],
                                        letterSpacing: 0.5,
                                      ),
                                    )
                                  : Text(
                                      "Select To Date",
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        fontSize: _height * .0166,
                                        color: Color(0xffB1BBC6),
                                      ),
                                    ),
                              Icon(
                                Icons.calendar_month,
                                color: Provider.of<OrderBloc>(context,
                                            listen: false)
                                        .dateSelected2
                                    ? Colors.blueGrey[500]
                                    : Color(0xff999999),
                                size: _height * .02,
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
                      Provider.of<OrderBloc>(context, listen: false)
                                  .dateSelected2 &&
                              Provider.of<OrderBloc>(context, listen: false)
                                  .dateSelected1
                          ? validator = false
                          : validator = true;
                      validator
                          ? toast("Please input the required fields")
                          : runDateFuntion();
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
      ),
    );
  }

  void runDateFuntion() {
    setState(() {
      Provider.of<OrderBloc>(context, listen: false).isLoading = true;
    });
    getdateFilters();
  }

  void dateCall1() {
    selectDate().then((value) => output(value));
  }

  output(DateTime date1) async {
    if (date1 != DateTime.now()) {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      setState(() {
        Provider.of<OrderBloc>(context, listen: false).dateSelected1 = true;
        currentDate1 = date1;
        finalDate1 = currentDate1!.year.toString() +
            "-" +
            currentDate1!.month.toString() +
            "-" +
            currentDate1!.day.toString();
      });
      sharedPreferences.setString("date1", finalDate1!);
    }
  }

  void dateCall2() {
    selectDate().then((value) => output2(value));
  }

  output2(DateTime date2) async {
    if (date2 != DateTime.now()) {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      setState(() {
        Provider.of<OrderBloc>(context, listen: false).dateSelected2 = true;
        currentDate2 = date2;
        finalDate2 = currentDate2!.year.toString() +
            "-" +
            currentDate2!.month.toString() +
            "-" +
            currentDate2!.day.toString();
      });
      sharedPreferences.setString("date2", finalDate2!);
    }
  }

  selectDate() async {
    final DateTime? datePicker = await showDatePicker(
        context: context,
        initialDate: currentDateInit ?? DateTime.now(),
        firstDate: DateTime(2010),
        lastDate: DateTime(2040));

    datePicker != null
        ? currentDateInit = datePicker
        : currentDateInit = DateTime.now();

    return datePicker;
  }

  getdateFilters() {
    Provider.of<OrderBloc>(context, listen: false)
        .getmyDMSOrdersDate(
            widget.status, widget.sapNumber, finalDate1!, finalDate2!)
        .then((value) => dateOutput(value));
  }

  dateOutput(String dateResponse) {
    var bodyT = jsonDecode(dateResponse);
    print(dateResponse);
    if (bodyT["status"] == "Successful") {
      List filteredList = bodyT["data"]["dmsOrders"];
      setState(() {
        Provider.of<OrderBloc>(context, listen: false).isLoading = false;
        filterSuccess = true;
        filterData =
            filteredList.map<DmsOrder>((e) => DmsOrder.fromJson(e)).toList();
      });
      print("yes bro u have killed it");
      if (filteredList.isEmpty) {
        setState(() {
          emptyList = true;
        });
      }
      Navigator.pop(context);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => FilterNew(widget.status, widget.sapNumber,
                  filterData!, finalDate1!, finalDate2!)));
    } else {
      setState(() {
        Provider.of<OrderBloc>(context, listen: false).isLoading = false;
        filterSuccess = false;
      });
      toast(bodyT["message"].toString());
    }
  }
}
