import 'dart:convert';
import 'dart:io';

import 'package:dms/layout/appWidget.dart';
import 'package:dms/layout/dms_drawer.dart';
import 'package:dms/screens/carts/checkout.dart';
import 'package:dms/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../../blocs/cart_bloc.dart';
import '../../blocs/counterbloc.dart';
import '../../layout/loading_indicator_widget.dart';
import '../../model/cart_item_model.dart';
import '../../model/shopping_cart.dart';
import '../../network/network_utils.dart';

class Carts extends StatefulWidget {
  const Carts({Key? key}) : super(key: key);

  @override
  _CartsState createState() => _CartsState();
}

class cartList {
  String imageUrl;
  String title;
  int amount;
  cartList(this.imageUrl, this.title, this.amount);
}

class _CartsState extends State<Carts> {
  int currentIndex = 0;
  void _inceaseItem(CartItem item) async {
    final CartBloc cb = Provider.of<CartBloc>(context, listen: false);
    final baseUrl = cb.cartBaseUrl;
    print(baseUrl);
    try {
      Map req = {"shoppingCartItemId": item.shoppingCartItemId, "quantity": item.quantity! + 1};
      var response = await putRequestWithToken('$baseUrl/cart/cartitem/${item.shoppingCartItemId}', req);

      if (this.mounted) {
        if (response.statusCode == 200) {
          var decodedData = jsonDecode(response.body);
          toast(decodedData['message'], length: Toast.LENGTH_LONG);
          setState(() {
            item.quantity = item.quantity! - 1;
          });
        }
      }
    } on SocketException {
      throw 'No Internet connection';
    }
  }

  bool isLoading = false;
  List<CartItem> shoppingCarts = [];
  int subTotal = 0;
  int totalAmount = 0;

  void _decreaseitem(CartItem item) async {
    final CartBloc cb = Provider.of<CartBloc>(context, listen: false);
    final baseUrl = cb.cartBaseUrl;
    print(baseUrl);
    try {
      Map req = {"shoppingCartItemId": item.shoppingCartItemId, "quantity": item.quantity! - 1};
      var response = await putRequestWithToken('$baseUrl/cart/cartitem/${item.shoppingCartItemId}', req);

      if (this.mounted) {
        if (response.statusCode == 200) {
          var decodedData = jsonDecode(response.body);
          toast(decodedData['message'], length: Toast.LENGTH_LONG);
          setState(() {
            item.quantity = item.quantity! - 1;
          });
        }
      }
    } on SocketException {
      throw 'No Internet connection';
    }

  }


  List<cartList> cartProducts = [
    cartList("lib/assets/dang.png", "Bags of Cement", 1650),
    cartList("lib/assets/dongotesug.png", "Bags of Sugar", 1750),
    cartList("lib/assets/dangotesugg.png", "Bags of Cement", 2050),
    cartList("lib/assets/dongotesug.png", "Bags of Sugar", 1690),
    cartList("lib/assets/dangotebig.png", "Bags of Cement", 1720),
  ];
  final _bloc = CounterBlock();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool menuClicked = false;

