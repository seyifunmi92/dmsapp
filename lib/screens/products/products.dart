import 'dart:convert';
import 'dart:io';

import 'package:dms/constant.dart';
import 'package:dms/layout/appWidget.dart';
import 'package:dms/screens/products/productDetails.dart';
import 'package:dms/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../blocs/product_bloc.dart';
import '../../layout/loading_indicator_widget.dart';
import '../../layout/search_product_delegate.dart';
import '../../model/product_model.dart';
import '../../network/network_utils.dart';
import '../../utils/animate_loader.dart';

class Products extends StatefulWidget {

  String? companyCode;

   Products({Key? key,required this.companyCode}) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class productItems {
  String imageUrl;
  String productName;
  String title;
  String sapID;
  String productDetails;
  int amount;
  productItems(this.imageUrl, this.productName, this.title, this.sapID,
      this.productDetails, this.amount);
}

class _ProductsState extends State<Products> {
  String narration = "";
  var formKey = GlobalKey<FormState>();
  var deliveryDateCont = TextEditingController();
  var deliveryDateNode = FocusNode();
  var deliveryAddressCont = TextEditingController();
  var deliveryAddressNode = FocusNode();
  List<Product> allProduct = [];
  bool isLoading = false;
  bool isLoadingMore = true;
  int _numberOfPostsPerRequest = 10;
  int page = 1;
  ScrollController _scrollController = ScrollController();
  // final SearchProductDelegate _searchDelegate = SearchProductDelegate();

  List<productItems> myproducts = [
    productItems(
        "lib/assets/dangotebig.png",
        "Dangote Falcon",
        "Bags of Cement",
        "SAP1234353",
        "Finibus Bonorum et Malorum\" by Cicero are \nalso reproduced in their exact original form,\naccompanied by English versions",
        1650),
    productItems(
        "lib/assets/dangotebig.png",
        "Dangote Felly",
        "Bags of Cement",
        "SAP1234353",
        "Finibus Bonorum et Malorum\" by Cicero are \nalso reproduced in their exact original form,\naccompanied by English versions",
        1650),
    productItems(
        "lib/assets/dangotebig.png",
        "Dangote casty",
        "Bags of Cement",
        "SAP1234353",
        "Finibus Bonorum et Malorum\" by Cicero are \nalso reproduced in their exact original form,\naccompanied by English versions",
        1650),
    productItems(
        "lib/assets/dangotebig.png",
        "Dangote yasty",
        "Bags of Cement",
        "SAP1234353",
        "Finibus Bonorum et Malorum\" by Cicero are \nalso reproduced in their exact original form,\naccompanied by English versions",
        1650),
    productItems(
        "lib/assets/dangotebig.png",
        "Dangote Tasty",
        "Bags of Cement",
        "SAP1234353",
        "Finibus Bonorum et Malorum\" by Cicero are \nalso reproduced in their exact original form,\naccompanied by English versions",
        1650),
  ];

