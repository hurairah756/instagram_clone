import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constant_variables.dart';

TextStyle bodyText(
    {FontWeight? fontWeight, double? fontSize, Color? textColor}) {
  return robotoTextStyle(
      fontWeight: fontWeight, fontSize: fontSize, textColor: textColor);
}

TextStyle robotoTextStyle(
    {FontWeight? fontWeight, double? fontSize, Color? textColor}) {
  return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: textColor ?? Colors.white,
        fontSize: fontSize ??
            deviceAverageSize * (fontSize ?? ConstantVariables.textSizeRegular),
        decoration: TextDecoration.none,
      ),
      fontWeight: fontWeight ?? FontWeight.normal);
}

TextSpan CustomTextSpan(
    {FontWeight? fontWeight, Color? color, required String spanText}) {
  return TextSpan(
    text: spanText,
    style: bodyText(
      fontWeight: fontWeight ?? FontWeight.normal,
      textColor: color ?? Colors.black,
      fontSize: deviceHeight / 55,
    ),
  );
}
