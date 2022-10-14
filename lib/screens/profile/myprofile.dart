import 'dart:convert';

import 'package:dms/layout/appWidget.dart';
import 'package:dms/screens/auth/password_reset/password_reset_request.dart';
import 'package:dms/screens/auth/password_reset/pwd_reset_confirm_otp.dart';
import 'package:dms/screens/notifications/notificationsettings.dart';
import 'package:dms/utils/colors.dart';
import 'package:dms/utils/next_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../../blocs/login_bloc.dart';
import '../../layout/dms_drawer.dart';
import '../../layout/loading_indicator_widget.dart';
import '../../model/profile.dart';
import '../../network/network_utils.dart';
import '../../utils/animate_controller.dart';
import '../accounts/dangoteaccounts.dart';

class Myprofile extends StatefulWidget {
  const Myprofile({Key? key}) : super(key: key);

  @override
  _MyprofileState createState() => _MyprofileState();
}

class _MyprofileState extends State<Myprofile> {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool menuClicked = false;
  bool isLoading = false;
  Profile? myProfile;

  @override
  void initState() {
    loadProfile();
    super.initState();
  }

  loadProfile() async {
    try {
      // setState(() {
      //   isLoading = true;
      // });
      var response = await getRequestWithToken('/user/profile');

      if (this.mounted) {
        if (response.statusCode == 200) {
          var decodedData = jsonDecode(response.body);
          var profItems = decodedData["data"]["user"];
          setState(() {
            myProfile = Profile.fromJson(profItems);
            isLoading = false;
          });
        }
      }
    } catch(e) {
      setState(() {
        isLoading = false;
      });
      throw 'No Internet connection';

    }
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    var mypaddingr = SizedBox(width: _width * 0.07);
    var mypaddingr2 = SizedBox(width: _width * 0.04);
    var mypaddingrh = SizedBox(height: _height * 0.026);

    var _secondarycolor = Color(0xffEC1C24);

    return ModalProgressHUD(
      inAsyncCall: isLoading,
      progressIndicator: AnimateWidget(),
      child: Scaffold(
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
          //appBar: dmsDrawerAppBar(context, "", () {}),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: myProfile == null ? LoadingIndicatorWidget() : Column(
              children: [
                // SizedBox(height: _height * .05),
                // Row(
                //   //mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     mypaddingr,
                //     InkWell(
                //       onTap: () {},
                //       child: Image.asset(
                //         "lib/assets/dmsmenu.png",
                //         height: _height * .020,
                //         width: _width * .072,
                //         color: appColorPrimary,
                //         //width: 31.71,
                //       ),
                //     ),
                //   ],
                // ),
                mypaddingrh,
                Row(
                  children: [
                    mypaddingr,
                    Text(
                      "My Profile",
                      style: GoogleFonts.poppins(
                        fontSize: _height * .03,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.02,
                        color: appColorPrimary,
                      ),
                    ),
                  ],
                ),
                mypaddingrh,
                Row(
                  children: [
                    mypaddingr,
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.grey,
                      ),
                      child: Stack(children: [
                        Container(
                          decoration: BoxDecoration(
                              //color: Colors.black54,
                              //colorBlendMode: BlendMode.darken,
                              ),
                          child: Image.asset(
                            myProfile?.profilePhotoPublicUrl == null ? "lib/assets/avatar2.png" : myProfile!.profilePhotoPublicUrl!,
                          ),
                        ),
                        Scaffold(
                          backgroundColor: Colors.transparent,
                          body: Center(
                            child: Image.asset(
                              "lib/assets/camera.png",
                              height: _height * .03456,
                              //height: _height * .2,
                            ),
                          ),
                        ),
                      ]),
                      // child: Stack(children: [
                      //   Image.asset(
                      //     "lib/assets/avatar2.png",
                      //   ),
                      //   Image.asset(
                      //     "lib/assets/camera.png",
                      //     height: _height * .4,
                      //   )
                      // ]),
                    ),
                  ],
                ),
                mypaddingrh,
                Row(
                  children: [
                    mypaddingr,
                    Container(
                      height: _height * .04,
                      width: _width * .088,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13.7),
                        color: _secondarycolor,
                      ),
                      child: Center(
                        child: Image.asset(
                          "lib/assets/dmsiconprofile.png",
                          height: _height * .018,
                          width: _width * .038,
                          color: appWhite,
                        ),
                      ),
                    ),
                    mypaddingr2,
                    Text(
                      "${myProfile!.firstName!} ${myProfile!.lastName!}",
                      style: GoogleFonts.openSans(
                        fontSize: _height * .021,
                        fontWeight: FontWeight.w600,
                        color: appColorPrimary,
                        letterSpacing: 0.02,
                      ),
                    ),
                  ],
                ),
                mypaddingrh,
                Row(
                  children: [
                    mypaddingr,
                    Container(
                      height: _height * .04,
                      width: _width * .088,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13.7),
                        color: _secondarycolor,
                      ),
                      child: Center(
                        child: Image.asset(
                          "lib/assets/dmsiconprofile.png",
                          height: _height * .018,
                          width: _width * .038,
                          color: appWhite,
                        ),
                      ),
                    ),
                    mypaddingr2,
                    Text(
                      myProfile!.userName!,
                      style: GoogleFonts.openSans(
                        fontSize: _height * .021,
                        fontWeight: FontWeight.w600,
                        color: appColorPrimary,
                        letterSpacing: 0.02,
                      ),
                    ),
                  ],
                ),
                mypaddingrh,
                Row(
                  children: [
                    mypaddingr,
                    Container(
                      height: _height * .04,
                      width: _width * .088,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13.7),
                        color: _secondarycolor,
                      ),
                      child: Center(
                        child: Image.asset(
                          "lib/assets/Vector.png",
                          height: _height * .018,
                          width: _width * .038,
                          color: appWhite,
                        ),
                      ),
                    ),
                    mypaddingr2,
                    Text(
                      myProfile!.emailAddress!,
                      style: GoogleFonts.openSans(
                        fontSize: _height * .021,
                        fontWeight: FontWeight.w600,
                        color: appColorPrimary,
                        letterSpacing: 0.02,
                      ),
                    ),
                  ],
                ),
                mypaddingrh,
                Row(
                  children: [
                    mypaddingr,
                    Container(
                      height: _height * .04,
                      width: _width * .088,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13.7),
                        color: _secondarycolor,
                      ),
                      child: Center(
                        child: Image.asset(
                          "lib/assets/dmscall.png",
                          height: _height * .018,
                          width: _width * .038,
                          color: appWhite,
                        ),
                      ),
                    ),
                    mypaddingr2,
                    Text(
                      myProfile!.phoneNumber!,
                      style: GoogleFonts.openSans(
                        fontSize: _height * .021,
                        fontWeight: FontWeight.w600,
                        color: appColorPrimary,
                        letterSpacing: 0.02,
                      ),
                    ),
                  ],
                ),
                mypaddingrh,
                mypaddingrh,
                // Row(
                //   children: [
                //     //mypaddingr,
                //     InkWell(
                //       onTap: () {
                //         Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //                 builder: (context) => DangoteAccounts()));
                //       },
                //       child: Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //           children: [
                //             Text(
                //               "Dangote Accounts",
                //               style: GoogleFonts.poppins(
                //                 fontWeight: FontWeight.w500,
                //                 fontSize: _height * .021,
                //                 color: Color(0xff343434),
                //               ),
                //             ),
                //             //SizedBox(width: _width * .45),
                //             Icon(
                //               Icons.arrow_forward_ios_sharp,
                //               size: _width * .038,
                //               color: Color(0xffE0E0E0),
                //             ),
                //           ]),
                //     ),
                //   ],
                // ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: _width * .07),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DangoteAccounts()));
                          },
                          child: Text(
                            "Dangote Accounts",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: _height * .021,
                              color: Color(0xff343434),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DangoteAccounts()));
                          },
                          child: Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: _width * .038,
                            color: Color(0xffE0E0E0),
                          ),
                        ),
                      ]),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: _width * .07),
                  child: Divider(
                    height: _height * .05,
                    color: Color(0xffECECEC),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: _width * .07),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            nextScreen(context, NotSettings());
                          },
                          child: Text(
                            "Notification Settings",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: _height * .021,
                              color: Color(0xff343434),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: _width * .038,
                            color: Color(0xffE0E0E0),
                          ),
                        ),
                      ]),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: _width * .07),
                  child: Divider(
                    height: _height * .05,
                    color: Color(0xffECECEC),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: _width * .07),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () async {
                              isLoading = true;
                              setState(() {});

                              final LogInBloc lb = Provider.of<LogInBloc>(context, listen: false);
                              Map req = {"userName": myProfile!.userName!};

                              await postRequest('/reset', req).then((value) {
                                print(value);
                                if (value.statusCode.isSuccessful()) {
                                  var data = jsonDecode(value.body);
                                  print(data);
                                  lb.saveOtpId(data['data']['otp']['otpDisplayId']).then((value) => {print("otp saved $value")});
                                  toast(data['message'], length: Toast.LENGTH_LONG);
                                  setState(() {
                                    isLoading = false;
                                  });
                                  nextScreen(context, PwdResetConfirmOTP());
                                } else {
                                  if (value.body.isJson()) {
                                    var data = jsonDecode(value.body);
                                    print("Omo Error $data");
                                    toast(data['message'], length: Toast.LENGTH_LONG);
                                    setState(() {
                                      isLoading = false;
                                    });
                                  }
                                }
                              }).catchError((e) {
                                isLoading = false;
                                toast("We are unable to complete your request at this time", length: Toast.LENGTH_LONG);
                                print(e.toString());
                                setState(() {});

                              });

                          },
                          child: Text(
                            "Change Password",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: _height * .021,
                              color: Color(0xff343434),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: _width * .038,
                            color: Color(0xffE0E0E0),
                          ),
                        ),
                      ]),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: _width * .07),
                  child: Divider(
                    height: _height * .05,
                    color: Color(0xffECECEC),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
