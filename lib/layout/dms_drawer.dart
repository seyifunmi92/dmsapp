import 'package:dms/main.dart';
import 'package:dms/screens/auth/login_screen.dart';
import 'package:dms/screens/carts/carts.dart';
import 'package:dms/screens/dashboard/dashboard.dart';
import 'package:dms/screens/faq/faq_categories.dart';
import 'package:dms/screens/my%20orders/myorders.dart';
import 'package:dms/screens/my_atc/my_atc_select_business.dart';
import 'package:dms/screens/products/products.dart';
import 'package:dms/screens/products/selectcompany.dart';
import 'package:dms/screens/profile/myprofile.dart';
import 'package:dms/screens/support/support_item.dart';
import 'package:dms/screens/support/support_request_list.dart';
import 'package:dms/screens/wallet/mywallet.dart';
import 'package:dms/screens/wallet/wallet.dart';
import 'package:dms/utils/colors.dart';
import 'package:dms/utils/next_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../blocs/login_bloc.dart';
import '../utils/images.dart';

class DMSDrawerItem {
  final String title;
  final Function page;
  final String icon;
  final String iconred;

  DMSDrawerItem(this.title, this.icon, this.iconred, this.page);
}

class DMSDrawer extends StatefulWidget {
  const DMSDrawer({Key? key}) : super(key: key);

  @override
  State<DMSDrawer> createState() => _DMSDrawerState();
}

class _DMSDrawerState extends State<DMSDrawer> {
  static final List<DMSDrawerItem> drawerItems = [
    DMSDrawerItem('Dashboard', "lib/assets/dash.png", "lib/assets/navbar.png",
        () => DashBoard()),
    DMSDrawerItem('My Orders', "lib/assets/navbar1.png", "lib/assets/order.png",
        () => MyOrders()),
    // DMSDrawerItem('My ATC', "lib/assets/navbar2.png", "lib/assets/atc.png",
    //     () => MyATCSelectBusiness()),
    DMSDrawerItem('My Wallet', "lib/assets/navbar3.png",
        "lib/assets/wallet.png", () => MyWallet()),
    DMSDrawerItem('Products', "lib/assets/navbar6.png",
        "lib/assets/product.png", () => SelectCompany()),
    DMSDrawerItem('Cart', "lib/assets/navbar1.png", "lib/assets/order.png",
        () => Carts()),
    DMSDrawerItem('Support', "lib/assets/navbar7.png", "lib/assets/support.png",
        () => SupportItem()),
    DMSDrawerItem('FAQ', "lib/assets/navbar8.png", "lib/assets/faq.png",
        () => FAQCategories()),
    // DMSDrawerItem('Logout', "lib/assets/logout.png", "lib/assets/logout.png",
    //     () => logOut()),
  ];

