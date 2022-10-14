import 'dart:convert';
import 'package:dms/layout/appWidget.dart';
import 'package:dms/model/ordermodels.dart';
import 'package:dms/screens/my_atc/schedule_delivery.dart';
import 'package:dms/services/orderservices.dart';
import 'package:dms/utils/colors.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import '../../layout/loading_indicator_widget.dart';
import '../../model/sapmodels.dart';

class MyATCDetail extends StatefulWidget {
  int distributorId;
  String sapNo;
  MyATCDetail(this.distributorId, this.sapNo);
  @override
  State<MyATCDetail> createState() => _MyATCDetailState();
}

class _MyATCDetailState extends State<MyATCDetail> {
  bool noAtc = false;
  final _format = NumberFormat("#,###,000.00");

  GetSapD? _getSapDetails;
  @override
  void initState() {
    Provider.of<OrderBloc>(context, listen: false).isLoading = true;
    print(widget.distributorId);
    print(widget.sapNo);
    getSapDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    final _screenHeight = MediaQuery.of(context).size.height;
    var contHeight = MediaQuery.of(context).size.height * .71;
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    var mypadr = SizedBox(width: _width * .04);

    return Provider.of<OrderBloc>(context, listen: false).isLoading
        ? Scaffold(
            body: Center(child: LoadingIndicatorWidget()),
          )
        : Scaffold(
            appBar: dmsAppBar(context, '', showBack: true),
            body: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: EdgeInsets.only(
                    left: _screenWidth * 0.04, right: _screenWidth * 0.04),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: _screenHeight * 0.026,
                    ),
                    Text(
                      "ATC",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: _screenHeight * .0267,
                        color: appColorPrimary,
                      ),
                    ),
                    SizedBox(
                      height: _screenHeight * 0.0144,
                    ),
                    Container(
                      width: _width * .92,
                      height: _height * .74,
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
                          SizedBox(
                            height: _height * .02,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: _width * .04),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //mypadr,
                                Text(
                                  "Item",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: _height * .02,
                                    color: Color(0xff333542),
                                  ),
                                ),
                                Text(
                                  "Material",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: _height * .02,
                                    color: Color(0xff333542),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: _height * .006,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: _width * .04),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  _getSapDetails!.data!.sapOrder!.id != null
                                      ? _getSapDetails!.data!.sapOrder!.id
                                          .toString()
                                      : "",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w300,
                                    fontSize: _height * .016,
                                    color: Color(0xff333542),
                                  ),
                                ),
                                Text(
                                  "",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w300,
                                    fontSize: _height * .016,
                                    color: Color(0xff333542),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(
                            height: _height * 0.03,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: _width * .05),
                            child: DottedLine(
                              dashColor: Color(0xffcbcbcb).withOpacity(0.6),
                            ),
                          ),
                          SizedBox(
                            height: _height * .02,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: _width * .04),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Description",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff333542),
                                    fontSize: _height * .02,
                                  ),
                                ),
                                Text(
                                  "Quantity",
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
                            padding:
                                EdgeInsets.symmetric(horizontal: _width * .04),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  _getSapDetails!.data!.sapOrder!.companyCode !=
                                          null
                                      ? _getSapDetails!
                                          .data!.sapOrder!.companyCode!
                                      : "",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w300,
                                    color: Color(0xff333542),
                                    fontSize: _height * .016,
                                  ),
                                ),
                                Text(
                                  _getSapDetails!.data!.sapOrder!.orderItems![0]
                                              .quantity !=
                                          null
                                      ? _getSapDetails!.data!.sapOrder!
                                          .orderItems![0].quantity
                                          .toString()
                                      : "",
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
                            padding:
                                EdgeInsets.symmetric(horizontal: _width * .05),
                            child: DottedLine(
                              dashColor: Color(0xffcbcbcb).withOpacity(0.6),
                            ),
                          ),
                          SizedBox(
                            height: _height * .02,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: _width * .04),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "UOM",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff333542),
                                    fontSize: _height * .02,
                                  ),
                                ),
                                Text(
                                  "Price Unit",
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
                            padding:
                                EdgeInsets.symmetric(horizontal: _width * .04),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  _getSapDetails!.data!.sapOrder!.orderItems![0]
                                              .salesUnitOfMeasureCode !=
                                          null
                                      ? _getSapDetails!.data!.sapOrder!
                                          .orderItems![0].salesUnitOfMeasureCode
                                      : "0.00",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w300,
                                    color: Color(0xff333542),
                                    fontSize: _height * .016,
                                  ),
                                ),
                                Text(
                                  _getSapDetails!.data!.sapOrder!.orderItems![0]
                                              .sapPricePerUnit !=
                                          null
                                      ? "N${_format.format(_getSapDetails!.data!.sapOrder!.orderItems![0].sapPricePerUnit)}"
                                      : "N0.00",
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
                            padding:
                                EdgeInsets.symmetric(horizontal: _width * .05),
                            child: DottedLine(
                              dashColor: Color(0xffcbcbcb).withOpacity(0.6),
                            ),
                          ),
                          SizedBox(
                            height: _height * .02,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: _width * .04),
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
                                  "Date",
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
                            padding:
                                EdgeInsets.symmetric(horizontal: _width * .04),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  _getSapDetails!.data!.sapOrder!.orderItems![0]
                                              .id !=
                                          null
                                      ? _getSapDetails!
                                          .data!.sapOrder!.orderItems![0].id
                                          .toString()
                                      : "No order id",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w300,
                                    color: Color(0xff333542),
                                    fontSize: _height * .016,
                                  ),
                                ),
                                Text(
                                  _getSapDetails!.data!.sapOrder!.dateCreated !=
                                          null
                                      ? _getSapDetails!
                                              .data!.sapOrder!.dateCreated!.day
                                              .toString() +
                                          "-" +
                                          _getSapDetails!.data!.sapOrder!
                                              .dateCreated!.month
                                              .toString() +
                                          "-" +
                                          _getSapDetails!
                                              .data!.sapOrder!.dateCreated!.year
                                              .toString()
                                      : "No date",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w300,
                                    color: Color(0xff333542),
                                    fontSize: _height * .016,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //mypadh,
                          SizedBox(
                            height: _height * .025,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: _width * .05),
                            child: DottedLine(
                              dashColor: Color(0xffcbcbcb).withOpacity(0.6),
                            ),
                          ),
                          SizedBox(
                            height: _height * .014,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: _width * .04),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Reference No",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff333542),
                                    fontSize: _height * .02,
                                  ),
                                ),
                                Text(
                                  "Current Status",
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
                            height: contHeight * .005,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: _width * .04),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Test1",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w300,
                                    color: Color(0xff333542),
                                    fontSize: _height * .016,
                                  ),
                                ),
                                Text(
                                  _getSapDetails!.data!.sapOrder!.orderStatus!
                                              .name !=
                                          null
                                      ? _getSapDetails!
                                          .data!.sapOrder!.orderStatus!.name
                                          .toString()
                                      : "",
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
                            padding:
                                EdgeInsets.symmetric(horizontal: _width * .05),
                            child: DottedLine(
                              dashColor: Color(0xffcbcbcb).withOpacity(0.6),
                            ),
                          ),
                          SizedBox(
                            height: _height * .014,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: _width * .04),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Destination",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff333542),
                                    fontSize: _height * .02,
                                  ),
                                ),
                                Text(
                                  "Plant",
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
                            height: contHeight * .005,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: _width * .04),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  _getSapDetails!.data!.sapOrder!
                                              .deliveryAddress !=
                                          null
                                      ? _getSapDetails!
                                          .data!.sapOrder!.deliveryAddress
                                          .toString()
                                      : "No Address Yet",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w300,
                                    color: Color(0xff333542),
                                    fontSize: _height * .016,
                                  ),
                                ),
                                Text(
                                  _getSapDetails!.data!.sapOrder!.plant != null
                                      ? _getSapDetails!.data!.sapOrder!.plant
                                      : "None",
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
                            height: _height * .020,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: _width * .05),
                            child: DottedLine(
                              dashColor: Color(0xffcbcbcb).withOpacity(0.6),
                            ),
                          ),
                          SizedBox(
                            height: _height * .02,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: _width * .04),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //mypadr,
                                Text(
                                  "VAT",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff7A7C85),
                                    fontSize: _height * .02,
                                  ),
                                ),
                                Text(
                                  _getSapDetails!.data!.sapOrder!.sapVat != null
                                      ? "N${_format.format(_getSapDetails!.data!.sapOrder!.sapVat)}"
                                      : "N0.00",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff27AE60),
                                    fontSize: _height * .024,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: _height * .020,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: _width * .05),
                            child: DottedLine(
                              dashColor: Color(0xffcbcbcb).withOpacity(0.6),
                            ),
                          ),
                          SizedBox(
                            height: _height * .015,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: _width * .04),
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
                                  _getSapDetails!.data!.sapOrder!
                                              .orderSapNetValue !=
                                          0.00
                                      ? "N${_format.format(_getSapDetails!.data!.sapOrder!.orderSapNetValue)}"
                                      : "N0.00",
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
                    SizedBox(
                      height: _screenHeight * 0.02,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ScheduleDelivery(
                                        _getSapDetails!
                                            .data!
                                            .sapOrder!
                                            .distributorSapAccount!
                                            .distributorSapAccountId!,
                                        _getSapDetails!
                                            .data!.sapOrder!.orderSapNumber!,
                                        _getSapDetails!
                                            .data!.sapOrder!.deliveryCity!,
                                        _getSapDetails!.data!.sapOrder!
                                                    .deliveryState ==
                                                null
                                            ? "001"
                                            : _getSapDetails!
                                                .data!.sapOrder!.deliveryState
                                                .toString(),
                                        _getSapDetails!
                                            .data!.sapOrder!.countryCode!,
                                        _getSapDetails!.data!.sapOrder!
                                            .deliveryMethod!.name!,
                                        _getSapDetails!
                                            .data!.sapOrder!.truckSize!.name!,
                                        _getSapDetails!.data!.sapOrder!
                                            .deliveryAddress!)));
                          },
                          child: Container(
                            width: _width * .92,
                            height: _height * .0633,
                            decoration: BoxDecoration(
                              color: appColorPrimary,
                            ),
                            child: Center(
                                child: Text(
                              "Schedule Delivery",
                              style: GoogleFonts.poppins(
                                color: appWhite,
                                fontSize: _height * .016,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: _screenHeight * 0.02,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: _width * .00),
                      child: Row(children: [
                        InkWell(
                          onTap: () {},
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
                                  "Print ATC",
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
              ),
            ),
          );
  }

  void getSapDetails() {
    Provider.of<OrderBloc>(context, listen: false)
        .getSapOrderdetails(widget.distributorId, widget.sapNo)
        .then((value) => sapOutput(value));
  }

  sapOutput(String sapD) {
    var sapDetails = jsonDecode(sapD);
    if (sapD.contains("sapOrder")) {
      Provider.of<OrderBloc>(context, listen: false).isLoading = false;
      setState(() {
        _getSapDetails = GetSapD.fromJson(sapDetails);
        print(_getSapDetails!.data!.sapOrder!.estimatedNetValue);
      });
    } else if (sapDetails["data"] == "null") {
      print("no record oo");
      Provider.of<OrderBloc>(context, listen: false).isLoading = false;
      setState(() {
        noAtc = true;
      });
      toast("Oops, no record for this ATC");
    } else {
      toast("");
      Provider.of<OrderBloc>(context, listen: false).isLoading = false;
    }
  }
}
