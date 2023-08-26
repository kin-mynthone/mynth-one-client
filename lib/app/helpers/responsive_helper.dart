import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobileSmall;
  final Widget mobileMedium;
  final Widget mobileBig;
  final Widget tablet;

  const Responsive({
    Key? key,
    required this.mobileSmall,
    required this.mobileMedium,
    required this.mobileBig,
    required this.tablet,
  }) : super(key: key);

  static bool isMobileSmall(BuildContext context) =>
      MediaQuery.of(context).size.width <= 375;

  static bool isMobileMedium(BuildContext context) =>
      MediaQuery.of(context).size.width <= 390 &&
      MediaQuery.of(context).size.width > 375;

  static bool isMobileLarge(BuildContext context) =>
      MediaQuery.of(context).size.width <= 428 &&
      MediaQuery.of(context).size.width > 390;

  static bool isMobileBig(BuildContext context) =>
      MediaQuery.of(context).size.width <= 480 &&
      MediaQuery.of(context).size.width > 428;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 640;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // If width it less then 1100 and more then 810 we consider it as tablet
    if (size.width >= 810) {
      return tablet;
    }
    // If width it less then 810 and more then 428  consider as mobileBig
    else if (size.width < 810 && size.width > 428) {
      return mobileBig;
    }
    // If width it less then 428 and more then 375  consider as mobileMedium
    else if (size.width < 428 && size.width > 375) {
      return mobileMedium;
    }
    // Or less then that we called it mobile
    else {
      return mobileSmall;
    }
  }
}
