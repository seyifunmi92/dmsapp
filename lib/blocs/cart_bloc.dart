import 'dart:convert';

import 'package:dms/model/delivery_method.dart';
import 'package:dms/model/plant.dart';
import 'package:dms/model/truck_size.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../model/account_item.dart';
import '../network/network_utils.dart';

class CartBloc extends ChangeNotifier{

  CartBloc(){
    getAccountlist();
    getCompanyandCountryCode();
  }

  int _counter = 0;
  int get counter => _counter;

  double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;

  String _cartBaseUrl = "https://dms-order-ms.azurewebsites.net/api";
  String get cartBaseUrl => _cartBaseUrl;
  // List<CartItem> cart = [];

  String selectedAccount = "Select Account";
  String selectedDeliveryMethod = "Delivery Type";
  String selectedPlantType = "Plant";
  String selectedTruckSize = "Truck Size";

  int distributorSapAccountId = 0;

  List<AccountItem> _accountList = [];
  List<AccountItem> get accountList => _accountList;

  List<DeliveryMethod> _deliveryTypeList = [];
  List<DeliveryMethod> get deliveryTypeList => _deliveryTypeList;

  String? _deliveryMethodCode;
  String? get deliveryMethodCode => _deliveryMethodCode;

  String? _plantTypedCode;
  String? get plantTypedCode => _plantTypedCode;

  String? _truckSizeCode;
  String? get truckSizeCode => _truckSizeCode;

  List<Plant> _plantList = [];
  List<Plant> get plantList => _plantList;

  List<TruckSize> _truckSizeList = [];
  List<TruckSize> get truckSizeList => _truckSizeList;

  String Country = "Select Country";

  String? _countryCode;
  String? get countryCode => _countryCode;

  String? _companyCode;
  String? get companyCode => _companyCode;

  void notifyAccount(String text, int code, String countryCode, String companyCode) {
    selectedAccount = text;
    distributorSapAccountId = code;
    _countryCode = countryCode;
    _companyCode = companyCode;
    notifyListeners();
    saveCompanyandCountryCode(countryCode,companyCode);
  }

  void notifyDeliveryMethod(String text, String code) {
    selectedDeliveryMethod = text;
    _deliveryMethodCode = code;
    notifyListeners();
  }

  void notifyPlant(String text, String code) {
    selectedPlantType = text;
    _plantTypedCode = code;
    notifyListeners();
  }

  void notifyTruckSize(String text, String code) {
    selectedTruckSize = text;
    _truckSizeCode = code;
    notifyListeners();
  }

  Future saveCompanyandCountryCode(String countryCode, String companyCode) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.setString('countryCode', countryCode);
    await sp.setString('companyCode', companyCode);
    notifyListeners();
  }

  Future getCompanyandCountryCode() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    _countryCode = sp.getString('countryCode');
    _companyCode = sp.getString('companyCode');
    notifyListeners();
  }

  Future getAccountlist() async {
    print("function called");
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


  Future getDeliveryTypeList() async {
    await getRequestWithToken('$_cartBaseUrl/plant/deliverymethod').then((value) {
      print(value);
      if (value.statusCode.isSuccessful()) {
        var data = jsonDecode(value.body);
        print(data);
        List it = data["data"]["deliveryMethods"];
        _deliveryTypeList = it.map((e) => DeliveryMethod.fromJson(e)).toList();
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

  Future getPlantList() async {
    print("function called");
    await getRequestWithToken('$_cartBaseUrl/plant?CountryCode=$_countryCode&CompanyCode=$_companyCode').then((value) {
      print(value);
      if (value.statusCode.isSuccessful()) {
        var data = jsonDecode(value.body);
        print(data);
        List it = data["data"]["plants"]["items"];
        _plantList = it.map((e) => Plant.fromJson(e)).toList();
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

  Future getTruckList() async {
    if(_deliveryMethodCode == "" || _plantTypedCode == ""){
      return toast("Select delivery type and plant to proceed");
    }
    await getRequestWithToken('$_cartBaseUrl/plant/trucksizes?DeliveryMethodCode=$_deliveryMethodCode&PlantTypeCode=plant').then((value) {
      print(value);
      if (value.statusCode.isSuccessful()) {
        var data = jsonDecode(value.body);
        print(data);
        List it = data["data"]["trucksizes"];
        _truckSizeList = it.map((e) => TruckSize.fromJson(e)).toList();
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