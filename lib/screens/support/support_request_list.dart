import 'dart:convert';
import 'dart:io';

import 'package:dms/constant.dart';
import 'package:dms/layout/appWidget.dart';
import 'package:dms/model/my_request_item.dart';
import 'package:dms/screens/support/new_support_request.dart';
import 'package:dms/screens/support/newrequest.dart';
import 'package:dms/screens/support/support_request_list_empty.dart';
import 'package:dms/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../blocs/support_request_bloc.dart';
import '../../layout/loading_indicator_widget.dart';
import '../../network/network_utils.dart';
import '../../utils/next_screen.dart';

class SupportRequestList extends StatefulWidget {
  const SupportRequestList({Key? key}) : super(key: key);

  @override
  State<SupportRequestList> createState() => _SupportRequestListState();
}

class _SupportRequestListState extends State<SupportRequestList> {
  var _opacity = 0.5;
  var _xOffset = 0.0;
  var _yOffset = 0.0;
  var _blurRadius = 0.0;
  var _spreadRadius = 0.0;

  List<MyRequestItem> allRequest = [];

  @override
  void initState() {
    loadMyRequestItems();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    final _screenHeight = MediaQuery.of(context).size.height;

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
              SizedBox(
                height: _screenHeight * 0.026,
              ),
              //text("Support Request", isBoldText: true, fontSize: 28.0),
              Text(
                "Support Request",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: _screenHeight * .0284,
                  color: appColorPrimary,
                ),
              ),
              SizedBox(
                height: _screenHeight * 0.024,
              ),
              allRequest.isEmpty ? LoadingIndicatorWidget() : Container(),
              ListView.builder(
                  itemCount: allRequest.length,
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                   MyRequestItem myRequest = allRequest[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Container(
                        // color: Colors.white70,
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: _screenHeight * 0.128,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurStyle: BlurStyle.outer,
                              blurRadius: 10,
                              spreadRadius: 0,
                              offset: Offset.zero,
                            ),
                          ],
                          color: appWhite,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NewReq(supportItem: myRequest,)));
                          },
                          title: Column(
                            children: [
                              SizedBox(
                                height: _screenHeight * .018,
                              ),
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    myRequest.subject!,
                                    style: GoogleFonts.poppins(
                                      color: Color(0xff000000),
                                      fontWeight: FontWeight.w400,
                                      fontSize: _screenHeight * .019,
                                    ),
                                  )),
                              SizedBox(
                                height: _screenHeight * 0.01,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    myRequest.description!,
                                    style: GoogleFonts.poppins(
                                      fontSize: _screenHeight * .0142,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          selectedTileColor: Theme.of(context).primaryColor,
                          selectedColor: Theme.of(context).dividerColor,
                          trailing: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: _screenHeight * .005,
                                ),
                                Text(
                                  "29 Aug, 2022",
                                  // (DateFormat('MMM dd yyyy').parse(myRequest.dateCreated!)).toString(),
                                  style: GoogleFonts.poppins(
                                    fontSize: _screenHeight * .0142,
                                    color: Color(0xff000000),
                                  ),
                                ),
                                Container(
                                    color: Theme.of(context).hoverColor,
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text(
                                        // index.isEven ? "Open" : "Closed",
                                        myRequest.requestStatus!.name!,
                                        style: GoogleFonts.poppins(
                                            fontSize: _screenHeight * .0142,
                                            fontWeight: FontWeight.w500,
                                            color: index.isEven
                                                ? Color(0xFFC4C4C4)
                                                : Color(0xFF009A49)),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                          // minLeadingWidth: double.maxFinite,
                        ),
                      ),
                    );
                  }),
              SizedBox(
                height: _screenHeight * 0.38,
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
              //                 builder: (context) => NewSupportRequest()));
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
              //       child: const Text("Create New Request"),
              //     ),
              //   ),
              // ),
              Row(children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NewSupportRequest()));
                  },
                  child: Container(
                    width: _screenWidth * .92,
                    height: _screenHeight * .06,
                    decoration: BoxDecoration(
                      color: appColorPrimary,
                    ),
                    child: Center(
                      child: Text(
                        "Create New Request",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: _screenHeight * .0174,
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  loadMyRequestItems() async {
    final SupportRequestBloc pb = Provider.of<SupportRequestBloc>(context, listen: false);
    final baseUrl = pb.supportBaseUrl;
    print(baseUrl);
    try {
      var response = await await getRequestWithToken('$baseUrl/request');

      if (this.mounted) {
        if (response.statusCode == 200) {
          var decodedData = jsonDecode(response.body);
          List? newdata = decodedData["data"]["requests"];
          if(newdata!.isEmpty){
            nextScreenReplace(context, SupportRequestListEmptyScreen());
            return;
          }
          setState(() {
            allRequest.addAll(newdata.map((m) => MyRequestItem.fromJson(m)).toList());
          });
        }
      }
    } on SocketException {
      throw 'No Internet connection';
    }

  }

}
