import 'package:dms/constant.dart';
import 'package:dms/screens/carts/carts.dart';
import 'package:dms/utils/colors.dart';
import 'package:dms/utils/next_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';

void changeStatusColor(Color color) async {
  setStatusBarColor(color);
}

AppBar dmsAppBar(BuildContext context, String title,
    {List<Widget>? actions,
    bool showBack = true,
    bool isImage = false,
    Color? color,
    Color? iconColor,
    Color? textColor}) {
  return AppBar(
    toolbarHeight: MediaQuery.of(context).size.height * .0438,
    centerTitle: true,
    automaticallyImplyLeading: false,
    elevation: 0,
    // title: isImage ? Image.asset('assets/images/logo.png', height: MediaQuery.of(context).size.height * 0.05,) : Text(title, style: TextStyle(color: appLight_parrot_green),),
    backgroundColor: Colors.transparent,
    leading: showBack
        ? IconButton(
            onPressed: () {
              finish(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: appColorPrimary,
            ),
          )
        : null,
    actions: actions,
    iconTheme: IconThemeData(color: appColorPrimary),
  );
}

AppBar dmsDrawerAppBar(BuildContext context, String title, _onPressed,
    {List<Widget>? actions,
    bool showDrawer = true,
    bool isImage = false,
    Color? color,
    Color? iconColor,
    Color? textColor}) {
  return AppBar(
    centerTitle: true,
    automaticallyImplyLeading: false,
    elevation: 0,
    // title: isImage ? Image.asset('assets/images/logo.png', height: MediaQuery.of(context).size.height * 0.05,) : Text(title, style: TextStyle(color: appLight_parrot_green),),
    backgroundColor: Colors.transparent,
    leading: showDrawer
        ? IconButton(
            onPressed: _onPressed,
            icon: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Image.asset(
                'lib/assets/dmsmenu.png',
                height: MediaQuery.of(context).size.height * 0.05,
              ),
            ),
          )
        : null,
    actions: actions,
    iconTheme: IconThemeData(color: appColorPrimary),
  );
}

// String convertDate(date) {
//   try {
//     return date != null ? DateFormat(dateFormat).format(DateTime.parse(date)) : '';
//   } catch (e) {
//     print(e);
//     return '';
//   }
// }

Widget text(
  String? text, {
  var fontSize = textSizeLargeMedium,
  Color? textColor,
  var fontFamily,
  var isCentered = false,
  var maxLine = 1,
  var latterSpacing = 0.5,
  bool textAllCaps = false,
  var isLongText = false,
  bool lineThrough = false,
  bool isBoldText = false,
  bool isWrap = false,
}) {
  return Text(
    textAllCaps ? text!.toUpperCase() : text!,
    textAlign: isCentered ? TextAlign.center : TextAlign.start,
    maxLines: isLongText ? null : maxLine,
    overflow: TextOverflow.visible,

    ///isWrap ? TextOverflow.visible : TextOverflow.ellipsis,
    style: GoogleFonts.poppins(
      // fontFamily: fontFamily ?? null,
      fontSize: fontSize,
      color: textColor ?? appColorPrimary,
      height: 1.5,
      fontWeight: isBoldText ? FontWeight.bold : FontWeight.normal,
      letterSpacing: latterSpacing,
      decoration: lineThrough ? TextDecoration.underline : TextDecoration.none,
    ),
  );
}

AppBar dmsAppBarwithCart(BuildContext context, String title,
    {List<Widget>? actions,
    bool showBack = true,
    bool isImage = false,
    Color? color,
    Color? iconColor,
    Color? textColor}) {
  return AppBar(
    centerTitle: true,
    automaticallyImplyLeading: false,
    elevation: 0,

    // title: isImage ? Image.asset('assets/images/logo.png', height: MediaQuery.of(context).size.height * 0.05,) : Text(title, style: TextStyle(color: appLight_parrot_green),),
    backgroundColor: Colors.transparent,

    title: showBack
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  finish(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: appColorPrimary,
                ),
              ),
              IconButton(
                onPressed: () {
                  nextScreen(context, Carts());

                },
                icon: Icon(
                  Icons.shopping_cart,
                  color: appColorPrimary,
                ),
              ),
            ],
          )
        : null,

    actions: actions,

    iconTheme: IconThemeData(color: appColorPrimary),
  );
}
