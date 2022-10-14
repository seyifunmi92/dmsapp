import 'package:dms/constant.dart';
import 'package:dms/layout/appWidget.dart';
import 'package:dms/screens/support/support_request_success.dart';
import 'package:dms/utils/colors.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../model/my_request_item.dart';

class NewReq extends StatefulWidget {

  MyRequestItem supportItem;

  NewReq({Key? key, required this.supportItem}) : super(key: key);

  @override
  _NewReqState createState() => _NewReqState();
}

class _NewReqState extends State<NewReq> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: dmsAppBar(context, ""),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: _width * .07),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: _height * 0.01,
          ),
          Text(
            "New Support Request",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: _height * .03,
              color: appColorPrimary,
            ),
          ),
          SizedBox(
            height: _height * .023,
          ),
          InkWell(
            onTap: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => SupportRequestSuccessScreen()));
            },
            child: Container(
              width: _width,
              height: _height * .26,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurStyle: BlurStyle.outer,
                    blurRadius: 10,
                    spreadRadius: 0,
                    offset: Offset.zero,
                  ),

                  //border: Border.all(color: Color(0xffB1BBC6)),
                ],
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                    _width * .035, _height * .02, _width * .035, _height * .01),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Support Details",
                        style: GoogleFonts.poppins(
                          fontSize: _height * .01896,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff343434),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: _height * .0284,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Category",
                        style: GoogleFonts.poppins(
                          fontSize: _height * .0142,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff979797),
                        ),
                      ),
                      Text(
                        widget.supportItem.requestCategory!.name!,
                        style: GoogleFonts.poppins(
                          fontSize: _height * .0142,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff343434),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: _height * .026,
                  ),
                  DottedLine(
                    dashColor: Color(0xffcbcbcb),
                  ),
                  SizedBox(
                    height: _height * .026,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Description",
                        style: GoogleFonts.poppins(
                          fontSize: _height * .0142,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff979797),
                        ),
                      ),
                      Text(
                        "",
                        style: GoogleFonts.poppins(
                          fontSize: _height * .0142,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff343434),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: _height * .02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        widget.supportItem.description!,
                        style: GoogleFonts.poppins(
                          fontSize: _height * .0142,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff343434),
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
