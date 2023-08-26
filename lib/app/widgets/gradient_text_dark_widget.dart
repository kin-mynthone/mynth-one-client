// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynth_one_client/app/themes/app_colors.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class GradientTextDarkWidget extends StatelessWidget {
  final String stringData;
  final FontWeight boldValue;
  final double heightValue;
  final double fontSize;
  final bool centerAlignment;

  const GradientTextDarkWidget(
      {Key? key,
      required this.stringData,
      required this.fontSize,
      required this.boldValue,
      required this.centerAlignment,
      required this.heightValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: GradientText(
        stringData,
        style: GoogleFonts.poppins(
            height: heightValue, fontSize: fontSize, fontWeight: boldValue),
        textAlign: centerAlignment ? TextAlign.center : TextAlign.left,
        colors: const [
          AppColors.cyan, AppColors.lightPurple
          //add mroe colors here.
        ],
      ),
    );
  }
}
