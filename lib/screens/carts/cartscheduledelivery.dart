import 'dart:convert';

import 'package:dms/blocs/country_bloc.dart';
import 'package:dms/constant.dart';
import 'package:dms/layout/appWidget.dart';
import 'package:dms/layout/country_picker.dart';
import 'package:dms/layout/delivery_type_picker.dart';
import 'package:dms/layout/plant_picker.dart';
import 'package:dms/layout/state_picker.dart';
import 'package:dms/layout/truck_size_picker.dart';
import 'package:dms/model/ordermodels.dart';
import 'package:dms/screens/accounts/accountdelete.dart';
import 'package:dms/screens/auth/confirm_otp.dart';
import 'package:dms/screens/auth/login_screen.dart';
import 'package:dms/screens/auth/new_distributor_notice.dart';
import 'package:dms/screens/auth/password_reset/input_new_password.dart';
import 'package:dms/screens/auth/password_reset/password_reset_request.dart';
import 'package:dms/screens/auth/register_screen_contd.dart';
import 'package:dms/screens/carts/checkout.dart';
import 'package:dms/screens/carts/ordersummary.dart';
import 'package:dms/screens/carts/verifyyotp.dart';
import 'package:dms/screens/dashboard/dashboard.dart';
import 'package:dms/screens/faq/faq_categories.dart';
import 'package:dms/screens/my_atc/my_atc_detail.dart';
import 'package:dms/screens/products/productDetails.dart';
import 'package:dms/services/orderservices.dart';
import 'package:dms/splashscreen/splashscreen.dart';
import 'package:dms/screens/support/new_support_request.dart';
import 'package:dms/utils/colors.dart';
import 'package:dms/utils/next_screen.dart';
import 'package:dms/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../../blocs/cart_bloc.dart';
import '../../model/cart_item_model.dart';

class Schedule extends StatefulWidget {
  int? total;
  int? cartItemTotal;
  int? dmsOrderId;
  List<CartItem> shoppingCarts = [];

  Schedule(this.total, this.cartItemTotal, this.dmsOrderId, this.shoppingCarts);

  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  SubmitDmsOrder? _submitOrders;
  var formKey = GlobalKey<FormState>();
  var cityCont = TextEditingController();
  var cityNode = FocusNode();
  var deliveryAddressCont = TextEditingController();
  var deliveryAddressNode = FocusNode();

  String selectedDeliveryMethodCode = "";
  String selectedPlantTypeCode = "";
  String selectedTruckSizeCode = "";
  String selectedStateCode = "";
  String selectedCountryCode = "";

  bool isLoading = false;
  String date = "";
  DateTime selectedDeliveryDate = DateTime.now();
  bool isSelectDate = false;

