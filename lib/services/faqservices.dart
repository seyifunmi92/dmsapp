import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class FaqBloc extends ChangeNotifier {
  String BaseUrl = 'https://dms-support-ms.azurewebsites.net';
  int CurrentIndex = 0;
  bool isLoading = false;
  bool isSuccessful = false;
  String getFAQ = "Frequently Asked Questions";
  String statusNew = "New";
  String statusSaved = "Saved";
  String statusSubmitted = "Submitted";
  int faqId = 0;

  Future<String> getFaqCategory() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");
    var headers = <String, String>{
      HttpHeaders.authorizationHeader: "Bearer $token",
      "Content-Type": "application/json",
    };
    try {
      var url = Uri.parse(BaseUrl + "/faq/category");
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        print("Seyi..nice one FAQ");
        return response.body;
      } else {
        return response.body;
      }
    } on SocketException catch (e) {
      print("Errors bruh");
      return e.message;
    }
  }

  Future<String> getFaqCategorybyId(int categoryId) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");
    var headers = <String, String>{
      HttpHeaders.authorizationHeader: "Bearer $token",
      "Content-Type": "application/json",
    };
    try {
      var url = Uri.parse(BaseUrl + "/faq?faqCategoryId=$categoryId");
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        print("Seyi..nice one FAQ");
        return response.body;
      } else {
        return response.body;
      }
    } on SocketException catch (e) {
      print("Errors bruh");
      return e.message;
    }
  }

  Future<String> getContact() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");
    var headers = <String, String>{
      HttpHeaders.authorizationHeader: "Bearer $token",
      "Content-Type": "application/json",
    };
    try {
      var url = Uri.parse(BaseUrl + "/contact");
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        print("Seyi..nice one Contact details");
        return response.body;
      } else {
        return response.body;
      }
    } on SocketException catch (e) {
      print("Errors bruh");
      return e.message;
    }
  }
}
