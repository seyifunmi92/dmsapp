import 'package:carousel_slider/carousel_slider.dart';
import 'package:dms/screens/auth/login_screen.dart';
import 'package:dms/screens/profile/myprofile.dart';
import 'package:dms/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class NewOnboard extends StatefulWidget {
  const NewOnboard({Key? key}) : super(key: key);

  @override
  _NewOnboardState createState() => _NewOnboardState();
}

class _NewOnboardState extends State<NewOnboard> {
  bool firstPressed = false;
  bool secondPressed = false;
  bool thridPressed = false;
  int counter = 0;
  int activeIndex = 0;

  final _myController = CarouselController();

  bool nextPicture = false;
  void clickButton() async {
    setPicture(true);
    await Future.delayed(const Duration(seconds: 1));
    setPicture(false);
  }

  void setPicture(bool _nextPicture) {
    setState(() {
      nextPicture = _nextPicture;
      print("setting state :  + ${nextPicture.toString()}");
    });
  }

  void _showNext() {
    _myController.nextPage();
  }

  final onboardImages = [
    "lib/assets/dms8.png",
    "lib/assets/dms9.png",
    "lib/assets/myatconboard.png",
    "lib/assets/scheduleonboard.png"
  ];
  @override
  Widget build(BuildContext context) {
    if (counter > 0) {
      setState(() {
        firstPressed = true;
      });
    } else {
      firstPressed = false;
    }
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: appColorPrimary,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          SizedBox(height: _height * .07),
          Row(
            children: [
              SizedBox(
                width: _width * .15,
              ),
              Image.asset(
                "lib/assets/dmssurface.png",
                height: 45.69,
                width: 105,
              ),
            ],
          ),
          SizedBox(
            height: _height * .05,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: _width * .1285),
            child: CarouselSlider.builder(
              carouselController: _myController,
              options: CarouselOptions(
                onPageChanged: (index, reason) {
                  setState(() {
                    activeIndex = index;
                  });
                },
                initialPage: 0,
                viewportFraction: 1,
                height: _height * .726,
              ),
              itemCount: onboardImages.length,
              itemBuilder: (context, index, realIndex) {
                return slider(onboardImages[index]);
              },
            ),
            // Row(
            //   children: [
            //     Container(
            //       height: _height * .700,
            //       width: _width * .743,
            //       child: Image.asset(
            //         nextPicture ? "lib/assets/dms9.png" : "lib/assets/dms8.png",
            //         // height: _height * .700,
            //         // width: _width * .743,
            //       ),
            //     ),
            //   ],
            // ),
          ),
        ]),
      ),
      bottomNavigationBar: Container(
        height: _height * .359,
        decoration: const BoxDecoration(
          color: appWhite,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(children: [
          SizedBox(
            height: _height * 0.058,
          ),
          Row(
            children: [
              SizedBox(
                width: _width * 0.079,
              ),
              pageIndicator(),
              // Container(
              //   height: _height * .005924,
              //   width: _width * .0128,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(27),
              //     color: appColorPrimary,
              //   ),
              // ),
              // SizedBox(
              //   width: _width * .02,
              // ),
              // Container(
              //   height: _height * .005924,
              //   width: _width * .0128,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(27),
              //     color: appColorPrimary,
              //   ),
              // ),
              // SizedBox(
              //   width: _width * .02,
              // ),
              // Container(
              //   height: _height * .005924,
              //   width: _width * .0128,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(27),
              //     color: appColorPrimary,
              //   ),
              // // ),
              // SizedBox(
              //   width: _width * .02,
              // ),
              // Container(
              //   height: _height * .005924,
              //   width: _width * .0128,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(27),
              //     color: appColorPrimary,
              //   ),
              // ),
            ],
          ),
          SizedBox(
            height: _height * .024,
          ),
          Row(
            children: [
              SizedBox(
                width: _width * 0.074,
              ),
              Text(
                nextPicture ? "Orders" : "Register",
                style: GoogleFonts.poppins(
                  fontSize: _height * .026,
                  fontWeight: FontWeight.w700,
                  color: appColorPrimary,
                  letterSpacing: 0.4,
                ),
              ),
            ],
          ),
          SizedBox(
            height: _height * .024,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: _width * 0.079,
            ),
            child: Row(
              children: [
                Container(
                  width: _width * .769,
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur\nadipiscing elit. Odio faucibus est viverra viverra\nsit arcu feugiat purus tempor.",
                    style: GoogleFonts.poppins(
                      fontSize: _height * .014,
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
            height: _height * .027,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: _width * 0.079,
            ),
            child: Row(children: [
              Container(
                height: _height * .0633,
                width: _width * .41,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  color: appColorPrimary,
                ),
                child: InkWell(
                    onTap: () {
                      // setState(() {
                      //   nextPicture = true;
                      // });
                      // if (!mounted) {
                      //   nextPicture = false;
                      // }
                      print("This has been clicked $counter times");
                      setState(() {
                        counter++;
                      });
                      if (counter == 4) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
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
                          fontSize: _height * .0174,
                        ),
                      ),
                    )),
              ),
              SizedBox(
                width: _width * .08,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                },
                child: Text(
                  "Skip",
                  style: GoogleFonts.poppins(
                    fontSize: _height * .015,
                    color: appColorPrimary,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.2,
                    //height: 18.87,
                  ),
                ),
              ),
            ]),
          ),
        ]),
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
        effect: WormEffect(
          dotColor: appColorPrimary,
          activeDotColor: appColorPrimary,
          dotWidth: _width * .0128,
          dotHeight: _height * .005924,
          //expansionFactor: _width * .02,
        ),
        activeIndex: activeIndex,
        count: 4,
      ),
    );
  }

  Widget slider(String onboardImages) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.transparent,
      height: _height,
      width: _width,
      child: Image.asset(
        onboardImages,
        fit: BoxFit.cover,
      ),
    );
  }
}