  @override
  void initState() {
    // submitOrder(
    //     dmsOrderId,
    //     truckSizeCode,
    //     deliveryMethodCode,
    //     plantCode,
    //     deliveryDate,
    //     deliveryCity,
    //     deliveryStateCode,
    //     deliveryAddress,
    //     deliveryCountryCode);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    final _screenHeight = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
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
                height: _screenHeight * 0.015,
              ),
              Text(
                "Schedule Delivery",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: _screenHeight * .03,
                  color: appColorPrimary,
                ),
              ),
              //ext("Schedule Delivery", isBoldText: true, fontSize: 28.0),
              SizedBox(
                height: _screenHeight * 0.0166,
              ),
              Text(
                "Kindly choose delivery method and type",
                style: GoogleFonts.poppins(
                  color: Color(0xff8D93A1),
                  fontWeight: FontWeight.w400,
                  fontSize: _screenHeight * .015,
                ),
              ),
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
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DeliveryMethodPicker()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: inputBackgroundColor,
                            border: Border.all(
                                color: inputBorderColor,
                                width: 1,
                                style: BorderStyle.solid)),
                        height: _height * .0533,
                        width: _width,
                        // padding: EdgeInsets.symmetric(horizontal: _width *.04),
                        child: Center(
                          child: Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: _width * .04),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  Provider.of<CartBloc>(
                                      context)
                                      .selectedDeliveryMethod
                                      .toString(),
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: _height * .0166,
                                    color: Color(0xffB1BBC6),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: Color(0xff999999),
                                  size: _height * .025,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: _screenHeight * 0.02,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PlantPicker()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: inputBackgroundColor,
                            border: Border.all(
                                color: inputBorderColor,
                                width: 1,
                                style: BorderStyle.solid)),
                        height: _height * .0533,
                        width: _width,
                        // padding: EdgeInsets.symmetric(horizontal: _width *.04),
                        child: Center(
                          child: Padding(
                            padding:
                            EdgeInsets.symmetric(horizontal: _width * .04),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  Provider.of<CartBloc>(
                                      context)
                                      .selectedPlantType
                                      .toString(),
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: _height * .0166,
                                    color: Color(0xffB1BBC6),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: Color(0xff999999),
                                  size: _height * .025,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: _screenHeight * 0.02,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TruckSizePicker()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: inputBackgroundColor,
                            border: Border.all(
                                color: inputBorderColor,
                                width: 1,
                                style: BorderStyle.solid)),
                        height: _height * .0533,
                        width: _width,
                        // padding: EdgeInsets.symmetric(horizontal: _width *.04),
                        child: Center(
                          child: Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: _width * .04),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  Provider.of<CartBloc>(
                                      context)
                                      .selectedTruckSize
                                      .toString(),
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: _height * .0166,
                                    color: Color(0xffB1BBC6),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: Color(0xff999999),
                                  size: _height * .025,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: _screenHeight * 0.02,
                    ),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CountryPicker()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: inputBackgroundColor,
                            border: Border.all(
                                color: inputBorderColor,
                                width: 1,
                                style: BorderStyle.solid)),
                        height: _height * .0533,
                        width: _width,
                        // padding: EdgeInsets.symmetric(horizontal: _width *.04),
                        child: Center(
                          child: Padding(
                            padding:
                            EdgeInsets.symmetric(horizontal: _width * .04),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  Provider.of<CountryBloc>(
                                      context)
                                      .Country
                                      .toString(),
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: _height * .0166,
                                    color: Color(0xffB1BBC6),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: Color(0xff999999),
                                  size: _height * .025,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: _screenHeight * 0.02,
                    ),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StatePicker()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: inputBackgroundColor,
                            border: Border.all(
                                color: inputBorderColor,
                                width: 1,
                                style: BorderStyle.solid)),
                        height: _height * .0533,
                        width: _width,
                        // padding: EdgeInsets.symmetric(horizontal: _width *.04),
                        child: Center(
                          child: Padding(
                            padding:
                            EdgeInsets.symmetric(horizontal: _width * .04),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  Provider.of<CountryBloc>(
                                      context)
                                      .State
                                      .toString(),
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: _height * .0166,
                                    color: Color(0xffB1BBC6),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: Color(0xff999999),
                                  size: _height * .025,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: _screenHeight * 0.02,
                    ),
                    GestureDetector(
                      onTap: () {
                        _selectDeliveryDate(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: inputBackgroundColor,
                            border: Border.all(
                                color: inputBorderColor,
                                width: 1,
                                style: BorderStyle.solid)),
                        height: _height * .0533,
                        width: _width,
                        // padding: EdgeInsets.symmetric(horizontal: _width *.04),
                        child: Center(
                          child: Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: _width * .04),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                isSelectDate
                                    ? Text(
                                  "Delivery Date: ${selectedDeliveryDate.day}/${selectedDeliveryDate.month}/${selectedDeliveryDate.year}",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: _height * .0166,
                                    color: Color(0xffB1BBC6),
                                  ),
                                ) :
                                Text(
                                  "Delivery Date",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: _height * .0166,
                                    color: Color(0xffB1BBC6),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    _selectDeliveryDate(context);
                                  },
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
                    SizedBox(
                      height: _screenHeight * 0.02,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      autofocus: false,
                      controller: cityCont,
                      textCapitalization: TextCapitalization.words,
                      style: TextStyle(color: appColorPrimary, fontFamily: fontRegular, fontSize: textSizeMedium),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: inputBackgroundColor,
                          focusColor: inputBorderColor,
                          hintText: "City",
                          hintStyle: TextStyle(color: iconColorSecondary, fontFamily: fontRegular, fontSize: textSizeMedium),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: inputBorderColor, width: 0.5)),
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: iconColorSecondary, style: BorderStyle.solid, width: 0))),
                      textInputAction: TextInputAction.next,
                      focusNode: cityNode,
                      validator: (s) {
                        if (s!.isEmpty) return 'City is required';
                        return null;
                      },
                    ),

                    SizedBox(
                      height: _screenHeight * 0.02,
                    ),
                    TextFormField(
                      autofocus: false,
                      controller: deliveryAddressCont,
                      textCapitalization: TextCapitalization.words,
                      style: TextStyle(
                          color: appColorPrimary,
                          fontFamily: fontRegular,
                          fontSize: textSizeMedium),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: inputBackgroundColor,
                          focusColor: inputBorderColor,
                          hintText: "Delivery Address",
                          hintStyle: TextStyle(
                              color: iconColorSecondary,
                              fontFamily: fontRegular,
                              fontSize: textSizeMedium),
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: inputBorderColor, width: 0.5)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: iconColorSecondary,
                                  style: BorderStyle.solid,
                                  width: 0))),
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.newline,
                      maxLines: 6,
                      focusNode: deliveryAddressNode,
                      validator: (s) {
                        if (s!.isEmpty) return 'Field is required';
                        return null;
                      },
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
                    //     height: _height * .159,
                    //     width: _width,
                    //     // padding: EdgeInsets.symmetric(horizontal: _width *.04),
                    //     child: Padding(
                    //       padding:
                    //           EdgeInsets.symmetric(horizontal: _width * .04),
                    //       child: Column(
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         children: [
                    //           SizedBox(height: _height * .018),
                    //           Text(
                    //             "Delivery Address",
                    //             style: GoogleFonts.poppins(
                    //               fontWeight: FontWeight.w400,
                    //               fontSize: _height * .0166,
                    //               color: Color(0xffB1BBC6),
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: _screenHeight * 0.04,
                    ),
                    InkWell(
                      onTap: () {
                        scheduleDeliveryTask();
                        //Navigator.pop(context);
                      },
                      child: Container(
                        width: _width,
                        height: _height * .0633,
                        decoration: BoxDecoration(
                          //border: Border.all(color: Color(0xffB1BBC6)),
                          color: appColorPrimary,
                        ),
                        child: Center(
                            child: Text(
                          "Proceed",
                          style: GoogleFonts.poppins(
                            color: white,
                            fontSize: _height * .016,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                      ),
                    ),
                    // Align(
                    //   alignment: Alignment.bottomCenter,
                    //   child: Container(
                    //     width: double.infinity,
                    //     height: 55.0,
                    //     margin: const EdgeInsetsDirectional.fromSTEB(
                    //         10.0, 0.0, 10.0, 10.0),
                    //     child: ElevatedButton(
                    //       onPressed: () async {},
                    //       style: ElevatedButton.styleFrom(
                    //         padding: const EdgeInsets.all(0),
                    //         textStyle: const TextStyle(
                    //           color: Colors.white,
                    //         ),
                    //         primary: appColorPrimary, // background
                    //         shape: RoundedRectangleBorder(
                    //             borderRadius: BorderRadius.circular(3.0)),
                    //       ),
                    //       child: const Text("Proceed"),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
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

  // void submitOrder(
  //     int dmsOrderId,
  //     String truckSizeCode,
  //     String deliveryMethodCode,
  //     String plantCode,
  //     DateTime deliveryDate,
  //     String deliveryCity,
  //     String deliveryStateCode,
  //     String deliveryAddress,
  //     String deliveryCountryCode) {
  //   Provider.of<OrderBloc>(context)
  //       .submitDmsOrder(
  //           dmsOrderId,
  //           truckSizeCode,
  //           deliveryMethodCode,
  //           plantCode,
  //           deliveryDate,
  //           deliveryCity,
  //           deliveryStateCode,
  //           deliveryAddress,
  //           deliveryCountryCode)
  //       .then((value) => output(value));
  // }
  //
  // output(String payloadResponse) {
  //   print("There you go.Seyi..lets submit orders");
  //   if (payloadResponse.contains("data")) {
  //     var dataB = jsonDecode(payloadResponse);
  //     if (dataB["statusCode"] == 200) {
  //       Provider.of<OrderBloc>(context).isLoading = false;
  //       setState(() {
  //         _submitOrders = SubmitDmsOrder.fromJson(dataB);
  //       });
  //       // nextScreen(
  //       //     context, VerifyyOTP(_submitOrders!.data2!.otp!.otpId.toString()));
  //     } else if (dataB["statusCode"] == 401) {
  //       Provider.of<OrderBloc>(context).isLoading = false;
  //       toast("Unauthorized");
  //     } else if (dataB["statusCode"] == 404) {
  //       Provider.of<OrderBloc>(context).isLoading = false;
  //       toast("Resource not found");
  //     } else {
  //       setState(() {
  //         _submitOrders = SubmitDmsOrder.fromJson(dataB);
  //       });
  //       toast(_submitOrders!.message);
  //     }
  //   }
  // }

  void scheduleDeliveryTask() {
    hideKeyboard(context);
    if (formKey.currentState!.validate()) {
    final CartBloc cb = context.read<CartBloc>();
    final CountryBloc ctb = context.read<CountryBloc>();
    selectedDeliveryMethodCode = cb.deliveryMethodCode!;
    selectedPlantTypeCode = cb.plantTypedCode!;
    selectedTruckSizeCode = cb.truckSizeCode!;
    selectedStateCode = ctb.StateId;
    selectedStateCode = ctb.CountryId!;
    if (selectedDeliveryMethodCode == "" || selectedPlantTypeCode == "" ||
        selectedTruckSizeCode == "" || selectedStateCode == "") {
       toast("Select all field to proceed");
       return;
    }

    nextScreen(context, OrderSummary(
      total: 300,
      cartItemTotal: widget.cartItemTotal,
      dmsOrderId: widget.dmsOrderId,
      shoppingCarts: widget.shoppingCarts,
      selectedDeliveryMethodCode: selectedDeliveryMethodCode,
      selectedPlantTypeCode: selectedPlantTypeCode,
      selectedTruckSizeCode: selectedTruckSizeCode,
      selectedStateCode: selectedStateCode,
      selectedCountryCode: selectedCountryCode,
      selectedDeliveryDate: selectedDeliveryDate,
      address: deliveryAddressCont.text,
      city: cityCont.text,
    ));
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => OrderSummary(
    //             widget.total!, widget.cartItemTotal!)));

  }
  }
}
