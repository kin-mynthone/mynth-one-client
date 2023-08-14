import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynth_one_client/app/helpers/asset_path_helper.dart';
import 'package:mynth_one_client/app/themes/app_colors.dart';

// ignore: must_be_immutable
class PrimaryButtonWidget extends StatelessWidget {
  String? buttonText = "Button Text";
  FontWeight? boldValue = FontWeight.w500;
  double? fontSize = 10;
  double? height = 10;
  String? iconPath = AssetPath.cMore;
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
      this.iconPath,
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
        splashColor: splashColor,
        highlightColor: splashColor,
        onTap: () => onTap(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          height: height,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              iconPath != null
                  ? SvgPicture.asset(
                      iconPath!,
                    )
                  : Container(),
              SizedBox(
                width: iconPath != null ? 10 : 0,
              ),
              Text(
                buttonText!,
                style: GoogleFonts.poppins(
                    fontSize: fontSize,
                    color: fontColor,
                    fontWeight: boldValue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
