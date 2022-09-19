import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../model/account_item.dart';
import '../network/network_utils.dart';

class CartBloc extends ChangeNotifier{

  CartBloc(){
    getAccountlist();
  }

  int _counter = 0;
  int get counter => _counter;

  double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;

  String _cartBaseUrl = "https://dms-order-ms.azurewebsites.net/api";
  String get cartBaseUrl => _cartBaseUrl;
  // List<CartItem> cart = [];

  String selectedAccount = "Select Account";
  int distributorSapAccountId = 0;
  List<AccountItem> _accountList = [];
  List<AccountItem> get accountList => _accountList;


  void notifyAccount(String text, int code) {
    selectedAccount = text;
    distributorSapAccountId = code;
    notifyListeners();
  }

  Future getAccountlist() async {
    print("function called");
    // await sendGetrDataRequest("/company", "companies").then((value) => {
    //   print("Company-return"),
    //   _companylist = value
    //       .map<DmsCompany>((element) => DmsCompany.fromJson(element)).toList(),
    // });
    await getRequestWithToken('/sapaccount').then((value) {
      print(value);
      if (value.statusCode.isSuccessful()) {
        var data = jsonDecode(value.body);
        print(data);
        List it = data["data"]["items"];
        _accountList = it.map((e) => AccountItem.fromJson(e)).toList();
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
    notifyListeners();
  }

}