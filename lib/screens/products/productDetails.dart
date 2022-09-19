import 'dart:convert';

import 'package:dms/blocs/counter.dart';
import 'package:dms/blocs/counterbloc.dart';
import 'package:dms/layout/appWidget.dart';
import 'package:dms/screens/carts/carts.dart';

import 'package:dms/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../../blocs/cart_bloc.dart';
import '../../layout/account_picker.dart';
import '../../layout/loading_indicator_widget.dart';
import '../../network/network_utils.dart';

class ProductDetails extends StatefulWidget {
  int productId;
  String imageUrl;
  String productName;
  String title;
  String sapID;
  String productDetails;
  int amount;
  ProductDetails(this.productId, this.imageUrl, this.productName, this.title, this.sapID,
      this.productDetails, this.amount);
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int currentIndex = 0;
  void _increaseQuantity() {
    setState(() {
      quantity++;
    });
  }

  int distributorSapAccountId = 0;
  int quantity = 1;
  bool isLoading = false;

  void _decreaseQuantity() {
    setState(() {
      quantity--;
    });
  }


  @override
  void initState() {

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: dmsAppBarwithCart(context, ""),
      body: Center(
        child: Container(
            height: MediaQuery.of(context).size.height * .3,
            width: MediaQuery.of(context).size.width * .432,
            child: Image.asset(
              widget.imageUrl,
              fit: BoxFit.fill,
            )),
      ),
      bottomNavigationBar: _bottomBar(context),
    );
  }

  Widget _bottomBar(context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    var formatter = NumberFormat("#,###,000");
    return Container(
      height: _height * .55,
      decoration: const BoxDecoration(
        color: appWhite,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(children: [
        // isLoading ? LoadingIndicatorWidget() : Container(),
        SizedBox(
          height: _height * 0.045,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: _width * .08),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.productName,
                style: GoogleFonts.openSans(
                  fontSize: _height * .024,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff141515),
                  letterSpacing: 0.04,
                ),
                overflow: TextOverflow.ellipsis,
              ),

            ],
          ),
        ),
        Text(
          "N${formatter.format(widget.amount)}.00",
          style: GoogleFonts.openSans(
            fontSize: _height * .024,
            fontWeight: FontWeight.w700,
            color: Color(0xff27AE60),
            letterSpacing: 0.04,
          ),
        ),
        SizedBox(
          height: _height * .02,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: _width * .08),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.sapID,
                style: GoogleFonts.openSans(
                  fontSize: _height * .02,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff8F9090),
                  letterSpacing: 0.04,
                ),
              ),
              Text(
                "",
                style: GoogleFonts.openSans(
                  //fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff27AE60),
                  letterSpacing: 0.04,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: _height * .02,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: _width * .08),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Description",
                style: GoogleFonts.openSans(
                  fontSize: _height * .02,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff8F9090),
                  letterSpacing: 0.04,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: _height * .02,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: _width * .08),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                widget.productDetails,
                style: GoogleFonts.openSans(
                  fontSize: _height * 0.018,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff8F9090),
                  letterSpacing: 0.04,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: _height * .024),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: _width * .08),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  _decreaseQuantity();
                  // _bloc.counterEventSink.add(DecreaseCount());
                },
                child: Container(
                  width: _width * .08,
                  height: _height * .04,
                  color: Color(0xffE2E3E9),
                  child: Center(
                      child: Text(
                    "-",
                    style: TextStyle(
                      fontSize: _height * 0.018,
                    ),
                  )),
                ),
              ),
              SizedBox(width: _width * .05),
              // StreamBuilder(
              //     stream: _bloc.counter,
              //     initialData: 0,
              //     builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              //       var currentIndex = snapshot.data;
              //       return Text(
              //         currentIndex.toString(),
              //         style: GoogleFonts.montserrat(
              //           fontSize: _height * 0.02,
              //           fontWeight: FontWeight.w500,
              //         ),
              //       );
              //     }),
        Text(
          quantity.toString(),
          style: GoogleFonts.montserrat(
            fontSize: _height * 0.02,
            fontWeight: FontWeight.w500,
          ),
        ),
              SizedBox(width: _width * .05),
              InkWell(
                onTap: () {
                  _increaseQuantity();
                },
                child: Container(
                  width: _width * .08,
                  height: _height * .04,
                  color: appColorPrimary,
                  child: Center(
                      child: Text(
                    "+",
                    style: TextStyle(
                      color: appWhite,
                      fontSize: _height * 0.018,
                    ),
                  )),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: _height * .04,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AccountPicker()));
          },
          child: Container(
            decoration: BoxDecoration(
                color: inputBackgroundColor,
                border: Border.all(
                    color: inputBorderColor,
                    width: 1,
                    style: BorderStyle.solid)),
            height: _height * .0628,
            width: _width * 0.86,
            padding:
            EdgeInsets.symmetric(horizontal: 14, vertical: 13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Provider.of<CartBloc>(
                      context)
                      .selectedAccount
                      .toString(),
                  style: GoogleFonts.poppins(
                      color: Color(0xffB1BBC6),
                      fontWeight: FontWeight.w400,
                      // fontFamily: fontRegular,
                      fontSize: _height * .015),
                  textAlign: TextAlign.start,
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: iconColorSecondary,
                  size: _height * .027,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: _height * .04,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: _width * .08),
          child: Row(children: [
            Center(
              child: Container(
                height: _height * .0633,
                width: _width * .84,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  color: appColorPrimary,
                ),
                child: InkWell(
                  onTap: () {
                    addProductToCart();
                  },
                  child: Center(
                    child: Text(
                      "Add to Cart",
                      style: GoogleFonts.poppins(
                        color: appWhite,
                        fontWeight: FontWeight.w600,
                        fontSize: _height * .017,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ]),
    );
  }

  void addProductToCart() async {
    final CartBloc cb = context.read<CartBloc>();
    distributorSapAccountId = cb.distributorSapAccountId;
    if(distributorSapAccountId == 0){
      return toast("Select account to proceed");
    }
    setState(() {
      isLoading = true;
    });
    Map req = {"productId": widget.productId, "distributorSapAccountId": distributorSapAccountId, "channelCode": "Mobile", "quantity": quantity, "unitOfMeasureCode": "kg"};

    await postRequestWithToken('https://dms-order-ms.azurewebsites.net/api/cart/cartitem', req).then((value) {
      // print(value);
      // toast("Product added to the cart", length: Toast.LENGTH_LONG);
      if (value.statusCode.isSuccessful()) {
        var data = jsonDecode(value.body);
        print(data);
        toast(data['message'], length: Toast.LENGTH_LONG);
        setState(() {
          isLoading = false;
        });
      } else {
        if (value.body.isJson()) {
          var data = jsonDecode(value.body);
          print("Omo Error $data");
          toast(data['statusCode'], length: Toast.LENGTH_LONG);
          setState(() {
            isLoading = false;
          });
        }
      }
    }).catchError((e) {
      isLoading = false;
      toast("We are unable to complete your request at this time", length: Toast.LENGTH_LONG);
      print(e.toString());
      setState(() {});

    });
  }
}
