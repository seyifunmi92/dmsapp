
import 'package:dms/services/api_services.dart';
import 'package:flutter/material.dart';

import '../model/country_model.dart';
import '../model/state.dart';

class CountryBloc extends ChangeNotifier {

  CountryBloc(){
    getCountrieslist();
  }
  List<DmsCountry> _countrylist = [];
  List<DmsCountry> get countrylist => _countrylist;

  List<StateModel> _statelist = [];
  List<StateModel> get statelist => _statelist;

  String Country = "Select Country";
  String? CountryId = "";

  String State = "Select State";
  String StateId = "";

  void notifyCountry(String text, String code) {
    Country = text;
    CountryId = code;
    notifyListeners();
  }

  void notifyState(String text, String code) {
    State = text;
    StateId = code;
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

  Future getStatelist() async {
    print("function called");
    await sendGetrStateDataRequest("/country/${CountryId ?? 'ng'}/state",).then((value) => {
      print("state-return"),
      _statelist = value
          .map<StateModel>((element) => StateModel.fromJson(element)).toList(),
    });
    notifyListeners();
  }

}