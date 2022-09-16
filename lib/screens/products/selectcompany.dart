import 'package:dms/constant.dart';
import 'package:dms/layout/appWidget.dart';
import 'package:dms/layout/dms_drawer.dart';
import 'package:dms/screens/products/products.dart';
import 'package:dms/utils/colors.dart';
import 'package:dms/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../../blocs/company_bloc.dart';
import '../../model/company_model.dart';

class SelectCompany extends StatefulWidget {
  const SelectCompany({Key? key}) : super(key: key);

  @override
  _SelectCompanyState createState() => _SelectCompanyState();
}

class companyList {
  String companyName;
  String code;
  String companyLogo;
  companyList(this.companyName, this.code, this.companyLogo);
}

class _SelectCompanyState extends State<SelectCompany> {
  List<companyList> _companies = [
    companyList("Dangote Cement", "DCP", "lib/assets/dmscement.png"),
    companyList("Dangote Sugar", "DSR", "lib/assets/dmssugar.png"),
    companyList("NASCON", "NASCOM", "lib/assets/nascom.png"),
  ];

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool menuClicked = false;
  List<DmsCompany> companylist = [];

  @override
  void initState() {
    final CompanyBloc cb = context.read<CompanyBloc>();
     cb.getCompanieslist();
    companylist = cb.companylist;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: appWhite,
      key: _scaffoldKey,
      appBar: dmsDrawerAppBar(
        context,
        '',
        () {
          _scaffoldKey.currentState!.openDrawer();
          setState(() {
            menuClicked = true;
          });
        },
      ),
      drawer: DMSDrawer(),
      body: Column(children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: _width * .04),
          child: Row(
            children: [
              Text(
                "Select Company",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: _height * .03,
                  color: appColorPrimary,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: _height * .013),
        Expanded(
          child: ListView.builder(
            itemCount: _companies.length,
            itemBuilder: (BuildContext context, int index) {
              var compL = _companies[index];
              return InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Products(companyCode: compL.code,)));
                },
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      _width * .04, _height * .01, _width * .04, _height * .01),
                  child: Container(
                    decoration: BoxDecoration(
                      color: appWhite,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurStyle: BlurStyle.outer,
                          blurRadius: 5,
                          spreadRadius: 0,
                          offset: Offset.zero,
                        ),
                      ],
                    ),
                    width: _width * 85,
                    height: _height * .095,
                    //color: appWhite,
                    child: Padding(
                      padding: EdgeInsets.all(_width * .03),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            compL.companyName,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: _height * .02,
                              color: Color(0xff343434),
                            ),
                          ),
                          Image.asset(compL.companyLogo),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ]),
    );
  }
}
