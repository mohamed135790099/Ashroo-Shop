import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextUtils extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  TextDecoration textDecoration = TextDecoration.none;
  FontWeight fontWeight=FontWeight.bold;
  var googleFont = GoogleFonts.aclonica;

  TextUtils(
      {Key? key,
      required this.googleFont,
      required this.text,
      required this.color,
      required this.fontSize,
      required this.fontWeight,
        required this.textDecoration})
      : super(key: key,);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: googleFont(
        textStyle: TextStyle(
          overflow:TextOverflow.ellipsis,
          color: color,
          fontSize: fontSize,
          fontWeight:fontWeight,
          decoration: textDecoration,
    )));
  }
}
