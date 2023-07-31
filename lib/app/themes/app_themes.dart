import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynth_one_client/app/constants/app_numbers.dart';
import 'package:mynth_one_client/app/themes/app_colors.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    primarySwatch: AppColors.materialPrussianBlue,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColors.h4A495E,
      secondary: AppColors.hA9B9F2,
      brightness: Brightness.light,
    ),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.inter(
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: AppColors.h031223,
        ),
      ),
      bodyMedium: GoogleFonts.montserrat(
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: AppColors.h031223,
        ),
      ),
      bodySmall: GoogleFonts.jost(
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: AppColors.h031223,
        ),
      ),
      labelLarge: GoogleFonts.inter(
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
      ),
      displaySmall: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: Colors.white,
      ),
    ),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 0,
      centerTitle: false,
      foregroundColor: AppColors.h031223,
      titleTextStyle: GoogleFonts.montserrat(
        textStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: AppColors.h031223,
        ),
      ),
    ),
    dividerTheme: const DividerThemeData(
      color: AppColors.h031223,
      thickness: 2,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      labelStyle: const TextStyle(color: AppColors.hBDBDBD),
      floatingLabelStyle: const TextStyle(color: AppColors.h4A495E),
      fillColor: AppColors.hF6F6F6,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppNumbers.inputBorderRadius),
        borderSide: const BorderSide(color: AppColors.hD9D3F9, width: 2.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppNumbers.inputBorderRadius),
        borderSide: const BorderSide(color: AppColors.hD3D3D3, width: 1.0),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppNumbers.inputBorderRadius),
        borderSide: const BorderSide(color: Colors.red, width: 1.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppNumbers.inputBorderRadius),
        borderSide: const BorderSide(
          color: Colors.red,
          width: 2.0,
        ),
      ),
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.h4A495E,
    textTheme: GoogleFonts.poppinsTextTheme(),
  );
}
