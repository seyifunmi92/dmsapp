import 'dart:convert';

import 'package:dms/layout/appWidget.dart';
import 'package:dms/model/account_item.dart';
import 'package:dms/screens/accounts/accountdelete.dart';
import 'package:dms/screens/accounts/addanother.dart';
import 'package:dms/screens/accounts/faileddelete.dart';
import 'package:dms/screens/accounts/saved.dart';
import 'package:dms/utils/colors.dart';
import 'package:dms/utils/next_screen.dart';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../network/network_utils.dart';
import '../../utils/animate_controller.dart';

class RenameScreen extends StatefulWidget {
  AccountItem accountItem;

  RenameScreen({Key? key, required this.accountItem}) : super(key: key);

  @override
  _RenameScreenState createState() => _RenameScreenState();
}

class _RenameScreenState extends State<RenameScreen> {

  var formKey = GlobalKey<FormState>();
  var renameCont = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    var mypaddingr = SizedBox(width: _width * 0.07);

    return ModalProgressHUD(
      inAsyncCall: isLoading,
      progressIndicator: AnimateWidget(),
      child: Scaffold(
        appBar: dmsAppBar(context, '', showBack: true),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            SizedBox(
              height: _height * .031,
            ),
            // mypaddingrh,
            Row(
              children: [
                mypaddingr,
                Text(
                  "Rename Account",
                  style: GoogleFonts.poppins(
                    fontSize: _height * .0284,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.02,
                    color: appColorPrimary,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: _height * .0178,
            ),
            Row(
              children: [
                mypaddingr,
                Text(
                  "Add a Nickname to your dangote account",
                  style: GoogleFonts.poppins(
                    fontSize: _height * .0142,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.02,
                    color: Color(0xff8D93A1),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: _height * .0296,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _width * 0.07),
              child: Row(children: [
                // Container(
                //   width: _width * .85,
                //   height: _height * .06,
                //   decoration: BoxDecoration(
                //     color: Colors.blueGrey[50],
                //     border: Border.all(
                //       color: Color(0xff7C95B1),
                //     ),
                //   ),
                //   child: Center(
                //       child: Row(
                //     children: [
                //       SizedBox(
                //         width: _width * .06,
                //       ),
                //       Text(
                //         "Adepoju Raymond",
                //         style: GoogleFonts.poppins(
                //           fontSize: _height * .017,
                //           fontWeight: FontWeight.w400,
                //           color: Color(0xffB1BBC6),
                //         ),
                //       ),
                //       // SizedBox(
                //       //   width: _width * .4,
                //       // ),
                //       // InkWell(
                //       //   onTap: () {},
                //       //   child: const Icon(
                //       //     Icons.keyboard_arrow_down,
                //       //     color: Color(0xff999999),
                //       //   ),
                //       // ),
                //     ],
                //   )),
                // ),
                Form(
                  key: formKey,
                  child: Container(
                    width: _width * .85,
                    height: _height * .066,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: TextFormField(
                      controller: renameCont,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        fillColor: inputBackgroundColor,
                        focusColor: inputBorderColor,
                        hintText: "Rename Account",
                        hintStyle: GoogleFonts.poppins(
                            color: iconColorSecondary,
                            fontSize: _height * .015),
                        contentPadding:
                        EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: inputBorderColor, width: 0.5)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: iconColorSecondary,
                                style: BorderStyle.solid,
                                width: 0)),
                      ),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      autofocus: false,
                      textCapitalization: TextCapitalization.words,
                      validator: (s) {
                        if (s!.isEmpty) return 'New name is required';
                        return null;
                      },
                    ),
                  ),
                ),
              ]),
            ),
            SizedBox(
              height: _height * .56,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _width * 0.07),
              child: Row(children: [
                InkWell(
                  onTap: () {
                    updateAccount();
                    // nextScreen(context, Saved());
                  },
                  child: Container(
                    width: _width * .85,
                    height: _height * .06,
                    decoration: BoxDecoration(
                      color: appColorPrimary,
                    ),
                    child: Center(
                      child: Text(
                        "Save",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: _height * .0174,
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ]),
        ),
      ),
    );
  }

  void updateAccount() async {
    isLoading = true;
    print(renameCont.text);
    try {
      Map req = {"sapAccountId": widget.accountItem.sapAccountId, "friendlyName": renameCont.text};
      var response = await patchRequestWithToken('/sapaccount/${widget.accountItem.sapAccountId}', req);

      if (this.mounted) {
        if (response.statusCode == 200) {
          var decodedData = jsonDecode(response.body);
          toast(decodedData['message'], length: Toast.LENGTH_LONG);
          isLoading = false;
          nextScreen(context, Saved());

        }
      }
    } catch(e) {
      isLoading = false;
      throw 'Unable to complete your request';
    }
  }
}
