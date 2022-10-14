import 'dart:convert';

import 'package:dms/layout/search/product_search_result.dart';
import 'package:dms/layout/search_error.dart';
import 'package:dms/utils/colors.dart';
import 'package:dms/utils/next_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../blocs/product_bloc.dart';

import '../model/product_model.dart';
import '../network/network_utils.dart';
import '../screens/products/productDetails.dart';
import 'loading_indicator_widget.dart';

class SearchProductDelegate extends SearchDelegate<int>{

  List<Product> _allProduct = [];
  String companyCode;

  SearchProductDelegate(this.companyCode);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return <Widget>[
      query.isEmpty ? Container() : IconButton(
        tooltip: "Clear Search",
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      tooltip: "Search Back",
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () => close(context, 0),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ProductSearchResults(_allProduct, _presentProduct);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: _searchProducts(context, query),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ProductSearchResults(_allProduct, _presentProduct);
        } else if (snapshot.hasError) {
          return SearchError();
        }

        // By default, show a loading spinner.
        return LoadingIndicatorWidget();
      },
    );
  }


  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    assert(theme != null);
    return theme.copyWith(
      primaryColor: Theme.of(context).brightness == Brightness.dark ? appColorPrimary : Colors.white,
      primaryIconTheme: theme.primaryIconTheme.copyWith(color: Color(0xFFb3bbbf)),
      primaryColorBrightness: Theme.of(context).brightness,
      primaryTextTheme: theme.textTheme,
    );
  }


  Future<List<Product>> _searchProducts(BuildContext context,String text) async {
    final ProductBloc pb = Provider.of<ProductBloc>(context, listen: false);
    final baseUrl = pb.productBaseUrl;
    print(baseUrl);
    try {
      var response = await await getRequestWithToken('$baseUrl/product?CompanyCode=${companyCode}&SearchKeyword=$text');

        if (response.statusCode == 200) {
          var decodedData = jsonDecode(response.body);
          List? newdata = decodedData["data"]["items"];
          _allProduct = newdata!.map((m) => Product.fromJson(m)).toList();
          return _allProduct;
        }
        return _allProduct;
    } catch (e) {
      print(e.toString());
      throw 'No Internet connection';
    }

  }

  _presentProduct(BuildContext context, Product product) {
    this.close(context, product.productId!);

    nextScreen(context, ProductDetails(
      product.productId!
    ));
  }

}