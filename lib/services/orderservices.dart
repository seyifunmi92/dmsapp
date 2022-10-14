import 'package:dms/model/ordermodels.dart';
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
  String customer1 = "Clean Credit Customer";
  String customer2 = "BG Customer";
  bool isCC = false;
  bool isBG = false;
  bool dateSelected1 = false;
  bool dateSelected2 = false;
  int CurrentIndex = 0;
  bool isLoading = false;
  bool isSuccessful = false;
  String getDMSOrders = "Get DMS Orders";
  String getSAPOrders = "Get SAP Orders";
  String statusNew = "New";
  String statusSaved = "Saved";
  String statusSubmitted = "Submitted";

  getSelectedDate1(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var fromDate = sharedPreferences.getString(key);
    print("There is date bro");
    print(fromDate);
    return fromDate;
  }

  getSelectedDate2(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var toDate = sharedPreferences.getString(key);

    return toDate;
  }

  Future<String> getmyDMSOrders(String status, String sapNumber) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");
    var headers = <String, String>{
      HttpHeaders.authorizationHeader: "Bearer $token",
      "Content-Type": "application/json",
    };
    try {
      var url = Uri.parse(BaseUrlB +
          "/api/order/dms?OrderStatusCode=$status&DistributorSapAccountId=$sapNumber&IsATC=false&PageIndex=1&PageSize=100&Sort=DateDescending");
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

  Future<String> getmyDMSOrdersDate(
      String status, String sapNumber, String fromdate, String todate) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");
    var headers = <String, String>{
      HttpHeaders.authorizationHeader: "Bearer $token",
      "Content-Type": "application/json",
    };
    try {
      var url = Uri.parse(BaseUrlB +
          "/api/order/dms?OrderStatusCode=$status&DistributorSapAccountId=$sapNumber&FromDate=$fromdate&ToDate=$todate&IsATC=false&PageIndex=1&PageSize=10&Sort=DateAscending");
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        print(url);
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

  Future<String> getmyATCOrders(int sapAccId, String sapNumber) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");
    var headers = <String, String>{
      HttpHeaders.authorizationHeader: "Bearer $token",
      "Content-Type": "application/json",
    };
    try {
      var url = Uri.parse(BaseUrlB +
          "/api/order/sap/atc?DistributorSapAccountId=$sapAccId&OrderSapNumber=$sapNumber&PageIndex=1&PageSize=10&Sort=DateDescending");
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        print(url);
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

  Future<String> getrecentDms() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");
    var headers = <String, String>{
      HttpHeaders.authorizationHeader: "Bearer $token",
      "Content-Type": "application/json",
    };
    try {
      var url = Uri.parse(BaseUrlB + "/api/order/dms/recent");
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        print(response.body);
        print("Seyi..nice one");
        return response.body;
      } else {
        print(response.body);
        print(response.statusCode);
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

  Future<String> getATCOrderdetails(int orderId) async {
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

  Future<String> getSapOrderdetails(
      int distributorSapAccountId, String orderSapNumber) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");
    var headers = <String, String>{
      HttpHeaders.authorizationHeader: "Bearer $token",
      "Content-Type": "application/json",
    };
    try {
      var url = Uri.parse(BaseUrlB +
          "/api/order/sap/${distributorSapAccountId}/sapnumber/${orderSapNumber}");
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        print("Seyi..nice one");
        print(response.body);
        return response.body;
      } else {
        print(response.body);
        return response.body;
      }
    } on SocketException catch (e) {
      print("Errors bruh");
      return e.message;
    }
  }

  Future<String> submitAtcOrder(
    int distributorSapAccountId,
    String orderSapNumber,
    String deliveryAddress,
    String deliveryCity,
    String deliveryStateCode,
    String deliveryCountryCode,
    DateTime deliveryDate,
  ) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");
    var headers = <String, String>{
      HttpHeaders.authorizationHeader: "Bearer $token",
      "Content-Type": "application/json",
    };
    try {
      var dmsData = jsonEncode(<String, Object>{
        "distributorSapAccountId": distributorSapAccountId,
        "orderSapNumber": orderSapNumber,
        "deliveryAddress": deliveryAddress,
        "deliveryCity": deliveryCity,
        "deliveryStateCode": deliveryStateCode,
        "deliveryCountryCode": deliveryCountryCode,
        "deliveryDate": deliveryDate.toIso8601String(),
      });

      var url = Uri.parse(BaseUrlB + "/api/order/dms/atc/schedule");
      final response = await http.post(url, body: dmsData, headers: headers);
      if (response.statusCode == 200) {
        print("Seyi..nice one");
        print(response.body);
        return response.body;
      } else {
        print(response.body);
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
      var url = Uri.parse(BaseUrlB + "/api/order/dms/cancel");
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

  Future<String> validOtp(
    int otpId,
    String otpCode,
  ) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");
    var headers = <String, String>{
      HttpHeaders.authorizationHeader: "Bearer $token",
      "Content-Type": "application/json",
    };
    try {
      var dmsData = jsonEncode(<String, Object>{
        "otpId": otpId,
        "otpCode": otpCode,
      });
      var url = Uri.parse(BaseUrlB + "/api/otp/validate");
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

  Future<String> resendOtp(
    int otpId,
  ) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");
    var headers = <String, String>{
      HttpHeaders.authorizationHeader: "Bearer $token",
      "Content-Type": "application/json",
    };
    try {
      var dmsData = jsonEncode(<String, Object>{
        "otpId": otpId,
      });
      var url = Uri.parse(BaseUrlB + "/api/otp/resend");
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
}
