
import 'dart:convert';

import 'package:dms/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../network/network_utils.dart';

class ProductBloc extends ChangeNotifier{

  List<Product> _products = [];
  List<Product> get products => _products;
  String _productBaseUrl = "https://dms-product-ms.azurewebsites.net/api/v1";
  String get productBaseUrl => _productBaseUrl;

  Future getProduct(int PageIndex) async {
    print("called");
    await getRequestWithToken('$_productBaseUrl/product?CompanyCode=dsr&PageIndex=$PageIndex&PageSize=10').then((value) {
      print(value);
      if (value.statusCode.isSuccessful()) {
        var data = jsonDecode(value.body);
        print(data);
        List it = data["data"]["items"];
        _products.addAll(it.map((e) => Product.fromJson(e)).toList());
        notifyListeners();
      } else {
        if (value.body.isJson()) {
          var data = jsonDecode(value.body);
          toast(data["message"], length: Toast.LENGTH_LONG);
        }
      }
    }).catchError((e) {
      toast("We are unable to complete your request at this time", length: Toast.LENGTH_LONG);
    });
  }
}