  @override
  Widget build(BuildContext context) {
    int selectedIndex = DmsAppRoot.of(context)!.getSelected();

    double _width = MediaQuery.of(context).size.width * .777;
    double _height = MediaQuery.of(context).size.height;
    return Container(
      width: _width,
      height: _height,
      color: appWhite,
      child: Column(children: [
        SizedBox(
          height: _height * .075,
        ),
        Row(
          children: [
            SizedBox(
              width: _width * .3366,
            ),
            Image.asset(
              "lib/assets/dmssurface2.png",
              width: _width * .25,
              height: _height * .052,
            ),
          ],
        ),
        SizedBox(
          height: _height * .042,
        ),
        Row(
          children: [
            SizedBox(
              width: _width * .1155,
            ),
            // InkWell(
            //   onTap: () {
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => Myprofile()));
            //   },
            //   child: Container(
            //     width: _width * .76,
            //     height: _height * .077,
            //     decoration: BoxDecoration(
            //       border: Border.all(color: Color(0xffE4EBF3)),
            //       color: appWhite,
            //       borderRadius: BorderRadius.circular(5),
            //
            //       //border: BoxBorder(),
            //     ),
            //     child: Column(children: [
            //       SizedBox(
            //         height: _height * .013,
            //       ),
            //       Row(
            //         children: [
            //           SizedBox(
            //             width: _width * .0495,
            //           ),
            //           Container(
            //             height: 40,
            //             width: 40,
            //             decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(20),
            //               color: Colors.grey,
            //             ),
            //             child: Image.asset(
            //               "assets/icons/avatar.png",
            //               height: 40,
            //               width: 40,
            //             ),
            //           ),
            //           SizedBox(
            //             width: _width * .036,
            //           ),
            //           Column(
            //             mainAxisAlignment: MainAxisAlignment.start,
            //             children: [
            //               Text(
            //                 "Oluwatobi Olowu",
            //                 style: GoogleFonts.poppins(
            //                   color: Color(0xff000000),
            //                   fontSize: _width * .046,
            //                   fontWeight: FontWeight.w500,
            //                 ),
            //               ),
            //               SizedBox(
            //                 height: _height * .0012,
            //               ),
            //               Align(
            //                 alignment: Alignment.topLeft,
            //                 child: Text(
            //                   "Account 1",
            //                   style: GoogleFonts.poppins(
            //                     color: Color(0xffC4C4C4),
            //                     fontWeight: FontWeight.w400,
            //                     fontSize: _width * .033,
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ],
            //       )
            //     ]),
            //   ),
            // ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Myprofile()));
              },
              child: Container(
                width: _width * .76,
                height: _height * .077,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffE4EBF3)),
                  color: appWhite,
                  borderRadius: BorderRadius.circular(5),

                  //border: BoxBorder(),
                ),
                child: Column(children: [
                  SizedBox(
                    height: _height * .013,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: _width * .0495,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: _height * .05,
                            width: _height * .05,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey,
                            ),

                            child: Image.asset(
                              "assets/icons/avatar.png",
                              height: 40,
                              width: 40,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: _width * .036,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Oluwatobi Olowu",
                            style: GoogleFonts.poppins(
                              color: Color(0xff000000),
                              fontSize: _height * .02,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: _height * .0012,
                          ),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Account 1",
                                style: GoogleFonts.poppins(
                                  color: Color(0xffC4C4C4),
                                  fontWeight: FontWeight.w400,
                                  fontSize: _height * .012,
                                ),
                              ),
                            ],
                          ),
                          // Align(
                          //   alignment: Alignment.topLeft,
                          //   child: Text(
                          //     "Account 1",
                          //     style: GoogleFonts.poppins(
                          //       color: Color(0xffC4C4C4),
                          //       fontWeight: FontWeight.w400,
                          //       fontSize: _width * .033,
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ],
                  )
                ]),
              ),
            ),
          ],
        ),
        SizedBox(
          height: _height * .005,
        ),
        ListView(
          shrinkWrap: true,
          children: drawerItems.map((DMSDrawerItem item) {
            int index = drawerItems.indexOf(item);

            return GestureDetector(
              onTap: () {
                // Navigator.pop(context);
                finish(context);
                DmsAppRoot.of(context)!.setSelected(index);
                // nextScreenCloseOthers(context, item.page);

                Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, anim1, anim2) => item.page(),
                      transitionsBuilder: (context, anim1, anim2, child) =>
                          FadeTransition(opacity: anim1, child: child),
                      transitionDuration: Duration(milliseconds: 200),
                    ));
              },
              child: SizedBox(
                height: _height * .082,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: _width * .1566,
                    ),
                    Image.asset(
                        index == selectedIndex ? item.iconred : item.icon),
                    SizedBox(width: _width * .088),
                    Text(
                      item.title,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        color: index == selectedIndex
                            ? Color(0xffEC1C24)
                            : appColorPrimary,
                        fontSize: _height * .0185,
                      ),
                    ),
                    SizedBox(width: _width * .355),
                    index == selectedIndex
                        ? Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              height: _height * .051,
                              width: _width * .02,
                              decoration: BoxDecoration(
                                color: Color(0xffEC1C24),
                                borderRadius: BorderRadius.circular(9.27),
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
        GestureDetector(
          onTap: () {
            logOut(context);
          },
          child: SizedBox(
            height: _height * .082,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: _width * .1566,
                ),
                Image.asset(logoutImg),
                SizedBox(width: _width * .088),
                Text(
                  "Logout",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    color: appColorPrimary,
                    fontSize: _height * .0185,
                  ),
                ),
                SizedBox(width: _width * .355),
                // index == selectedIndex
                //     ? Align(
                //   alignment: Alignment.topRight,
                //   child: Container(
                //     height: _height * .051,
                //     width: _width * .02,
                //     decoration: BoxDecoration(
                //       color: Color(0xffEC1C24),
                //       borderRadius: BorderRadius.circular(9.27),
                //     ),
                //   ),
                // )
                //     : Container(),
              ],
            ),
          ),
        ),
        // SizedBox(
        //   height: _height * .05,
        // ),
        // Row(
        //   children: [
        //     SizedBox(
        //       width: _width * .1866,
        //     ),
        //     Image.asset("lib/assets/navbar1.png"),
        //     SizedBox(width: _width * .088),
        //     Text(
        //       "My Orders",
        //       style: GoogleFonts.poppins(
        //         fontWeight: FontWeight.w400,
        //         color: appColorPrimary,
        //         fontSize: _width * .05,
        //       ),
        //     ),
        //   ],
        // ),
        // SizedBox(
        //   height: _height * .05,
        // ),
        // Row(
        //   children: [
        //     SizedBox(
        //       width: _width * .1866,
        //     ),
        //     Image.asset("lib/assets/navbar2.png"),
        //     SizedBox(width: _width * .088),
        //     Text(
        //       "My ATC",
        //       style: GoogleFonts.poppins(
        //         fontWeight: FontWeight.w400,
        //         color: appColorPrimary,
        //         fontSize: _width * .05,
        //       ),
        //     ),
        //
        //   ],
        // ),
        // SizedBox(
        //   height: _height * .05,
        // ),
        // Row(
        //   children: [
        //     SizedBox(
        //       width: _width * .1866,
        //     ),
        //     Image.asset("lib/assets/navbar3.png"),
        //     SizedBox(width: _width * .088),
        //     Text(
        //       "My Wallet",
        //       style: GoogleFonts.poppins(
        //         fontWeight: FontWeight.w400,
        //         color: appColorPrimary,
        //         fontSize: _width * .05,
        //       ),
        //     ),
        //
        //   ],
        // ),
        // SizedBox(
        //   height: _height * .05,
        // ),
        // Row(
        //   children: [
        //     SizedBox(
        //       width: _width * .1866,
        //     ),
        //     Image.asset("lib/assets/navbar6.png"),
        //     SizedBox(width: _width * .088),
        //     Text(
        //       "Products",
        //       style: GoogleFonts.poppins(
        //         fontWeight: FontWeight.w400,
        //         color: appColorPrimary,
        //         fontSize: _width * .05,
        //       ),
        //     ),
        //   ],
        // ),
        // SizedBox(
        //   height: _height * .05,
        // ),
        // Row(
        //   children: [
        //     SizedBox(
        //       width: _width * .1866,
        //     ),
        //     Image.asset("lib/assets/navbar1.png"),
        //     SizedBox(width: _width * .088),
        //     Text(
        //       "Cart",
        //       style: GoogleFonts.poppins(
        //         fontWeight: FontWeight.w400,
        //         color: appColorPrimary,
        //         fontSize: _width * .05,
        //       ),
        //     ),
        //   ],
        // ),
        // SizedBox(
        //   height: _height * .05,
        // ),
        // Row(
        //   children: [
        //     SizedBox(
        //       width: _width * .1866,
        //     ),
        //     Image.asset("lib/assets/navbar7.png"),
        //     SizedBox(width: _width * .088),
        //     Text(
        //       "Support",
        //       style: GoogleFonts.poppins(
        //         fontWeight: FontWeight.w400,
        //         color: appColorPrimary,
        //         fontSize: _width * .05,
        //       ),
        //     ),
        //
        //   ],
        // ),
        // SizedBox(
        //   height: _height * .05,
        // ),
        // Row(
        //   children: [
        //     SizedBox(
        //       width: _width * .1866,
        //     ),
        //     Image.asset("lib/assets/navbar8.png"),
        //     SizedBox(width: _width * .088),
        //     Text(
        //       "FAQ",
        //       style: GoogleFonts.poppins(
        //         fontWeight: FontWeight.w400,
        //         color: appColorPrimary,
        //         fontSize: _width * .05,
        //       ),
        //     ),
        //
        //   ],
        // ),
      ]),
    );
  }
}

Future logOut(BuildContext context) async{
  final LogInBloc lb = context.read<LogInBloc>();
  await lb
      .userSignout()
      .then((value) => nextScreenCloseOthers(context, LoginScreen()));
}


