part of '../views/introduction_view.dart';

class _ButtonArrowWidget extends GetView<IntroductionController> {
  final Function onPressed;

  const _ButtonArrowWidget({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    const borderRadius = 30.0;

    return Material(
      color: controller.checkSystemTheme(context)
          ? AppColors.lightPrimary
          : AppColors.darkPrimary,
      borderRadius: BorderRadius.circular(borderRadius),
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius),
        splashColor: controller.checkSystemTheme(context)
            ? AppColors.lightSecondary.withOpacity(0.30)
            : AppColors.darkSecondary.withOpacity(0.30),
        highlightColor: controller.checkSystemTheme(context)
            ? AppColors.lightSecondary.withOpacity(0.15)
            : AppColors.darkSecondary.withOpacity(0.15),
        onTap: () => onPressed(),
        child: SizedBox(
          width: 85,
          height: 85,
          child: Center(
              child: FaIcon(
            FontAwesomeIcons.arrowRight,
            color: controller.checkSystemTheme(context)
                ? AppColors.lightSecondary
                : AppColors.darkSecondary,
          )),
        ),
      ),
    );
  }
}
