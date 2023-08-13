import 'package:flutter/material.dart';
import 'package:mynth_one_client/app/themes/app_colors.dart';

// ignore: must_be_immutable
class PrimaryButtonWidget extends StatelessWidget {
  String? buttonText = "Button Text";
  FontWeight? boldValue = FontWeight.w500;
  double? fontSize = 10;
  double? height = 10;
  Color? fontColor = AppColors.darkSecondary;
  Color? buttonColor = AppColors.darkPrimary;
  Color? splashColor = AppColors.darkSecondary;
  Color? highlightColor = AppColors.darkSecondary;

  Function onTap;

  PrimaryButtonWidget(
      {Key? key,
      this.buttonText,
      this.fontSize,
      this.boldValue,
      this.height,
      this.fontColor,
      this.buttonColor,
      this.splashColor,
      this.highlightColor,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const borderRadius = 10.0;

    return Material(
      color: buttonColor,
      borderRadius: BorderRadius.circular(borderRadius),
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius),
        splashColor: splashColor,
        highlightColor: splashColor,
        onTap: () => onTap(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          height: height,
          child: Center(
            child: Text(
              buttonText!,
              style: TextStyle(
                  fontSize: fontSize,
                  color: fontColor,
                  fontFamily: 'Poppins', // Set the font family to 'Poppins'
                  fontWeight: boldValue),
            ),
          ),
        ),
      ),
    );
  }
}


  // PrimaryButtonWidget(
  //                       buttonText: 'Register',
  //                       height: 60,
  //                       fontSize: 20,
  //                       FontWeight.w800 ,
  //                       fontColor: AppColors.darkPrimary,
  //                       buttonColor: AppColors.darkPrimary,
  //                       onTap: () => {controller.goToRegister()},
  //                     ),