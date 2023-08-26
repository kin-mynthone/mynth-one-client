// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class TextWidget extends StatelessWidget {
  final String stringData;
  final FontWeight boldValue;
  final double fontSize;
  double? letterSpacing = 10;
  final Color color;
  final bool centerAlignment;

  TextWidget(
      {Key? key,
      required this.stringData,
      required this.fontSize,
      required this.boldValue,
      required this.color,
      required this.centerAlignment,
      this.letterSpacing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(
        stringData,
        style: GoogleFonts.poppins(
            fontSize: fontSize,
            color: color,
            letterSpacing: letterSpacing,
            // Set the font family to 'Poppins'
            fontWeight: boldValue),
        textAlign: centerAlignment ? TextAlign.center : TextAlign.left,
      ),
    );
  }
}
