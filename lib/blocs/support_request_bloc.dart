

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../model/support_request_category.dart';
import '../network/network_utils.dart';

class SupportRequestBloc extends ChangeNotifier{

  String _supportBaseUrl = "https://dms-support-ms.azurewebsites.net";
  String get supportBaseUrl => _supportBaseUrl;

  List<RequestCategory> _categoryList = [];
  List<RequestCategory> get categoryList => _categoryList;

  int? _categoryID;
  int? get categoryID => _categoryID;

  String? _categoryName = "Select Category";
  String? get categoryName => _categoryName;

  void notifyCategory(String text, int code) {
    _categoryName = text;
    _categoryID = code;
    notifyListeners();
  }

  Future getSupportCategorylist() async {
    print("function called");
    await getRequestWithToken('$_supportBaseUrl/request/category').then((value) {
      print(value);
      if (value.statusCode.isSuccessful()) {
        var data = jsonDecode(value.body);
        print(data);
        List it = data["data"]["categories"];
        _categoryList = it.map((e) => RequestCategory.fromJson(e)).toList();
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