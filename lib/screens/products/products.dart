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
  bool isLoadingMore = false;
  int page = 1;

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
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        color: inputBackgroundColor,
                        border: Border.all(
                            color: inputBorderColor,
                            width: 1,
                            style: BorderStyle.solid)),
                    height: 50,
                    width: _screenWidth * 0.90,
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 13),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.search_sharp,
                              color: Color(0xffB7BBC5),
                              size: 30,
                            ),
                            mypadr,
                            Text(
                              "Search Product",
                              style: GoogleFonts.poppins(
                                  color: iconColorSecondary,
                                  fontSize: textSizeSMedium),
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ],
                    ),
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
            itemCount: allProduct.length,
            itemBuilder: (BuildContext context, int index) {
              var mywidth = _screenWidth * .9;
              var myheight = _screenHeight * .19;
               if(index < allProduct.length) {
                var _productList = allProduct[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ProductDetails(
                                  _productList.productId!,
                                  "lib/assets/dangotebig.png",
                                  _productList.name!,
                                  _productList.name!,
                                  "SAP1234353",
                                  _productList.description!,
                                  24800,
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                "lib/assets/dangotebig.png",
                                height: _screenHeight * .121,
                                width: _screenWidth * .18,
                              ),
                              Column(
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
                                    Text(
                                      _productList.description!,
                                      style: GoogleFonts.openSans(
                                        fontWeight: FontWeight.w400,
                                        fontSize: _screenHeight * .012,
                                        color: Color(0xff8F9090),
                                      ),
                                    ),
                                    mypadh,
                                    Text(
                                      // "N${_productList.amount}",
                                      "₦24,800",
                                      style: GoogleFonts.openSans(
                                        fontWeight: FontWeight.w700,
                                        fontSize: _screenHeight * .015,
                                        color: Color(0xff27AE60),
                                      ),
                                    ),
                                  ]),
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
        ],
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
          setState(() {
            allProduct.addAll(newdata!.map((m) => Product.fromJson(m)).toList());
          });
        }
      }
    } on SocketException {
      throw 'No Internet connection';
    }

  }
}
