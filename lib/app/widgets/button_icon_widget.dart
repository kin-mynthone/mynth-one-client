// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ButtonIconWidget extends StatelessWidget {
  final Function onPressed;
  final double size;
  final Color iconColor;
  final Color buttonColor;
  final Color splashColor;
  final Color highlightColor;
  final String iconPath;
  final double borderRadius;

  const ButtonIconWidget({
    Key? key,
    required this.onPressed,
    required this.size,
    required this.iconColor,
    required this.buttonColor,
    required this.splashColor,
    required this.highlightColor,
    required this.iconPath,
    required this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: buttonColor,
      borderRadius: BorderRadius.circular(borderRadius),
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius),
        splashColor: splashColor,
        highlightColor: highlightColor,
        onTap: () => onPressed(),
        child: SizedBox(
          width: size,
          height: size,
          child: Center(
            child: SizedBox(
              child: SvgPicture.asset(
                color: iconColor,
                iconPath,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
