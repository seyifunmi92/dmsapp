import 'dart:convert';
import 'dart:io';

import 'package:dms/layout/appWidget.dart';
import 'package:dms/screens/support/support_request_list.dart';
import 'package:dms/utils/colors.dart';
import 'package:dms/utils/next_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../../blocs/support_request_bloc.dart';
import '../../layout/loading_indicator_widget.dart';
import '../../layout/support_category_picker.dart';
import '../../network/network_utils.dart';

class NewSupportRequest extends StatefulWidget {
  const NewSupportRequest({Key? key}) : super(key: key);

  @override
  State<NewSupportRequest> createState() => _NewSupportRequestState();
}

class _NewSupportRequestState extends State<NewSupportRequest> {
  var issueCont = TextEditingController();
  var subjectCont = TextEditingController();
  var issueNode = FocusNode();
  bool isLoading = false;

  int selectedCategoryID = 0;

  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    final _screenHeight = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: dmsAppBar(
        context,
        '',
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.only(
              left: _screenWidth * 0.04, right: _screenWidth * 0.04),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              isLoading ? LoadingIndicatorWidget() : Container(),
              SizedBox(
                height: _screenHeight * .026,
              ),
              Text(
                "New Support Request",
                style: GoogleFonts.poppins(
                  fontSize: _screenHeight * .0284,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.02,
                  color: appColorPrimary,
                ),
              ),
              //text("New Support Request", isBoldText: true, fontSize: 28.0),
              SizedBox(
                height: _screenHeight * 0.01,
              ),
              Text(
                "Select Suppport category and add a brief\ndescription of the issue",
                style: GoogleFonts.poppins(
                    fontSize: _screenHeight * .014,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff8D93A1)),
              ),
              SizedBox(
                height: _screenHeight * 0.025,
              ),
              GestureDetector(
                onTap: () {
                  nextScreen(context, SupportCategoryPicker());
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: inputBackgroundColor,
                      border: Border.all(
                          color: inputBorderColor,
                          width: 1,
                          style: BorderStyle.solid)),
                  height: _screenHeight * .0592,
                  width: _screenWidth * 0.90,
                  padding: EdgeInsets.symmetric(
                      horizontal: _screenWidth * .036,
                      vertical: _screenHeight * .0154),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        Provider.of<SupportRequestBloc>(
                            context)
                            .categoryName!,
                        style: GoogleFonts.poppins(
                            color: iconColorSecondary,
                            //fontFamily: fontRegular,
                            fontSize: _screenHeight * .0166),
                        textAlign: TextAlign.start,
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: iconColorSecondary,
                        size: _screenHeight * .027,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: _screenHeight * 0.025,
              ),

              Container(
                width: _screenWidth * .85,
                height: _screenHeight * .066,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                ),
                child: TextFormField(
                  controller: subjectCont,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: inputBackgroundColor,
                    focusColor: inputBorderColor,
                    hintText: "Subject",
                    hintStyle: GoogleFonts.poppins(
                        color: iconColorSecondary,
                        fontSize: _screenHeight * .015),
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
                    if (s!.isEmpty) return 'Subject is required';
                    return null;
                  },
                ),
              ),

              // GestureDetector(
              //   onTap: () {},
              //   child: Container(
              //     decoration: BoxDecoration(
              //         color: inputBackgroundColor,
              //         border: Border.all(
              //             color: inputBorderColor,
              //             width: 1,
              //             style: BorderStyle.solid)),
              //     height: _height * .159,
              //     width: _width,
              //     // padding: EdgeInsets.symmetric(horizontal: _width *.04),
              //     child: Padding(
              //       padding: EdgeInsets.symmetric(horizontal: _width * .04),
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           SizedBox(height: _height * .018),
              //           Text(
              //             "Describe your Issue",
              //             style: GoogleFonts.poppins(
              //               fontWeight: FontWeight.w400,
              //               fontSize: _height * .0166,
              //               color: Color(0xffB1BBC6),
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: _screenHeight * 0.025,
              ),
              Container(
                // width: _screenWidth * .85,
                // height: _screenHeight * .066,
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(0),
                // ),
                child: TextFormField(
                  controller: issueCont,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: inputBackgroundColor,
                    focusColor: inputBorderColor,
                    hintText: "Describe your Issue",
                    hintStyle: GoogleFonts.poppins(
                        color: iconColorSecondary,
                        fontSize: _screenHeight * .0174),
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: inputBorderColor, width: 0.5)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: iconColorSecondary,
                            style: BorderStyle.solid,
                            width: 0)),
                  ),
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.done,
                  autofocus: false,
                  maxLines: null,
                  minLines: 6,
                  textCapitalization: TextCapitalization.words,
                  validator: (s) {
                    if (s!.isEmpty) return 'Description is required';
                    return null;
                  },
                  focusNode: issueNode,
                ),
              ),

              SizedBox(
                height: _screenHeight * 0.25,
              ),
              // Align(
              //   alignment: Alignment.bottomCenter,
              //   child: Container(
              //     width: double.infinity,
              //     height: 55.0,
              //     margin: const EdgeInsetsDirectional.fromSTEB(
              //         10.0, 0.0, 10.0, 10.0),
              //     child: ElevatedButton(
              //       onPressed: () async {
              //         Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //                 builder: (context) =>
              //                     SupportRequestSuccessScreen()));
              //       },
              //       style: ElevatedButton.styleFrom(
              //         padding: const EdgeInsets.all(0),
              //         textStyle: const TextStyle(
              //           color: Colors.white,
              //         ),
              //         primary: appColorPrimary, // background
              //         shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(3.0)),
              //       ),
              //       child: const Text("Send Request"),
              //     ),
              //   ),
              // ),
              InkWell(
                onTap: () {
                  postNewRequest();
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => NewReq()));
                },
                child: Container(
                  width: _screenWidth * .85,
                  height: _screenHeight * .063,
                  color: appColorPrimary,
                  child: Center(
                      child: Text(
                    "Send Request",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      color: appWhite,
                      letterSpacing: 0.02,
                      fontSize: _screenHeight * .0174,
                    ),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void postNewRequest() async {
    final SupportRequestBloc cb = context.read<SupportRequestBloc>();
    selectedCategoryID = cb.categoryID!;
    var baseUrl = cb.supportBaseUrl;
    print(selectedCategoryID);
    try {
      setState(() {
        isLoading = true;
      });
      Map req = {"subject": subjectCont.text,"description": issueCont.text,"categoryId": selectedCategoryID,"channelCode": "Mobile"};
      var response = await postRequestWithToken('$baseUrl/request', req);

      if (this.mounted) {
        if (response.statusCode == 200) {
          var decodedData = jsonDecode(response.body);
          setState(() {
            isLoading = false;
          });
          toast(decodedData["message"], length: Toast.LENGTH_LONG);

          nextScreenReplace(context, SupportRequestList());

        }
      }
    } on SocketException {
      setState(() {
        isLoading = false;
      });
      throw 'No Internet connection';
    }
  }
}
