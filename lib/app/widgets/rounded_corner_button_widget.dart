import 'package:flutter/material.dart';
import 'package:mynth_one_client/app/themes/app_colors.dart';
import 'package:mynth_one_client/app/widgets/loading_indicator.dart';

class RoundedCornerButton extends StatelessWidget {
  const RoundedCornerButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.width = double.infinity,
    this.fontSize,
    this.height = 50,
    this.backgroundColor = AppColors.h031223,
    this.textColor = Colors.white,
    this.fontWeight = FontWeight.w600,
    this.isLoading = false,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String text;
  final double width;
  final double height;
  final double? fontSize;
  final Color backgroundColor;
  final Color textColor;
  final FontWeight fontWeight;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        minimumSize: Size(width, height),
        backgroundColor: backgroundColor,
      ),
      child: isLoading
          ? LoadingIndicator(size: height)
          : Text(
              text,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: textColor, fontWeight: fontWeight, fontSize: fontSize),
            ),
    );
  }
}
