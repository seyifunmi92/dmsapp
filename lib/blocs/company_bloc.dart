
import 'package:dms/services/api_services.dart';
import 'package:flutter/material.dart';

import '../model/company_model.dart';

class CompanyBloc extends ChangeNotifier {

  CompanyBloc(){
    getCompanieslist();
  }
  List<DmsCompany> _companylist = [];
  List<DmsCompany> get companylist => _companylist;
  String Company = "Select Company";
  String CompanyId = "";

  void notifyCompany(String text, String code) {
    Company = text;
    CompanyId = code;
    notifyListeners();
  }

  Future getCompanieslist() async {
    print("function called");
    await sendGetrDataRequest("/company", "companies").then((value) => {
      print("Company-return"),
      _companylist = value
          .map<DmsCompany>((element) => DmsCompany.fromJson(element)).toList(),
    });
    notifyListeners();
  }


}