import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constant.dart';
import '../../model/product_model.dart';
import '../../screens/products/productDetails.dart';
import '../../utils/colors.dart';
import '../appWidget.dart';


class ProductSearchResults extends StatefulWidget {
  final List<Product> results;
  final Function onTap;

  ProductSearchResults(this.results, this.onTap);

  @override
  State<ProductSearchResults> createState() => _ProductSearchResultsState();
}

class _ProductSearchResultsState extends State<ProductSearchResults> {
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    var mypadh = SizedBox(height: _screenHeight * .0053);

    return SingleChildScrollView(
      padding: EdgeInsets.all(_screenHeight * .01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: _screenHeight * .01, horizontal: _screenWidth * .06),
                child: Text(
                  "Products",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: isDark ? Colors.white : Color(0xFF1B1E28),
                  ),
                ),
              ),
            ],
          ),


          ...widget.results.map(
                  (e) => productItem(e)),

          // Text("Result Loaded"),
          // Expanded(
          //     child: ListView.builder(
          //       itemCount: this.results.length,
          //       itemBuilder: (BuildContext context, int index) {
          //         var mywidth = _screenWidth * .9;
          //         var myheight = _screenHeight * .19;
          //
          //           var _productList = results[index];
          //           return InkWell(
          //             onTap: () {
          //               Navigator.push(
          //                   context,
          //                   MaterialPageRoute(
          //                       builder: (context) =>
          //                           ProductDetails(
          //                             _productList.productId!,
          //                             "lib/assets/dangotebig.png",
          //                             _productList.name!,
          //                             _productList.name!,
          //                             "SAP1234353",
          //                             _productList.description!,
          //                             24800,
          //                           )));
          //             },
          //             child: Padding(
          //               padding: EdgeInsets.fromLTRB(
          //                   _screenWidth * .06,
          //                   _screenHeight * .01,
          //                   _screenWidth * .06,
          //                   _screenHeight * .01),
          //               child: Container(
          //                 decoration: BoxDecoration(
          //                   color: appWhite,
          //                   boxShadow: [
          //                     BoxShadow(
          //                       color: Colors.black12,
          //                       blurStyle: BlurStyle.outer,
          //                       blurRadius: 10,
          //                       spreadRadius: 0,
          //                       offset: Offset.zero,
          //                     ),
          //                   ],
          //                 ),
          //                 width: mywidth,
          //                 height: myheight,
          //                 child: Padding(
          //                   padding: EdgeInsets.all(_screenWidth * .03),
          //                   child: Row(
          //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //                       children: [
          //                         _productList.primaryProductImageUrl == null ? Align(
          //                           alignment: Alignment.centerLeft,
          //                           child: Image.asset(
          //                             "lib/assets/dangotebig.png",
          //                             height: _screenHeight * .121,
          //                             width: _screenWidth * .18,
          //                           ),
          //                         ) : Align(
          //                           alignment: Alignment.centerLeft,
          //                           child: Image.network(
          //                             _productList.primaryProductImageUrl!,
          //                             height: _screenHeight * .121,
          //                             width: _screenWidth * .18,
          //                           ),
          //                         ),
          //                         Column(
          //                             crossAxisAlignment: CrossAxisAlignment.start,
          //                             children: [
          //                               mypadh,
          //                               Text(
          //                                 _productList.name!,
          //                                 style: GoogleFonts.openSans(
          //                                   fontWeight: FontWeight.w700,
          //                                   fontSize: _screenHeight * .02,
          //                                   color: Color(0xff343434),
          //                                 ),
          //                               ),
          //                               SizedBox(height: _screenHeight * .0023),
          //                               Text(
          //                                 "SAP1234353",
          //                                 style: GoogleFonts.openSans(
          //                                   fontWeight: FontWeight.w400,
          //                                   fontSize: _screenHeight * .015,
          //                                   color: Color(0xff8F9090),
          //                                 ),
          //                               ),
          //                               mypadh,
          //                               Text(
          //                                 _productList.description!,
          //                                 style: GoogleFonts.openSans(
          //                                   fontWeight: FontWeight.w400,
          //                                   fontSize: _screenHeight * .012,
          //                                   color: Color(0xff8F9090),
          //                                 ),
          //                               ),
          //                               mypadh,
          //                               Text(
          //                                 // "N${_productList.amount}",
          //                                 "\N24,800",
          //                                 style: GoogleFonts.openSans(
          //                                   fontWeight: FontWeight.w700,
          //                                   fontSize: _screenHeight * .015,
          //                                   color: Color(0xff27AE60),
          //                                 ),
          //                               ),
          //                             ]),
          //                       ]),
          //                 ),
          //               ),
          //             ),
          //           );
          //
          //
          //       },
          //     )),

          // Expanded(
          //   child: ListView.builder(
          //       scrollDirection: Axis.vertical,
          //       itemCount: widget.results.length,
          //       shrinkWrap: true,
          //       itemBuilder: (context, index) {
          //         return Padding(
          //             padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
          //             child: Column(
          //               children: <Widget>[
          //                 Row(
          //                   children: <Widget>[
          //                     // ClipRRect(
          //                     //   child: Image.asset(
          //                     //     'lib/assets/dangotebig.png',
          //                     //     width: _screenWidth / 3,
          //                     //     height: _screenWidth / 3.2,
          //                     //     fit: BoxFit.fill,
          //                     //   ),
          //                     //   borderRadius: BorderRadius.circular(10),
          //                     // ),
          //                     Expanded(
          //                       child: Column(
          //                         crossAxisAlignment: CrossAxisAlignment.start,
          //                         children: <Widget>[
          //                           Padding(
          //                             padding: EdgeInsets.only(left: 10.0),
          //                             child: Column(
          //                               crossAxisAlignment: CrossAxisAlignment.start,
          //                               children: <Widget>[
          //                                 text(widget.results[index].name, textColor: appTextColorPrimary, fontSize: textSizeLargeMedium, fontFamily: fontBold),
          //                                 text(widget.results[index].productType, fontSize: textSizeMedium, textColor: appTextColorPrimary),
          //                                 SizedBox(
          //                                   height: 4,
          //                                 ),
          //                                 text(widget.results[index].description, fontSize: textSizeSMedium, maxLine: 3),
          //                                 SizedBox(
          //                                   height: 4,
          //                                 ),
          //                               ],
          //                             ),
          //                           )
          //                         ],
          //                       ),
          //                     )
          //                   ],
          //                 ),
          //                 SizedBox(
          //                   height: 16,
          //                 ),
          //                 Divider()
          //               ],
          //             ));
          //       }),
          // )
        ],
      ),
    );
  }


  Widget productItem(Product product){
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    var mypadh = SizedBox(height: _screenHeight * .0053);
    // return Padding(
    //     // padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
    //     padding: EdgeInsets.all(_screenWidth * .03),
    //     child: Column(
    //       children: <Widget>[
    //         Row(
    //           children: <Widget>[
    //             ClipRRect(
    //               child: product.primaryProductImageUrl == null ? Image.asset(
    //                 'lib/assets/dangotebig.png',
    //                 width: _screenWidth / 3,
    //                 height: _screenWidth / 2.5,
    //                 fit: BoxFit.fill,
    //               ) : Image.network(
    //                 product.primaryProductImageUrl!,
    //                 height: _screenHeight / 3,
    //                 width: _screenWidth / 2.5,
    //               ),
    //               borderRadius: BorderRadius.circular(10),
    //             ),
    //             Expanded(
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: <Widget>[
    //                   Padding(
    //                     padding: EdgeInsets.only(left: _screenWidth * .06,),
    //                     child: Column(
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: <Widget>[
    //                         text(product.name, textColor: appTextColorPrimary, fontSize: _screenHeight * .02, isBoldText: true, fontFamily: fontBold),
    //                         text("SAP1234353", fontSize: _screenHeight * .015, textColor: Color(0xff8F9090)),
    //                         SizedBox(
    //                           height: 4,
    //                         ),
    //                         text(product.description, fontSize: _screenHeight * .012, isLongText: true, textColor: Color(0xff8F9090), maxLine: 3),
    //                         SizedBox(
    //                           height: 4,
    //                         ),
    //                       ],
    //                     ),
    //                   )
    //                 ],
    //               ),
    //             )
    //           ],
    //         ),
    //         SizedBox(
    //           height: 16,
    //         ),
    //         Divider()
    //       ],
    //     ));

    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ProductDetails(
                        product.productId!
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
          width: _screenWidth * .9,
          height: _screenHeight * .19,
          child: Padding(
            padding: EdgeInsets.all(_screenWidth * .03),
            child: Row(
                children: [
                  product.primaryProductImageUrl == null ? Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset(
                      "lib/assets/dangotebig.png",
                      height: _screenHeight * .121,
                      width: _screenWidth * .18,
                    ),
                  ) : Align(
                    alignment: Alignment.centerLeft,
                    child: Image.network(
                      product.primaryProductImageUrl!,
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
                            product.name!,
                            style: GoogleFonts.openSans(
                              fontWeight: FontWeight.w700,
                              fontSize: _screenHeight * .02,
                              color: Color(0xff343434),
                            ),
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
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
                            product.description!,
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
}
