import 'package:astro_guide_astro/colors/MyColors.dart';
import 'package:astro_guide_astro/size/Spacing.dart';
import 'package:astro_guide_astro/size/WidgetSize.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget standardTFLabel({required String text, String? optional, String? optionalExtra, Color? optionalColor, double? optionalFontSize,  double? fontSize, double? left}) {
  return Padding(
    padding: EdgeInsets.only(left: left??10, top: standardVTBS),
    child: RichText(
      text: TextSpan(
        text: text,
        style: GoogleFonts.manrope(
          fontSize: fontSize??16.0,
          color: MyColors.labelColor(),
          letterSpacing: 0,
          fontWeight: FontWeight.w600,
        ),
        children: [
          TextSpan(
            text: optional??"",
            style: GoogleFonts.manrope(
              fontSize: optionalFontSize,
              color: optionalColor,
              letterSpacing: 0,
              fontWeight: FontWeight.w600,
            ),
          ),
          TextSpan(
            text: optionalExtra??"",
            style: GoogleFonts.manrope(
              fontSize: 11,
              letterSpacing: 0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ]
      ),
      // children: [
      //   Text(
      //     text,
      //     style: GoogleFonts.manrope(
      //       fontSize: 16.0,
      //       color: MyColors.labelColor(),
      //       letterSpacing: 0,
      //       fontWeight: FontWeight.w600,
      //     ),
      //   ),
      //   Text(
      //     optional??"",
      //     style: GoogleFonts.manrope(
      //       fontSize: optionalFontSize,
      //       color: optionalColor,
      //       letterSpacing: 0,
      //       fontWeight: FontWeight.w600,
      //     ),
      //   ),
      // ],
    ),
  );
}


Widget getIconInfo(String icon, String info, {Color? color, Color? textColor, double? textSize, bool flex = false}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Image.asset(
        icon,
        height: 15,
        width: 15,
        color: color??MyColors.colorButton,
      ),
      SizedBox(
        width: 3,
      ),
      flex ?
      Flexible(
        child: Text(
          info,
          style: GoogleFonts.manrope(
            fontSize: textSize??12.0,
            color: textColor??MyColors.colorGrey,
            letterSpacing: 0,
            fontWeight: FontWeight.w600,
          ),
        ),
      )
          : Text(
        info,
        style: GoogleFonts.manrope(
          fontSize: textSize??12.0,
          color: textColor??MyColors.colorGrey,
          letterSpacing: 0,
          fontWeight: FontWeight.w600,
        ),
      ),
    ],
  );
}