  @override
  void initState() {
    loadProducts(page);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    var mypadr = SizedBox(width: _screenWidth * .03);
    var mypadh = SizedBox(height: _screenHeight * .0053);

    return Scaffold(
      backgroundColor: appWhite,
      appBar: dmsAppBarwithCart(context, ""),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: _screenWidth * .055),
            child: Row(
              children: [
                Text(
                  "Products",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: _screenHeight * .03,
                    color: appColorPrimary,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: _screenHeight * .02,
          ),
          Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
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
                //     padding: EdgeInsets.symmetric(horizontal: 14, vertical: 13),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Row(
                //           children: [
                //             Icon(
                //               Icons.search_sharp,
                //               color: Color(0xffB7BBC5),
                //               size: 30,
                //             ),
                //             mypadr,
                //             Text(
                //               "Search Product",
                //               style: GoogleFonts.poppins(
                //                   color: iconColorSecondary,
                //                   fontSize: textSizeSMedium),
                //               textAlign: TextAlign.start,
                //             ),
                //           ],
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: _screenWidth * .04),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          await showSearch<int>(context: context, delegate: SearchProductDelegate(widget.companyCode!));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: inputBackgroundColor,
                              border: Border.all(
                                  color: inputBorderColor,
                                  width: 1,
                                  style: BorderStyle.solid)),
                          height: _screenHeight * .0533,
                          width: _screenWidth * 0.9,
                          padding: EdgeInsets.only(
                              left: _screenWidth * .05, top: _screenHeight * .006),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.search_rounded,
                                color: Color(0xffB7BBC5),
                                size: _screenHeight * .0313,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: _screenWidth * 0.01),
                                child: Text(
                                  "Search Products",
                                  style: GoogleFonts.poppins(
                                    color: Color(0xffB7BBC5),
                                    fontWeight: FontWeight.w400,
                                    fontSize: _screenHeight * .014,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // InkWell(
                      //   onTap: () {
                      //     showDialog(
                      //         context: context,
                      //         builder: (BuildContext context) {
                      //           return _filterDialog(context);
                      //         });
                      //   },
                      //   child: Container(
                      //     color: appColorPrimary,
                      //     height: _screenHeight * .0569,
                      //     width: _screenWidth * .1205,
                      //     child: Image.asset(
                      //       "lib/assets/new.png",
                      //       height: _screenHeight * 0.019,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                SizedBox(
                  height: _screenHeight * 0.02,
                ),
              ],
            ),
          ),
              allProduct.isEmpty ? LoadingIndicatorWidget() : Container(),

          Expanded(
              child: ListView.builder(
                controller: _scrollController,
            itemCount: allProduct.length,
            itemBuilder: (BuildContext context, int index) {
              var mywidth = _screenWidth * .9;
              var myheight = _screenHeight * .19;

              _scrollController.addListener(() {
// nextPageTrigger will have a value equivalent to 80% of the list size.
                var nextPageTrigger = 0.8 * _scrollController.position.maxScrollExtent;

// _scrollController fetches the next paginated data when the current postion of the user on the screen has surpassed
                if (_scrollController.position.pixels > nextPageTrigger && isLoadingMore == true) {
                  isLoading = true;
                  loadProducts(page++);
                }
              });

               if(index < allProduct.length || index == allProduct.length) {
                var _productList = allProduct[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ProductDetails(
                                  _productList.productId!
                                )));
                  },
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                        _screenWidth * .06,
                        _screenHeight * .01,
                        _screenWidth * .06,
                        _screenHeight * .01),
                    child: Container(
                      decoration: BoxDecoration(
                        color: appWhite,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurStyle: BlurStyle.outer,
                            blurRadius: 10,
                            spreadRadius: 0,
                            offset: Offset.zero,
                          ),
                        ],
                      ),
                      width: mywidth,
                      height: myheight,
                      child: Padding(
                        padding: EdgeInsets.all(_screenWidth * .03),
                        child: Row(
                            children: [
                              _productList.primaryProductImageUrl == null ? Align(
                                alignment: Alignment.centerLeft,
                                child: Image.asset(
                                  "lib/assets/dangotebig.png",
                                  height: _screenHeight * .121,
                                  width: _screenWidth * .18,
                                ),
                              ) : Align(
                                alignment: Alignment.centerLeft,
                                child: Image.network(
                                    _productList.primaryProductImageUrl!,
                                  height: _screenHeight * .121,
                                  width: _screenWidth * .18,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: _screenWidth * .06,),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      mypadh,
                                      Text(
                                        _productList.name!,
                                        style: GoogleFonts.openSans(
                                          fontWeight: FontWeight.w700,
                                          fontSize: _screenHeight * .02,
                                          color: Color(0xff343434),
                                        ),
                                      ),
                                      mypadh,
                                      SizedBox(height: _screenHeight * .0023),
                                      Text(
                                        "SAP1234353",
                                        style: GoogleFonts.openSans(
                                          fontWeight: FontWeight.w400,
                                          fontSize: _screenHeight * .015,
                                          color: Color(0xff8F9090),
                                        ),
                                      ),
                                      mypadh,
                                      mypadh,
                                      Text(
                                        _productList.description!,
                                        style: GoogleFonts.openSans(
                                          fontWeight: FontWeight.w400,
                                          fontSize: _screenHeight * .012,
                                          color: Color(0xff8F9090),
                                        ),
                                        softWrap: true,
                                      ),
                                      mypadh,
                                      // Text(
                                      //   // "N${_productList.amount}",
                                      //   "\N24,800",
                                      //   style: GoogleFonts.openSans(
                                      //     fontWeight: FontWeight.w700,
                                      //     fontSize: _screenHeight * .015,
                                      //     color: Color(0xff27AE60),
                                      //   ),
                                      // ),
                                    ]),
                              ),
                            ]),
                      ),
                    ),
                  ),
                );
              }
              return Opacity(
                  opacity: 1.0,
                  child: LoadingIndicatorWidget()
              );
            },
          )),
          // LoadingIndicatorWidget()
          isLoading ? Align(alignment: Alignment.bottomCenter,child: CircularProgressIndicator()) : Container(),
        ],
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
                      "Filter Products",
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
                    // padding: EdgeInsets.symmetric(horizontal: _width *.04),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: _width * .04),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Product Type",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: _height * .0166,
                                color: Color(0xffB1BBC6),
                              ),
                            ),
                            Icon(
                              Icons.calendar_month,
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
                              "Specification",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: _height * .0166,
                                color: Color(0xffB1BBC6),
                              ),
                            ),
                            Icon(
                              Icons.arrow_drop_down,
                              color: Color(0xff999999),
                              size: _height * .0296,
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
                            color: Colors.white,
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

  loadProducts(int page) async {
    final ProductBloc pb = Provider.of<ProductBloc>(context, listen: false);
    final baseUrl = pb.productBaseUrl;
    print(baseUrl);
    try {
      var response = await await getRequestWithToken('$baseUrl/product?CompanyCode=${widget.companyCode}&PageIndex=$page&PageSize=10');

      if (this.mounted) {
        if (response.statusCode == 200) {
          var decodedData = jsonDecode(response.body);
          List? newdata = decodedData["data"]["items"];
          if(newdata!.length < 10){
            isLoadingMore = false;
          }
          setState(() {
            isLoading = false;
            allProduct.addAll(newdata.map((m) => Product.fromJson(m)).toList());
          });
        }
      }
    } catch (e) {
      isLoading = false;
      print(e.toString());
      throw 'No Internet connection';
    }

  }
}
