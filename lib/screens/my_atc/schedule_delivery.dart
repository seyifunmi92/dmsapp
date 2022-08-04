import 'package:dms/constant.dart';
import 'package:flutter/material.dart';
import 'package:dms/layout/appWidget.dart';
import 'package:dms/utils/colors.dart';

class ScheduleDelivery extends StatefulWidget {
  const ScheduleDelivery({Key? key}) : super(key: key);

  @override
  State<ScheduleDelivery> createState() => _ScheduleDeliveryState();
}

class _ScheduleDeliveryState extends State<ScheduleDelivery> {

  var formKey = GlobalKey<FormState>();
  var deliveryDateCont = TextEditingController();
  var deliveryDateNode = FocusNode();
  var deliveryAddressCont = TextEditingController();
  var deliveryAddressNode = FocusNode();

  @override
  Widget build(BuildContext context) {

    final  _screenWidth = MediaQuery.of(context).size.width;
    final  _screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: dmsAppBar(context, '', showBack: true),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.only(left: _screenWidth * 0.07, right: _screenWidth * 0.07),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: _screenHeight * 0.02,
              ),
              text("Schedule Delivery", isBoldText: true, fontSize: 28.0),
              SizedBox(
                height: _screenHeight * 0.02,
              ),
              text("Kindly choose delivery method and type.", fontSize: 13.0, textColor: appTextColorSecondary),
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
                            color: inputBackgroundColor,
                            border: Border.all(color: inputBorderColor, width: 1, style: BorderStyle.solid
                            )),
                        height: 50,
                        width: _screenWidth * 0.90,
                        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 13),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Delivery Type",
                              style: TextStyle(color: iconColorSecondary, fontFamily: fontRegular, fontSize: textSizeMedium),
                              textAlign: TextAlign.start,
                            ),
                            Icon(Icons.arrow_drop_down, color: iconColorSecondary,),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: _screenHeight * 0.02,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            color: inputBackgroundColor,
                            border: Border.all(color: inputBorderColor, width: 1, style: BorderStyle.solid
                            )),
                        height: 50,
                        width: _screenWidth * 0.90,
                        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 13),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Truck Size",
                              style: TextStyle(color: iconColorSecondary, fontFamily: fontRegular, fontSize: textSizeMedium),
                              textAlign: TextAlign.start,
                            ),
                            Icon(Icons.arrow_drop_down, color: iconColorSecondary,),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: _screenHeight * 0.02,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      autofocus: false,
                      controller: deliveryDateCont,
                      textCapitalization: TextCapitalization.words,
                      style: TextStyle(color: appColorPrimary, fontFamily: fontRegular, fontSize: textSizeMedium),
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: const Icon(
                              Icons.calendar_month,
                            ), onPressed: () {},),
                          filled: true,
                          fillColor: inputBackgroundColor,
                          focusColor: inputBorderColor,
                          hintText: "Delivery Date",
                          hintStyle: TextStyle(color: iconColorSecondary, fontFamily: fontRegular, fontSize: textSizeMedium),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: inputBorderColor, width: 0.5)),
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: iconColorSecondary, style: BorderStyle.solid, width: 0))),
                      textInputAction: TextInputAction.next,
                      focusNode: deliveryDateNode,
                      validator: (s) {
                        if (s!.isEmpty) return 'Field is required';
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
                      style: TextStyle(color: appColorPrimary, fontFamily: fontRegular, fontSize: textSizeMedium),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: inputBackgroundColor,
                          focusColor: inputBorderColor,
                          hintText: "Delivery Address",
                          hintStyle: TextStyle(color: iconColorSecondary, fontFamily: fontRegular, fontSize: textSizeMedium),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: inputBorderColor, width: 0.5)),
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: iconColorSecondary, style: BorderStyle.solid, width: 0))),
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.newline,
                      maxLines: 6,
                      focusNode: deliveryAddressNode,
                      validator: (s) {
                        if (s!.isEmpty) return 'Field is required';
                        return null;
                      },
                    ),

                    SizedBox(
                      height: _screenHeight * 0.17,
                    ),

                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: double.infinity,
                        height: 55.0,
                        margin: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 10.0),
                        child: ElevatedButton(
                          onPressed: () async {
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(0),
                            textStyle: const TextStyle(
                              color:  Colors.white,
                            ),
                            primary:  appColorPrimary, // background
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)),
                          ),
                          child: const Text(
                              "Schedule Delivery"
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
