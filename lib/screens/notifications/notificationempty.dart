import 'package:dms/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyNot extends StatefulWidget {
  const EmptyNot({Key? key}) : super(key: key);

  @override
  _EmptyNotState createState() => _EmptyNotState();
}

class _EmptyNotState extends State<EmptyNot> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    var mypaddingr = SizedBox(width: _width * 0.07);

    var mypaddingrh = SizedBox(height: _height * .026);
    return Scaffold(
      body: Column(children: [
        SizedBox(height: _height * .05),
        Row(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            mypaddingr,
            InkWell(
              onTap: () {},
              child: Icon(
                Icons.arrow_back_ios_outlined,
                color: appColorPrimary,
                size: _width * .04,
              ),
            ),
          ],
        ),
        mypaddingrh,
        Row(
          children: [
            mypaddingr,
            Text(
              "Notifications",
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.02,
                color: appColorPrimary,
              ),
            ),
          ],
        ),
        SizedBox(
          height: _height * .185,
        ),
        Image.asset("lib/assets/noty.png"),
        SizedBox(
          height: _height * .021,
        ),
        Text(
          "Notification List Empty",
          style: GoogleFonts.openSans(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Color(0xff98A4B5)),
        )
      ]),
    );
  }
}
