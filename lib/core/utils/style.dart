
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppStyle{



  static const  TextStyle style16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  static const  TextStyle style18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
  static const  TextStyle style16W = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.white
  );
  static const  TextStyle style18W = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: Colors.white
  );
  static const  TextStyle style20W = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Colors.white
  );
  static const  TextStyle style14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );
  static const  TextStyle style10 = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.bold,
  );
  static const  TextStyle style12 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  static   TextStyle lato16 =GoogleFonts.lato(color: Colors.black,
      fontSize: 20, fontWeight: FontWeight.w500);

}
