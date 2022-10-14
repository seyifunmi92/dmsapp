import 'dart:async';
import 'dart:convert';

import 'package:dms/layout/appWidget.dart';
import 'package:dms/screens/accounts/accountdelete.dart';
import 'package:dms/screens/accounts/addanother.dart';
import 'package:dms/screens/accounts/faileddelete.dart';
import 'package:dms/screens/accounts/renamescreen.dart';
import 'package:dms/utils/colors.dart';
import 'package:dms/utils/next_screen.dart';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../../blocs/cart_bloc.dart';
import '../../layout/loading_indicator_widget.dart';
import '../../model/account_item.dart';
import '../../network/network_utils.dart';

class DangoteAccounts extends StatefulWidget {
  const DangoteAccounts({Key? key}) : super(key: key);

  @override
  _DangoteAccountsState createState() => _DangoteAccountsState();
}

class _DangoteAccountsState extends State<DangoteAccounts> {

  List<AccountItem> accountList = [];
  bool showPositioned = false;
  bool isLoading = false;


  @override
  void initState() {
    getAccounts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    var mypaddingr = SizedBox(width: _width * 0.07);

    var mypaddingrh = SizedBox(height: _height * 0.026);

    return Scaffold(
      appBar: dmsAppBar(context, ""),
      backgroundColor: appWhite,
      body: Column(children: [
        Row(
          children: [
            mypaddingr,
            Text(
              "Dangote Accounts",
              style: GoogleFonts.poppins(
                fontSize: _height * .0284,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.02,
                color: appColorPrimary,
              ),
            ),
          ],
        ),
        mypaddingrh,
        accountList.isEmpty ? LoadingIndicatorWidget() : Container(),
        ...accountList.map(
                (e) => accountListWidget(e)),
        // InkWell(
        //   onTap: () {
        //     Navigator.push(context,
        //         MaterialPageRoute(builder: (context) => FailedDelete()));
        //   },
        //   child: Container(
        //     width: _width * .85,
        //     height: _height * .095,
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(8),
        //       color: appWhite,
        //       boxShadow: [
        //         BoxShadow(
        //           color: Colors.black12,
        //           blurStyle: BlurStyle.outer,
        //           blurRadius: 10,
        //           spreadRadius: 0,
        //           offset: Offset.zero,
        //         ),
        //       ],
        //     ),
        //     //padding: EdgeInsets.symmetric(horizontal: _width * .1),
        //     child: Column(children: [
        //       SizedBox(height: _height * .008),
        //       Padding(
        //         padding: EdgeInsets.symmetric(horizontal: _width * .05),
        //         child: Row(
        //             //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             children: [
        //               Text(
        //                 "Adepoju Raymond",
        //                 style: GoogleFonts.poppins(
        //                   fontSize: _height * .02,
        //                   fontWeight: FontWeight.w600,
        //                   color: Color(0xff343434),
        //                 ),
        //               ),
        //               SizedBox(
        //                 width: _width * .02,
        //               ),
        //               InkWell(
        //                 onTap: () {
        //                   nextScreen(context, RenameScreen());
        //                 },
        //                 child: Image.asset("lib/assets/edio.png",
        //                     height: _height * .01339),
        //               ),
        //             ]),
        //       ),
        //       SizedBox(height: _height * .005),
        //       Padding(
        //         padding: EdgeInsets.symmetric(horizontal: _width * .05),
        //         child: Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             children: [
        //               Text(
        //                 "N01234",
        //                 style: GoogleFonts.poppins(
        //                   fontSize: _height * .02,
        //                   fontWeight: FontWeight.w300,
        //                   color: Color(0xff343434),
        //                 ),
        //               ),
        //               InkWell(
        //                 onTap: () {
        //                   showPositioned = true;
        //                   showDialog(
        //                       context: context,
        //                       builder: (BuildContext context) {
        //                         return _myDialog(context);
        //                       });
        //                 },
        //                 child: Container(
        //                   height: _height * .019,
        //                   width: _width * .0375,
        //                   child: Image.asset("lib/assets/dmsdelete.png"),
        //                 ),
        //               ),
        //             ]),
        //       ),
        //     ]),
        //   ),
        // ),
        mypaddingrh,
        InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddAnother()));
          },
          child: Container(
            width: _width * .85,
            height: _height * .0633,
            color: appColorPrimary,
            child: Center(
                child: Text(
              "Add another Account",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                color: appWhite,
                letterSpacing: 0.02,
                fontSize: _height * .0174,
              ),
            )),
          ),
        ),
      ]),
    );
  }

  Widget _myDialog(BuildContext context, AccountItem distributor) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    var containerheight = _height * .5142;
    var _mypadding = SizedBox(
      height: containerheight * .12,
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: appWhite,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        height: containerheight,
        //color: Colors.black,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              _mypadding,
              Image.asset(
                "lib/assets/dmsquestionmark.png",
                height: _height * .142,
                width: _width * .307,
                //width: 31.71,
              ),
              _mypadding,
              Text(
                "Are you sure you want to",
                style: GoogleFonts.poppins(
                  color: Color(0xff8D93A1),
                  fontSize: _height * .02,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "Delete Account",
                style: GoogleFonts.poppins(
                  color: Color(0xff8D93A1),
                  fontSize: _height * .02,
                  fontWeight: FontWeight.w400,
                ),
              ),
              _mypadding,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _width * .09365),
                child: Row(children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      //color: Color(0xffFFFFFF),
                      width: _width * .382,
                      height: _height * .0633,
                      child: Center(
                          child: Text(
                        "No",
                        style: GoogleFonts.poppins(
                          fontSize: _height * .0174,
                          color: Color(0xff000000),
                        ),
                      )),
                      decoration: BoxDecoration(
                        border: Border.all(color: appColorPrimary),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: _width * .0487,
                  ),
                  InkWell(
                    onTap: () async {
                        try {
                          isLoading = true;
                          Map req = {"sapAccountId": distributor.sapAccountId};
                          var response = await postRequestWithToken('/sapaccount/unlink', req);

                          if (this.mounted) {
                            if (response.statusCode == 200) {
                              var decodedData = jsonDecode(response.body);
                              Navigator.pop(context);
                              toast(decodedData['message'], length: Toast.LENGTH_LONG);
                              isLoading = false;
                              nextScreen(context, AccountDelete());
                            }else {
                              if (response.body.isJson()) {
                                var data = jsonDecode(response.body);
                                Navigator.pop(context);
                                toast(data['message'], length: Toast.LENGTH_LONG);
                                setState(() {
                                  isLoading = false;
                                });
                              }
                            }
                          }
                        } catch(e) {
                          throw 'Unable to complete your request';
                        }

                    },
                    child: Container(
                      //color: Color(0xffFFFFFF),
                      width: _width * .382,
                      height: _height * .0633,
                      decoration: BoxDecoration(
                        color: appColorPrimary,
                      ),
                      child: Center(
                          child: Text(
                        "Yes",
                        style: GoogleFonts.poppins(
                          color: appWhite,
                          fontSize: _height * .0174,
                        ),
                      )),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget accountListWidget(AccountItem accountItem){
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Container(
      width: _width * .85,
      height: _height * .095,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: appWhite,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurStyle: BlurStyle.outer,
            blurRadius: 10,
            spreadRadius: 0,
            offset: Offset.zero,
          ),
        ],
      ),
      //padding: EdgeInsets.symmetric(horizontal: _width * .1),
      child: Column(children: [
        SizedBox(height: _height * .008),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: _width * .05),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  accountItem.distributorName != "" ? accountItem.distributorName! : "Distributor Name",
                  style: GoogleFonts.poppins(
                    fontSize: _height * .02,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff343434),
                  ),
                ),
                SizedBox(
                  width: _width * .02,
                ),
                InkWell(
                  onTap: () {
                    nextScreen(context, RenameScreen(accountItem: accountItem,));
                  },
                  child: Image.asset("lib/assets/edio.png",
                      height: _height * .01339),
                ),
              ]),
        ),
        SizedBox(height: _height * .005),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: _width * .05),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  accountItem.distributorSapNumber != "" ? accountItem.distributorSapNumber! : "N01234",
                  style: GoogleFonts.poppins(
                    fontSize: _height * .02,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff343434),
                  ),
                ),
                InkWell(
                  onTap: () {
                    showPositioned = true;
                    print(accountItem.sapAccountId);
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return _myDialog(context, accountItem );
                        });
                  },
                  child: Container(
                    height: _height * .019,
                    width: _width * .0375,
                    child: Image.asset("lib/assets/dmsdelete.png"),
                  ),
                ),
              ]),
        ),
      ]),
    );
  }

  getAccounts() async {
    final CartBloc cb = context.read<CartBloc>();
    await cb.getAccountlist();
    accountList = await cb.accountList;
    Timer(Duration(seconds: 1), () => setState(() {}) );

  }

}
