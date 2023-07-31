// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextWidget extends StatelessWidget {
  final String stringData;
  final bool boldValue;
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
    return Text(
      stringData,
      style: TextStyle(
          fontSize: fontSize,
          color: color,
          letterSpacing: letterSpacing,
          fontFamily: 'Poppins', // Set the font family to 'Poppins'
          fontWeight: boldValue ? FontWeight.w600 : FontWeight.normal),
      textAlign: centerAlignment ? TextAlign.center : TextAlign.left,
    );
  }
}
