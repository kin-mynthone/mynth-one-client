import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynth_one_client/app/themes/app_colors.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.lightBackground,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColors.lightPrimary,
      secondary: AppColors.lightSecondary,
      brightness: Brightness.light,
    ),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.inter(
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: AppColors.lightTextPrimary,
        ),
      ),
      bodyMedium: GoogleFonts.montserrat(
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: AppColors.lightTextPrimary,
        ),
      ),
      bodySmall: GoogleFonts.jost(
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: AppColors.lightTextPrimary,
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
    appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 0,
      centerTitle: false,
      foregroundColor: AppColors.lightTextPrimary,
      titleTextStyle: GoogleFonts.montserrat(
        textStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: AppColors.lightTextPrimary,
        ),
      ),
    ),
    dividerTheme: const DividerThemeData(
      color: AppColors.lightTextPrimary,
      thickness: 2,
    ),
  );

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.darkBackground,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColors.darkPrimary,
      secondary: AppColors.darkSecondary,
      brightness: Brightness.dark,
    ),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.inter(
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: AppColors.darkTextPrimary,
        ),
      ),
      bodyMedium: GoogleFonts.montserrat(
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: AppColors.darkTextPrimary,
        ),
      ),
      bodySmall: GoogleFonts.jost(
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: AppColors.darkTextPrimary,
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
    appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 0,
      centerTitle: false,
      foregroundColor: AppColors.darkTextPrimary,
      titleTextStyle: GoogleFonts.montserrat(
        textStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: AppColors.darkTextPrimary,
        ),
      ),
    ),
    dividerTheme: const DividerThemeData(
      color: AppColors.darkTextPrimary,
      thickness: 2,
    ),
  );
}