  @override
  void initState() {
    //addCost();
    getAllCartItem();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    var formatter = NumberFormat("#,###,000");

    return Scaffold(
      backgroundColor: appWhite,
      key: _scaffoldKey,
      appBar: dmsDrawerAppBar(
        context,
        '',
        () {
          _scaffoldKey.currentState!.openDrawer();
          setState(() {
            menuClicked = true;
          });
        },
      ),
      drawer: DMSDrawer(),
      body: Column(children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: _width * .055),
          child: Row(
            children: [
              Text(
                "Cart",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: _height * .03,
                  color: appColorPrimary,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: _height * .019,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: _width * .055),
          child: Row(
            children: [
              Text(
                "Swipe left to delete from Cart",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: _height * .014,
                  color: Color(0xff8D93A1),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: _height * .023),
        shoppingCarts.isEmpty ? LoadingIndicatorWidget() : Container(),
        Expanded(
            child: ListView.builder(
                itemCount: shoppingCarts.length,
                itemBuilder: (BuildContext context, int index) {
                  var mycart = shoppingCarts[index];
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(_width * .06,
                              _height * .01, _width * .06, _height * .01),
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
                            width: _width * .9,
                            height: _height * .17,
                            child: Padding(
                              padding: EdgeInsets.all(_width * .02),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      height: _height * .113,
                                      width: _width * .164,
                                      child: Image.asset(
                                        "lib/assets/dang.png",
                                        fit: BoxFit.fill,
                                      )),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        mycart.product!.name ?? "Product Name",
                                        style: GoogleFonts.poppins(
                                          fontSize: _height * .02,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff343434),
                                          letterSpacing: 0.04,
                                        ),
                                      ),
                                      SizedBox(height: _height * 0.005),
                                      Text(
                                        "N${formatter.format(mycart.product!.price)}.00",
                                        style: GoogleFonts.poppins(
                                          fontSize: _height * .017,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff27AE60),
                                          letterSpacing: 0.04,
                                        ),
                                      ),
                                      SizedBox(height: _height * 0.02),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              var qty = mycart.quantity!;
                                              if (qty <= 1) return;
                                              var q = qty - 1;
                                              mycart.quantity = q;
                                              _decreaseitem(mycart);
                                              // _bloc.counterEventSink
                                              //     .add(DecreaseCount2());
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
                                          Text(
                                            mycart.quantity.toString(),
                                            style: GoogleFonts.montserrat(
                                              fontSize: _height * 0.02,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          SizedBox(width: _width * .05),
                                          InkWell(
                                            onTap: () {
                                              var mainCount = mycart.quantity! + 1;
                                              mycart.quantity = mainCount;
                                              _inceaseItem(mycart);
                                              // _bloc.counterEventSink
                                              //     .add(IncreaseCount2());
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
                                                  ),
                                                )),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                })),
      ]),
      bottomNavigationBar: _bottomBar(context),
    );
  }

  Widget _bottomBar(context) {
    addCost() async {
      int sum = 0;
      for (var i = 0; i < shoppingCarts.length; i++) {
        sum += shoppingCarts[i].product!.price!;
      }

      return sum;
    }

    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    var formatter = NumberFormat("#,###,000");
    return Container(
      height: _height * .3,
      decoration: const BoxDecoration(
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
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
        ),
      ),
      child: Column(children: [
        SizedBox(height: _height * .014),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: _width * .05),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              "Product Quantity",
              style: GoogleFonts.poppins(
                  fontSize: _height * .019,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff7A7C85)),
            ),
            Text(
              shoppingCarts.length.toString(),
              style: GoogleFonts.poppins(
                  fontSize: _height * .019,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff333542)),
            ),
          ]),
        ),
        SizedBox(height: _height * .02),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: _width * .05),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              "Total Price",
              style: GoogleFonts.poppins(
                  fontSize: _height * .019,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff7A7C85)),
            ),
            FutureBuilder(
              future: addCost(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var _total = snapshot.data!;
                  return Text(
                    "\N${formatter.format(_total)}.00",
                    style: GoogleFonts.poppins(
                        fontSize: _height * .031,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff27AE60)),
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ]),
        ),
        SizedBox(
          height: _height * .078,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: _width * .05),
          child: Row(children: [
            Center(
              child: Container(
                height: _height * .0633,
                width: _width * .9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  color: appColorPrimary,
                ),
                child: FutureBuilder(
                  future: addCost(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var _total = snapshot.data!;
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Checkout(
                                      int.parse(_total.toString()),
                                      shoppingCarts.length)));
                        },
                        child: Center(
                          child: Text(
                            "Checkout",
                            style: GoogleFonts.poppins(
                              color: appWhite,
                              fontWeight: FontWeight.w600,
                              fontSize: _height * .0174,
                            ),
                          ),
                        ),
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
              ),
            ),
          ]),
        ),
      ]),
    );
  }


  void getAllCartItem() async {

      final CartBloc cb = Provider.of<CartBloc>(context, listen: false);
      final baseUrl = cb.cartBaseUrl;
      print(baseUrl);
      try {
        setState(() {
          isLoading = true;
        });
        var response = await getRequestWithToken('$baseUrl/cart');

        if (this.mounted) {
          if (response.statusCode == 200) {
            var decodedData = jsonDecode(response.body);
            List? newdata = decodedData["data"]["shoppingCart"]["shoppingCartItems"];
            setState(() {
              shoppingCarts = newdata!.map((m) => CartItem.fromJson(m)).toList();
              isLoading = false;
            });
          }
        }
      } on SocketException {
        setState(() {
          isLoading = false;
        });
        throw 'No Internet connection';

      }
  }


}
