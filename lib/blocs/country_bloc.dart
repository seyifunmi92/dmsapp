
import 'package:dms/services/api_services.dart';
import 'package:flutter/material.dart';

import '../model/country_model.dart';

class CountryBloc extends ChangeNotifier {

  CountryBloc(){
    getCountrieslist();
  }
  List<DmsCountry> _countrylist = [];
  List<DmsCountry> get countrylist => _countrylist;
  String Country = "Select Country";
  String CountryId = "";

  void notifyCountry(String text, String code) {
    Country = text;
    CountryId = code;
    notifyListeners();
  }

  Future getCountrieslist() async {
    print("function called");
    await sendGetrDataRequest("/country", "countries").then((value) => {
      print("country-return"),
    _countrylist = value
        .map<DmsCountry>((element) => DmsCountry.fromJson(element)).toList(),
    });
    notifyListeners();
  }


}