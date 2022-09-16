import 'package:dms/layout/appWidget.dart';
import 'package:dms/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewDistributorNotify extends StatelessWidget {
  const NewDistributorNotify({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    final _screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: dmsAppBar(context, '', showBack: true),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.only(
              left: _screenWidth * 0.07, right: _screenWidth * 0.07),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: _screenHeight * 0.026,
              ),
              //text("Register as a Dangote Distributor", isLongText: true, isBoldText: true, fontSize: 28.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Register as a\nDangote Distributor",
                    style: GoogleFonts.poppins(
                      color: appColorPrimary,
                      fontWeight: FontWeight.w600,
                      fontSize: _screenHeight * .03,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: _screenHeight * 0.0225,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur\nadipiscing elit. Odio faucibus est viverra viverra sit\narcu feugiat purus tempor.",
                    style: GoogleFonts.poppins(
                      color: Color(0xff8D93A1),
                      fontWeight: FontWeight.w400,
                      fontSize: _screenHeight * .0142,
                    ),
                    //isLongText: true,
                    // fontSize: 13.0,
                    // textColor: appTextColorSecondary
                  ),
                ],
              ),
              SizedBox(
                height: _screenHeight * 0.0486,
              ),
              Center(
                child: Container(
                  height: _screenHeight * .0633,
                  width: _screenWidth * .965,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    color: appColorPrimary,
                  ),
                  child: InkWell(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => SuccessScreen()));
                        // finish(context);
                        // Navigator.of(context).pushAndRemoveUntil(
                        //     MaterialPageRoute(
                        //         builder: (context) => SuccessScreen()),
                        //     (Route<dynamic> route) => false);
                      },
                      child: Center(
                        child: Text(
                          "Find out more",
                          style: GoogleFonts.poppins(
                            color: appWhite,
                            fontWeight: FontWeight.w500,
                            fontSize: _screenHeight * .017,
                            //fontSize: _width * .0376,
                          ),
                        ),
                      )),
                ),
              ),
              // Align(
              //   alignment: Alignment.bottomCenter,
              //   child: Container(
              //     width: double.infinity,
              //     height: 55.0,
              //     margin: const EdgeInsetsDirectional.fromSTEB(
              //         10.0, 0.0, 10.0, 10.0),
              //     child: ElevatedButton(
              //       onPressed: () async {},
              //       style: ElevatedButton.styleFrom(
              //         padding: const EdgeInsets.all(0),
              //         textStyle: const TextStyle(
              //           color: Colors.white,
              //         ),
              //         primary: appColorPrimary, // background
              //         shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(3.0)),
              //       ),
              //       child: const Text("Find out more"),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
