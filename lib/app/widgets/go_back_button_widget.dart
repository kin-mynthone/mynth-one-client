import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mynth_one_client/app/themes/app_colors.dart';

class GoBackButton extends StatelessWidget {
  const GoBackButton({
    Key? key,
    required this.onPressed,
    this.iconColor = AppColors.hF1F0FF,
  }) : super(key: key);

  final VoidCallback onPressed;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      tooltip: 'go back'.tr,
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      icon: Icon(
        LineIcons.arrowLeft,
        color: iconColor,
      ),
    );
  }
}
