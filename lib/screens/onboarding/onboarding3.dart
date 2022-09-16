
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../utils/colors.dart';
import 'onboarding4.dart';

class Onboarding3 extends StatefulWidget {
  const Onboarding3({Key? key}) : super(key: key);

  @override
  _Onboarding3State createState() => _Onboarding3State();
}

class _Onboarding3State extends State<Onboarding3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
      bottomNavigationBar: _bottomBar(context),
      backgroundColor: Colors.transparent,
    );
  }

  Widget _body(context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(
          // ignore: prefer_const_constructors
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage('lib/assets/dms4.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              SizedBox(height: _height * .07),
              Row(
                children: [
                  SizedBox(
                    width: _width * .15,
                  ),
                  Image.asset(
                    "lib/assets/dmssurface.png",
                    height: 40.69,
                    // width: 31.71,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _bottomBar(context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Container(
      //color: Colors.transparent,
      height: _height * .3957,
      decoration: const BoxDecoration(
        color: appWhite,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(children: [
        SizedBox(
          height: _height * 0.045,
        ),
        Row(
          children: [
            SizedBox(
              width: _width * 0.12,
            ),
            Container(
              height: _height * .005924,
              width: _width * .0128,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: appColorPrimary,
              ),
            ),
            SizedBox(
              width: _width * .02,
            ),
            Container(
              height: _height * .005924,
              width: _width * .067,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: appColorPrimary,
              ),
            ),
            SizedBox(
              width: _width * .02,
            ),
            Container(
              height: _height * .005924,
              width: _width * .103,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: appColorPrimary,
              ),
            ),
          ],
        ),
        SizedBox(
          height: _height * .04,
        ),
        Row(
          children: [
            SizedBox(
              width: _width * 0.12,
            ),
            Text(
              "Lets get Started",
              style: GoogleFonts.poppins(
                fontSize: _width * .0564,
                fontWeight: FontWeight.w700,
                color: appColorPrimary,
                letterSpacing: 0.4,
              ),
            ),
          ],
        ),
        SizedBox(
          height: _height * .02,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: _width * .1155),
          child: Row(
            children: [
              Container(
                width: _width * .769,
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur\nadipiscing elit. Odio faucibus est viverra viverra\nsit arcu feugiat purus tempor.",
                  style: GoogleFonts.poppins(
                    fontSize: _width * .0308,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.1,
                    color: Color(0xff8D93A1),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: _height * .04,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: _width * .0745),
          child: Row(children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Center(
                child: Container(
                  height: _height * .0633,
                  width: _width * .85,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    color: appColorPrimary,
                  ),
                  child: InkWell(
                    onTap: () {
                      finish(context);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Onboarding4()));
                    },
                    child: Center(
                      child: Text(
                        "Next",
                        style: GoogleFonts.poppins(
                          color: appWhite,
                          fontWeight: FontWeight.w500,
                          fontSize: _width * .0376,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ]),
    );
  }
}
