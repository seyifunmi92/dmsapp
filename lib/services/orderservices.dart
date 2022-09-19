import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class OrderBloc extends ChangeNotifier {
  String BaseUrlA = 'https://dms-account-ms.azurewebsites.net';
  String BaseUrlB = 'https://dms-order-ms.azurewebsites.net';

  int CurrentIndex = 0;
  bool isLoading = false;
  bool isSuccessful = false;
  String getDMSOrders = "Get DMS Orders";
  String getSAPOrders = "Get SAP Orders";
  String statusNew = "New";
  String statusSaved = "Saved";
  String statusSubmitted = "Submitted";

  Future<String> getmyDMSOrders(String status, String sapNumber) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");
    var headers = <String, String>{
      HttpHeaders.authorizationHeader: "Bearer $token",
      "Content-Type": "application/json",
    };
    try {
      var url = Uri.parse(BaseUrlB +
          "/api/order/dms?OrderStatusCode=$status&DistributorSapAccountId=$sapNumber&IsATC=false&PageIndex=10&PageSize=10&Sort=DateDescending");
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

  Future<String> getmySAPOrders() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");
    var headers = <String, String>{
      HttpHeaders.authorizationHeader: "Bearer $token",
      "Content-Type": "application/json",
    };
    try {
      var url = Uri.parse(BaseUrlB + "/order/sap");
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
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

  Future<String> getmySAPAccounts() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");
    var headers = <String, String>{
      HttpHeaders.authorizationHeader: "Bearer $token",
      "Content-Type": "application/json",
    };
    try {
      var url = Uri.parse(BaseUrlA + "/api/v1/sapaccount");
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

  Future<String> getDMSOrderdetails(int orderId) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");
    var headers = <String, String>{
      HttpHeaders.authorizationHeader: "Bearer $token",
      "Content-Type": "application/json",
    };
    try {
      var url = Uri.parse(BaseUrlB + "/api/order/dms/${orderId}");
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

  Future<String> getSapOrderdetails(int distributorSapId, int sapNumber) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");
    var headers = <String, String>{
      HttpHeaders.authorizationHeader: "Bearer $token",
      "Content-Type": "application/json",
    };
    try {
      Map<String, int> queryParams = {
        'distributorSapAccountId': distributorSapId,
        'orderSapNumber': sapNumber,
      };
      var url =
          Uri.parse(BaseUrlB + "/order/sap/" + "?" + queryParams.toString());
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
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

  Future<String> submitDmsOrder(
      int dmsOrderId,
      String truckSizeCode,
      String deliveryMethodCode,
      String plantCode,
      DateTime deliveryDate,
      String deliveryCity,
      String deliveryStateCode,
      String deliveryAddress,
      String deliveryCountryCode) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");
    var headers = <String, String>{
      HttpHeaders.authorizationHeader: "Bearer $token",
      "Content-Type": "application/json",
    };
    try {
      var dmsData = jsonEncode(<String, Object>{
        "dmsOrderId": dmsOrderId,
        "truckSizeCode": truckSizeCode,
        "deliveryMethodCode": deliveryMethodCode,
        "plantCode": plantCode,
        "deliveryDate": deliveryDate,
        "deliveryCity": deliveryCity,
        "deliveryStateCode": deliveryStateCode,
        "deliveryAddress": deliveryAddress,
        "deliveryCountryCode": deliveryCountryCode,
      });

      var url = Uri.parse(BaseUrlB + "/order/dms/order/submit");
      final response = await http.post(url, body: dmsData, headers: headers);
      if (response.statusCode == 200) {
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

  Future<String> cancelOrderDms(int dmsOrderId, String orderSapnumber,
      int distributorSapAccountid) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");
    var headers = <String, String>{
      HttpHeaders.authorizationHeader: "Bearer $token",
      "Content-Type": "application/json",
    };
    try {
      var dmsData = jsonEncode(<String, Object>{
        "dmsOrderId": dmsOrderId,
        "orderSapnumber": orderSapnumber,
        "distributorSapAccountid": distributorSapAccountid,
      });
      var url = Uri.parse(BaseUrlB + "/order/dms/cancel");
      final response = await http.patch(url, body: dmsData, headers: headers);
      if (response.statusCode == 200) {
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
