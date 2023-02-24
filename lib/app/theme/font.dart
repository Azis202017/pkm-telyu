import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pakas/app/theme/color.dart';

TextStyle headline1Bold = GoogleFonts.poppins(
  fontSize: 32,
  fontWeight: FontWeight.bold,
);
TextStyle headline2Semi = GoogleFonts.poppins(
  fontSize:16,
  fontWeight:FontWeight.w600,
  height : 2.0,
);

TextStyle headline4Bold = GoogleFonts.poppins(
  fontSize: 16,
  fontWeight: FontWeight.bold,
);

TextStyle buttonLinkLBold = GoogleFonts.poppins(
  fontSize: 18,
  fontWeight: FontWeight.bold,
);

TextStyle textPlaceholder = GoogleFonts.poppins(
  fontSize: 16,
  color: textPlaceHolderColor,
);

TextStyle textDescription = GoogleFonts.poppins(
  fontSize: 16,
);
TextStyle errorTextStyle = GoogleFonts.poppins(
  fontSize: 14,
  color: Colors.red.shade200,
);