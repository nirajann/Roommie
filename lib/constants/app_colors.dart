import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color mainColor = Color(0xff2031C9);
  static const Color primaryColor = Color(0xff632B13);
  static const Color whiteColor = Color(0xffFFFFFF);
  static const Color blackColor = Color(0xff000000);
  static const Color greyColor = Color(0xff7a7a7a);
  static const Color secondaryColor = Color(0x00ffe397);
  static const Color greyColor2 = Color(0x00f1f1f1);
  static const danger = Color(0xFFFF3B1D);
  static const green = Color.fromARGB(255, 0, 255, 47);

  static const kSecondaryColor = Color(0xFF8B94BC);
  static const kGreenColor = Color(0xFF6AC259);
  static const kRedColor = Color(0xFFE92E30);
  static const kGrayColor = Color(0xFFC1C1C1);
  static const kBlackColor = Color(0xFF101010);
  static const kPrimaryGradient = LinearGradient(
    colors: [Color(0xFF46A0AE), Color(0xFF00FFCB)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const double kDefaultPadding = 20.0;

  Widget loadingIndicator = const CircularProgressIndicator(color: mainColor);

  TextStyle greyFontStyle = GoogleFonts.poppins().copyWith(color: greyColor);
  TextStyle blackFontStyle = GoogleFonts.poppins()
      .copyWith(color: blackColor, fontSize: 12, fontWeight: FontWeight.w400);
  TextStyle blackFontStyle2 = GoogleFonts.poppins()
      .copyWith(color: blackColor, fontSize: 14, fontWeight: FontWeight.w500);
  TextStyle blackFontStyle3 = GoogleFonts.poppins()
      .copyWith(color: blackColor, fontSize: 18, fontWeight: FontWeight.w600);
  TextStyle whiteFontStyle =
      GoogleFonts.poppins().copyWith(fontSize: 14, fontWeight: FontWeight.w500);
  TextStyle yellowFontStyle = GoogleFonts.poppins()
      .copyWith(color: mainColor, fontSize: 12, fontWeight: FontWeight.w400);
}
