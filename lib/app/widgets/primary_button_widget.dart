import 'package:flutter/material.dart';
import 'package:mynth_one_client/app/themes/app_colors.dart';

// ignore: must_be_immutable
class PrimaryButtonWidget extends StatelessWidget {
  String? buttonText = "Button Text";
  bool? boldValue = false;
  double? fontSize = 10;
  double? height = 10;
  Color? fontColor = AppColors.darkPrimary;
  Color? buttonColor = AppColors.darkPrimary;
  Function onTap;

  PrimaryButtonWidget(
      {Key? key,
      this.buttonText,
      this.fontSize,
      this.boldValue,
      this.fontColor,
      this.height,
      this.buttonColor,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const borderRadius = 15.0;

    return Material(
      color: buttonColor,
      borderRadius: BorderRadius.circular(borderRadius),
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius),
        splashColor: AppColors.darkPrimary.withOpacity(0.30),
        highlightColor: AppColors.darkPrimary.withOpacity(0.15),
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
                  fontWeight: boldValue! ? FontWeight.w600 : FontWeight.normal),
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
  //                       boldValue: true,
  //                       fontColor: AppColors.darkPrimary,
  //                       buttonColor: AppColors.darkPrimary,
  //                       onTap: () => {controller.goToRegister()},
  //                     ),