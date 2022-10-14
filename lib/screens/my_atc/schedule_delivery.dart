import 'package:dms/constant.dart';
import 'package:dms/screens/my_atc/atc_order_confirmation.dart';
import 'package:flutter/material.dart';
import 'package:dms/layout/appWidget.dart';
import 'package:dms/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class ScheduleDelivery extends StatefulWidget {
  int distributorsapid;
  String ordersapno;
  String deliverycity;
  String deliverystatecode;
  String countrycode;
  String deliveryType;
  String truckSize;
  String deliveryAddress;
  ScheduleDelivery(
      this.distributorsapid,
      this.ordersapno,
      this.deliverycity,
      this.deliverystatecode,
      this.countrycode,
      this.deliveryType,
      this.truckSize,
      this.deliveryAddress);

  @override
  State<ScheduleDelivery> createState() => _ScheduleDeliveryState();
}

class _ScheduleDeliveryState extends State<ScheduleDelivery> {
//String selectedDate = (${selectedDeliveryDate.day}-${selectedDeliveryDate.month}-${selectedDeliveryDate.year});
  bool activeButton = false;
  bool isLoading = false;
  String date = "";
  DateTime selectedDeliveryDate = DateTime.now();
  bool isSelectDate = false;
  var formKey = GlobalKey<FormState>();
  var deliveryDateCont = TextEditingController();
  var deliveryDateNode = FocusNode();
  var deliveryAddressCont = TextEditingController();
  var deliveryAddressNode = FocusNode();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    final _screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: dmsAppBar(context, '', showBack: true),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.only(
              left: _screenWidth * 0.07, right: _screenWidth * 0.07),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: _screenHeight * 0.026,
              ),
              //text("Schedule Delivery", isBoldText: true, fontSize: 28.0),

              Text(
                "Schedule Delivery",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: _screenHeight * .03,
                  color: appColorPrimary,
                ),
              ),
              SizedBox(
                height: _screenHeight * 0.0166,
              ),
              Text(
                "Kindly choose delivery date",
                style: GoogleFonts.poppins(
                  color: Color(0xff8D93A1),
                  fontWeight: FontWeight.w400,
                  fontSize: _screenHeight * .015,
                ),
              ),
              //text("Kindly choose delivery method and type.",
              //fontSize: 13.0, textColor: appTextColorSecondary),
              SizedBox(
                height: _screenHeight * 0.02,
              ),
              Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            color: isSelectDate
                                ? Colors.white
                                : Colors.blueGrey[50],
                            border: Border.all(
                                color:
                                    isSelectDate ? appColorAccent : Colors.grey,
                                width: 1,
                                style: BorderStyle.solid)),
                        height: _screenHeight * .0592,
                        width: _screenWidth * 0.90,
                        padding: EdgeInsets.symmetric(
                            horizontal: _screenWidth * .05,
                            vertical: _screenHeight * .01),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            isSelectDate
                                ? Text(
                                    "${selectedDeliveryDate.day}-${selectedDeliveryDate.month}-${selectedDeliveryDate.year}",
                                    style: GoogleFonts.actor(
                                        fontWeight: FontWeight.w500,
                                        color: appColorPrimary,
                                        letterSpacing: 1.0,
                                        fontSize: _screenHeight * .017),
                                    textAlign: TextAlign.start,
                                  )
                                : Text(
                                    "Delivery Date",
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        color: iconColorSecondary,
                                        fontSize: _screenHeight * .0166),
                                    textAlign: TextAlign.start,
                                  ),
                            InkWell(
                              onTap: () {
                                _selectDeliveryDate(context);
                              },
                              child: Icon(
                                Icons.calendar_month,
                                color: isSelectDate
                                    ? appColorPrimary
                                    : iconColorSecondary,
                                size: _screenHeight * .026,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: _screenHeight * 0.61,
                    ),
                    Row(
                      children: [
                        //mypadr,
                        InkWell(
                          onTap: () {
                            isSelectDate
                                ? Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ATCOrderComfirmation(
                                                widget.distributorsapid,
                                                widget.ordersapno,
                                                widget.deliverycity,
                                                widget.deliverystatecode,
                                                widget.countrycode,
                                                widget.deliveryType,
                                                widget.truckSize,
                                                widget.deliveryAddress,
                                                selectedDeliveryDate)))
                                : null;
                          },
                          child: Container(
                            width: _screenWidth * .86,
                            height: _screenHeight * .0633,
                            decoration: BoxDecoration(
                              //border: Border.all(color: Color(0xffB1BBC6)),
                              color:
                                  isSelectDate ? appColorPrimary : Colors.grey,
                            ),
                            child: Center(
                                child: Text(
                              "Schedule Delivery",
                              style: GoogleFonts.poppins(
                                color: appWhite,
                                fontSize: _screenHeight * .016,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                          ),
                        ),
                      ],
                    ),
                    // GestureDetector(
                    //   onTap: () {},
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //         color: inputBackgroundColor,
                    //         border: Border.all(
                    //             color: inputBorderColor,
                    //             width: 1,
                    //             style: BorderStyle.solid)),
                    //     height: 50,
                    //     width: _screenWidth * 0.90,
                    //     padding:
                    //         EdgeInsets.symmetric(horizontal: 14, vertical: 13),
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //       children: [
                    //         Text(
                    //           "Truck Size",
                    //           style: TextStyle(
                    //               color: iconColorSecondary,
                    //               fontFamily: fontRegular,
                    //               fontSize: textSizeMedium),
                    //           textAlign: TextAlign.start,
                    //         ),
                    //         Icon(
                    //           Icons.arrow_drop_down,
                    //           color: iconColorSecondary,
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: _screenHeight * 0.02,
                    // ),
                    // TextFormField(
                    //   keyboardType: TextInputType.text,
                    //   autofocus: false,
                    //   controller: deliveryDateCont,
                    //   textCapitalization: TextCapitalization.words,
                    //   style: TextStyle(
                    //       color: appColorPrimary,
                    //       fontFamily: fontRegular,
                    //       fontSize: textSizeMedium),
                    //   decoration: InputDecoration(
                    //       suffixIcon: IconButton(
                    //         icon: const Icon(
                    //           Icons.calendar_month,
                    //         ),
                    //         onPressed: () {},
                    //       ),
                    //       filled: true,
                    //       fillColor: inputBackgroundColor,
                    //       focusColor: inputBorderColor,
                    //       hintText: "Delivery Date",
                    //       hintStyle: TextStyle(
                    //           color: iconColorSecondary,
                    //           fontFamily: fontRegular,
                    //           fontSize: textSizeMedium),
                    //       contentPadding:
                    //           EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    //       focusedBorder: OutlineInputBorder(
                    //           borderSide: BorderSide(
                    //               color: inputBorderColor, width: 0.5)),
                    //       enabledBorder: OutlineInputBorder(
                    //           borderSide: BorderSide(
                    //               color: iconColorSecondary,
                    //               style: BorderStyle.solid,
                    //               width: 0))),
                    //   textInputAction: TextInputAction.next,
                    //   focusNode: deliveryDateNode,
                    //   validator: (s) {
                    //     if (s!.isEmpty) return 'Field is required';
                    //     return null;
                    //   },
                    // ),
                    // SizedBox(
                    //   height: _screenHeight * 0.02,
                    // ),
                    // TextFormField(
                    //   autofocus: false,
                    //   controller: deliveryAddressCont,
                    //   textCapitalization: TextCapitalization.words,
                    //   style: TextStyle(
                    //       color: appColorPrimary,
                    //       fontFamily: fontRegular,
                    //       fontSize: textSizeMedium),
                    //   decoration: InputDecoration(
                    //       filled: true,
                    //       fillColor: inputBackgroundColor,
                    //       focusColor: inputBorderColor,
                    //       hintText: "Delivery Address",
                    //       hintStyle: TextStyle(
                    //           color: iconColorSecondary,
                    //           fontFamily: fontRegular,
                    //           fontSize: textSizeMedium),
                    //       contentPadding:
                    //           EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    //       focusedBorder: OutlineInputBorder(
                    //           borderSide: BorderSide(
                    //               color: inputBorderColor, width: 0.5)),
                    //       enabledBorder: OutlineInputBorder(
                    //           borderSide: BorderSide(
                    //               color: iconColorSecondary,
                    //               style: BorderStyle.solid,
                    //               width: 0))),
                    //   keyboardType: TextInputType.multiline,
                    //   textInputAction: TextInputAction.newline,
                    //   maxLines: 6,
                    //   focusNode: deliveryAddressNode,
                    //   validator: (s) {
                    //     if (s!.isEmpty) return 'Field is required';
                    //     return null;
                    //   },
                    // ),
                    // SizedBox(
                    //   height: _screenHeight * 0.17,
                    // ),
                    // Align(
                    //   alignment: Alignment.bottomCenter,
                    //   child: Container(
                    //     width: double.infinity,
                    //     height: 55.0,
                    //     margin: const EdgeInsetsDirectional.fromSTEB(
                    //         10.0, 0.0, 10.0, 10.0),
                    //     child: ElevatedButton(
                    //       onPressed: () async {
                    //         Navigator.push(
                    //             context,
                    //             MaterialPageRoute(
                    //                 builder: (context) =>
                    //                     ATCOrderComfirmation()));
                    //       },
                    //       style: ElevatedButton.styleFrom(
                    //         padding: const EdgeInsets.all(0),
                    //         textStyle: const TextStyle(
                    //           color: Colors.white,
                    //         ),
                    //         primary: appColorPrimary, // background
                    //         shape: RoundedRectangleBorder(
                    //             borderRadius: BorderRadius.circular(3.0)),
                    //       ),
                    //       child: const Text("Schedule Delivery"),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              // Container(
              //   width: _screenWidth * .85,
              //   height: _screenHeight * .066,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(0),
              //   ),
              //   child: TextFormField(
              //     //controller: userNameCont,
              //     decoration: InputDecoration(
              //       border: InputBorder.none,
              //       filled: true,
              //       fillColor: inputBackgroundColor,
              //       focusColor: inputBorderColor,
              //       hintText: "Delivery Date",
              //       hintStyle: GoogleFonts.poppins(
              //           color: iconColorSecondary,
              //           fontSize: _screenHeight * .0174),
              //       contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              //       focusedBorder: OutlineInputBorder(
              //           borderSide:
              //               BorderSide(color: inputBorderColor, width: 0.5)),
              //       enabledBorder: OutlineInputBorder(
              //           borderSide: BorderSide(
              //               color: iconColorSecondary,
              //               style: BorderStyle.solid,
              //               width: 0)),
              //     ),
              //     keyboardType: TextInputType.emailAddress,
              //     textInputAction: TextInputAction.next,
              //     autofocus: false,
              //     textCapitalization: TextCapitalization.words,
              //     // onFieldSubmitted: (s) =>
              //     //     FocusScope.of(context).requestFocus(passwordNode),
              //     //focusNode: usernameNode,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  void _selectDeliveryDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDeliveryDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2035),
    );
    if (selected != null && selected != selectedDeliveryDate)
      setState(() {
        isSelectDate = true;
        selectedDeliveryDate = selected;
      });
  }
}
