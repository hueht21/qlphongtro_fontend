import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class FontUtils{
  static TextStyle font20BoldP() {
    return GoogleFonts.plusJakartaSans().copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: const Color(0xff574B78));
  }
  static TextStyle font26W700() {
    return GoogleFonts.plusJakartaSans().copyWith(
        fontSize: 26,
        fontWeight: FontWeight.w700,
        color: const Color(0xff574B78));
  }
  static TextStyle font16W700() {
    return GoogleFonts.plusJakartaSans().copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: Colors.white);
  }
  static TextStyle font14W500() {
    return GoogleFonts.plusJakartaSans().copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.white);
  }

  static TextStyle font12W500() {
    return GoogleFonts.plusJakartaSans().copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: Colors.white);
  }
  static TextStyle font14W700() {
    return GoogleFonts.plusJakartaSans().copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: const Color(0xff2EB4FF));
  }
  static TextStyle font16W600() {
    return GoogleFonts.plusJakartaSans().copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.white);
  }
  static TextStyle font15W400() {
    return GoogleFonts.plusJakartaSans().copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: Colors.white);
  }
  static TextStyle font16W400() {
    return GoogleFonts.plusJakartaSans().copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: Colors.white);
  }
  static TextStyle font20W700() {
    return GoogleFonts.plusJakartaSans().copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: Colors.white);
  }
  static TextStyle font15W600() {
    return GoogleFonts.plusJakartaSans().copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: const Color(0xff574B78));
  }


  static TextStyle font18w500(){
    return const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle font14(){
    return const TextStyle(
      fontSize: 14,
      color: Color(0xff99B2C6),
    );
  }
}