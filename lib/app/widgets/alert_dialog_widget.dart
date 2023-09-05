import 'package:flutter/material.dart';
import 'package:mynth_one_client/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:mynth_one_client/app/themes/app_colors.dart';
import 'package:mynth_one_client/app/widgets/gradient_text_dark_widget.dart';
import 'package:mynth_one_client/app/widgets/gradient_text_light_widget.dart';

import 'primary_button_widget.dart';
import 'text_widget.dart';

class AlertDialogWidget extends StatelessWidget {
  final String title;
  final String message;
  final String emoji;
  final String buttonText;
  final Function onPressed;

  const AlertDialogWidget({
    super.key,
    required this.title,
    required this.message,
    required this.buttonText,
    required this.onPressed,
    required this.emoji,
  });

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Dialog(
      insetPadding: EdgeInsets.zero,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      backgroundColor: DashboardController.instance.getSystemTheme(context)
          ? AppColors.lightBackgroundNav
          : AppColors.darkBackgroundNav,
      child: SizedBox(
        width: screenWidth * 0.9,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 30, 40, 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GradientTextDarkWidget(
                stringData: emoji,
                fontSize: screenWidth <= 428 && screenWidth > 390 ? 20 : 17,
                boldValue: FontWeight.w800,
                heightValue: 1.2,
                centerAlignment: true,
              ),
              const SizedBox(height: 10),
              DashboardController.instance.getSystemTheme(context)
                  ? GradientTextLightWidget(
                      stringData: title,
                      fontSize:
                          screenWidth <= 428 && screenWidth > 390 ? 23 : 20,
                      boldValue: FontWeight.w700,
                      heightValue: 1.2,
                      centerAlignment: true,
                    )
                  : GradientTextDarkWidget(
                      stringData: title,
                      fontSize:
                          screenWidth <= 428 && screenWidth > 390 ? 23 : 20,
                      boldValue: FontWeight.w800,
                      heightValue: 1.2,
                      centerAlignment: true,
                    ),
              const SizedBox(height: 20),
              TextWidget(
                overflow: false,
                stringData: message,
                fontSize: screenWidth <= 428 && screenWidth > 390 ? 15 : 12,
                boldValue: FontWeight.w500,
                color: DashboardController.instance.getSystemTheme(context)
                    ? AppColors.lightTextPrimary
                    : AppColors.darkTextPrimary,
                centerAlignment: true,
              ),
              const SizedBox(height: 30),
              PrimaryButtonWidget(
                buttonText: buttonText,
                height: 50,
                fontSize: screenWidth <= 428 && screenWidth > 390 ? 15 : 12,
                boldValue: FontWeight.w700,
                fontColor: DashboardController.instance.getSystemTheme(context)
                    ? AppColors.lightSecondary
                    : AppColors.darkSecondary,
                buttonColor:
                    DashboardController.instance.getSystemTheme(context)
                        ? AppColors.lightPrimary
                        : AppColors.darkPrimary,
                splashColor:
                    DashboardController.instance.getSystemTheme(context)
                        ? AppColors.lightSecondary.withOpacity(0.30)
                        : AppColors.darkSecondary.withOpacity(0.30),
                highlightColor:
                    DashboardController.instance.getSystemTheme(context)
                        ? AppColors.lightSecondary.withOpacity(0.15)
                        : AppColors.darkSecondary.withOpacity(0.15),
                onTap: () => onPressed(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
