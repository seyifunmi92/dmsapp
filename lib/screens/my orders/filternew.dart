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
import 'package:dms/screens/my%20orders/myorders.dart';
import 'package:dms/screens/my%20orders/newmyordrs.dart';
import 'package:dms/screens/my%20orders/neworders.dart';
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

class FilterNew extends StatefulWidget {
  String status;
  String sapNumber;
  List<DmsOrder> filteredList;
  String finalDate1;
  String finalDate2;
  FilterNew(this.status, this.sapNumber, this.filteredList, this.finalDate1,
      this.finalDate2);

  @override
  _FilterNewState createState() => _FilterNewState();
}

class _FilterNewState extends State<FilterNew> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        NewOrdery(widget.status, widget.sapNumber)));
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: appColorPrimary,
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: _width * .075),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "New Orders",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: _height * .02814,
                    color: appColorPrimary,
                  ),
                ),
              ],
            ),
            SizedBox(height: _height * .003),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "From - ${widget.finalDate1}",
                  style: GoogleFonts.actor(
                    fontSize: _height * .019,
                    color: Colors.black54,
                  ),
                ),
                Text(
                  "To - ${widget.finalDate2}",
                  style: GoogleFonts.actor(
                    fontSize: _height * .019,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
            SizedBox(height: _height * .03),
            ...widget.filteredList.map((e) => filterCustom(e)),
          ],
        ),
      )),
    );
  }

  Widget filterCustom(DmsOrder _orderDms) {
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
                        // showDialog(
                        //     context: context,
                        //     builder: (BuildContext context) {
                        //       return _cancelDialog(_orderDms);
                        //     });
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
}
