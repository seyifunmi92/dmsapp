import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class WalletBloc extends ChangeNotifier {
  String BaseUrl = 'https://dms-wallet-ms.azurewebsites.net';
  int CurrentIndex = 0;
  bool isLoading = false;
  bool isSuccessful = false;
  String getFAQ = "Wallet";
  String statusNew = "New";
  String statusSaved = "Saved";
  String statusSubmitted = "Submitted";
  int? distributorSapAccountId;

  Future<String> getWallet(int distributorSapAccountId) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");
    var headers = <String, String>{
      HttpHeaders.authorizationHeader: "Bearer $token",
      "Content-Type": "application/json",
    };
    try {
      var url =
          Uri.parse(BaseUrl + "/api/v1/wallet/${distributorSapAccountId}");
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        print(response.body);
        print("Seyi..nice one");
        return response.body;
      } else {
        return response.body;
      }
    } on SocketException catch (e) {
      print("Errors bruh");
      return e.message;
    }
  }

  Future<String> getWalletStatement(
      int distributorSapAccountId, String fromDate, String toDate) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");
    var headers = <String, String>{
      HttpHeaders.authorizationHeader: "Bearer $token",
      "Content-Type": "application/json",
    };
    try {
      var url = Uri.parse(BaseUrl +
          "/api/v1/wallet/${distributorSapAccountId}/statement/from/${fromDate}/to/${toDate}");
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        print(response.body);
        print("Seyi..nice one");
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
