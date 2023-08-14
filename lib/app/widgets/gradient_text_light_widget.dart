// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynth_one_client/app/themes/app_colors.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class GradientTextLightWidget extends StatelessWidget {
  final String stringData;
  final FontWeight boldValue;
  final double heightValue;
  final double fontSize;
  final bool centerAlignment;

  const GradientTextLightWidget(
      {Key? key,
      required this.stringData,
      required this.fontSize,
      required this.boldValue,
      required this.centerAlignment,
      required this.heightValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GradientText(
      stringData,
      style: GoogleFonts.poppins(
          height: heightValue, fontSize: fontSize, fontWeight: boldValue),
      textAlign: centerAlignment ? TextAlign.center : TextAlign.left,
      colors: const [
        AppColors.darkPrimaryVariant, AppColors.darkPrimary
        //add mroe colors here.
      ],
    );
  }
}
