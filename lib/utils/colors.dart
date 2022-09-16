import 'package:flutter/material.dart';

// Light Theme Colors
const appColorPrimary = Color(0xFF100C57);
const appColorPrimaryDark = Color(0xFF1E1E1E);
const appColorAccent = Color(0xFF253085);
const appTextColorPrimary = Color(0xFF212121);
const iconColorPrimary = Color(0xFFFFFFFF);
const appTextColorSecondary = Color(0xFF5A5C5E);
const iconColorSecondary = Color(0xFFA8ABAD);
const appLayout_background = Color(0xFFf8f8f8);
const appWhite = Color(0xFFFFFFFF);
const appLight_purple = Color(0xFFdee1ff);
const appLight_yellow = Color(0xffff8b00);
const appLight_orange = Color(0xFFffddd5);
const appLight_bitter_lemon = Color(0xFF27AE60);
const appLight_facebook_blue = Color(0xFF0778E8);
const appLight_google_red = Color(0xFFDC3027);
const appLight_parrot_green = Color(0xFFb4ef93);
const appIconTintCherry = Color(0xFFffddd5);
const appIconTint_sky_blue = Color(0xFF73d8d4);
const appIconTint_mustard_yellow = Color(0xFFffc980);
const appIconTintDark_purple = Color(0xFF8998ff);
const appTxtTintDark_purple = Color(0xFF515BBE);
const appIconTintDarkCherry = Color(0xFFf2866c);
const appIconTintDark_sky_blue = Color(0xFF73d8d4);
const appDark_parrot_green = Color(0xFF73AB22);
const appDarkRed = Color(0xFFF06263);
const appLightRed = Color(0xFFF89B9D);
const appCat1 = Color(0xFF8998FE);
const appCat2 = Color(0xFFFF9781);
const appCat3 = Color(0xFF73D7D3);
const appCat4 = Color(0xFF87CEFA);
const appCat5 = appColorPrimary;
const appShadowColor = Color(0x95E9EBF0);
const appColorPrimaryLight = Color(0xFFF9FAFF);
const appSecondaryBackgroundColor = Color(0xFF131d25);
const appDividerColor = Color(0xFFDADADA);
const inputBackgroundColor = Color(0xFFEFF2F5);
const inputBorderColor = Color(0xFFB1BBC6);

// Dark Theme Colors
const appBackgroundColorDark = Color(0xFF131d25);
const cardBackgroundBlackDark = Color(0xFF1D2939);
const color_primary_black = Color(0xFF131d25);
const appColorPrimaryDarkLight = Color(0xFFF9FAFF);
const iconColorPrimaryDark = Color(0xFF212121);
const iconColorSecondaryDark = Color(0xFFA8ABAD);
const appShadowColorDark = Color(0x1A3E3942);

TextStyle kmediumText(Color colors) => TextStyle(
    color: colors,
    fontSize: 15.0,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400);

Color changeColorHue(Color color) => HSLColor.fromColor(color).withHue(360).toColor();

Color changeColorSaturation(Color color) => HSLColor.fromColor(color).withSaturation(1).toColor();

Color changeColorLightness(Color color) => HSLColor.fromColor(color).withLightness(1).toColor();