import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  static const Color primary = Color(0xff282828);
  static const Color black = Color(0xff282828);
  static const Color white = Color(0xFFFCFCFC);
  static const Color grey = const Color(0xFFEEEEEE);
  static Color green = const Color(0xFF00FFAB);
}

TextStyle fontStyle = GoogleFonts.openSans(
  fontSize: 13,
  fontWeight: FontWeight.w300,
  color: Constants.black,
);

TextStyle fontStyle2 = GoogleFonts.openSans(
  fontSize: 12,
  fontWeight: FontWeight.bold,
  color: Constants.black,
);

InputDecoration formDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.grey[200],
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
  ),
  enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
);

double deviceWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double deviceHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}
