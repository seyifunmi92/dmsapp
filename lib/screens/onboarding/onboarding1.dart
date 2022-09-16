import 'package:dms/screens/auth/login_screen.dart';
import 'package:dms/screens/onboarding/newonboard.dart';
import 'package:dms/utils/colors.dart';
import 'package:dms/utils/next_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../blocs/login_bloc.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final _myController = CarouselController();
  bool firstPressed = false;
  bool secondPressed = false;
  bool thridPressed = false;
  int counter = 0;

  int activeIndex = 0;
  final slidePictures = [
    'lib/assets/dms1.png',
    "lib/assets/dms3.5.png",
    "lib/assets/dms4.png",
    "lib/assets/dms5.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
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
        CarouselSlider.builder(
          carouselController: _myController,
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              setState(() {
                activeIndex = index;
              });
            },
            height: _height * .623,
            viewportFraction: 1,
            initialPage: 0,
          ),
          itemCount: slidePictures.length,
          itemBuilder: (context, index, realIndex) {
            return slider(slidePictures[index]);
          },
        ),
        // Container(
        //   // ignore: prefer_const_constructors
        //   decoration: BoxDecoration(
        //     image: const DecorationImage(
        //       image: AssetImage('lib/assets/dms1.png'),
        //       fit: BoxFit.fill,
        //     ),
        //   ),
        // ),
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
                    //width: 31.71,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget slider(String slidePictures) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.transparent,
      height: _height,
      width: _width,
      child: Image.asset(
        slidePictures,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget pageIndicator() {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Container(
      height: _height * .005924,
      width: _width * .0128,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: appColorPrimary,
      ),
      child: AnimatedSmoothIndicator(
        effect: ExpandingDotsEffect(
          dotColor: appColorPrimary,
          activeDotColor: appColorPrimary,
          dotWidth: _width * .0128,
          dotHeight: _height * .005924,
          expansionFactor: _width * .02,
        ),
        activeIndex: activeIndex,
        count: 4,
      ),
    );
  }

  Widget _bottomBar(context) {
    if (counter > 0) {
      setState(() {
        firstPressed = true;
      });
    } else {
      firstPressed = false;
    }

    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Container(
      //color: Colors.transparent,
      height: _height * .3957,
      decoration: const BoxDecoration(
        //backgroundBlendMode: BlendMode.difference,
        color: appColorPrimaryLight,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(children: [
        SizedBox(
          height: _height * 0.056,
        ),
        Row(
          children: [
            SizedBox(
              width: _width * 0.12,
            ),
            // Container(
            //   height: _height * .005924,
            //   width: _width * .0128,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(15),
            //     color: appColorPrimary,
            //   ),
            // ),
            pageIndicator(),

            SizedBox(
              width: _width * .02,
            ),
            // Container(
            //   height: _height * .005924,
            //   width: _width * .067,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(15),
            //     color: appColorPrimary,
            //   ),
            // ),
            SizedBox(
              width: _width * .02,
            ),
            // Container(
            //   height: _height * .005924,
            //   width: _width * .103,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(15),
            //     color: appColorPrimary,
            //   ),
            // ),
          ],
        ),
        SizedBox(
          height: _height * .033,
        ),
        Row(
          children: [
            SizedBox(
              width: _width * 0.12,
            ),
            Container(
              // width: _width * .45385,
              // height: _height * .0379,
              //width: _width * .4538,
              child: Text(
                "Lets get Started",
                style: GoogleFonts.poppins(
                  fontSize: _height * .026,
                  //fontSize: _width * .0564,
                  fontWeight: FontWeight.w700,
                  color: appColorPrimary,
                  letterSpacing: 0.4,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: _height * .03,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: _width * .1155),
          child: Row(
            children: [
              Container(
                width: _width * .769,
                //height: _height * .064,
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur\nadipiscing elit. Odio faucibus est viverra viverra\nsit arcu feugiat purus tempor.",
                  style: GoogleFonts.poppins(
                    fontSize: _height * .014,
                    //fontSize: _width * .0308,
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
          height: _height * .05,
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
                        print("This has been clicked $counter times");
                        setState(() {
                          counter++;
                        });
                        if (counter == 4) {
                          final LogInBloc lb = Provider.of<LogInBloc>(context, listen: false);
                          lb.setOnboarding();
                          nextScreenReplace(context, LoginScreen());
                        } else {
                          _showNext();
                        }
                      },
                      child: Center(
                        child: Text(
                          firstPressed ? "Next" : "Get Started",
                          style: GoogleFonts.poppins(
                            color: appWhite,
                            fontWeight: FontWeight.w500,
                            fontSize: _height * .017,
                            //fontSize: _width * .0376,
                          ),
                        ),
                      )),
                ),
              ),
            ),
          ]),
        ),
      ]),
    );
  }

  void _showNext() {
    _myController.nextPage();
  }
}
