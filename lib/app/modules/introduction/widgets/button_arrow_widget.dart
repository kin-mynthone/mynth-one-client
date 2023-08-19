part of '../views/introduction_view.dart';

class _ButtonArrowWidget extends GetView<IntroductionController> {
  final Function onPressed;

  const _ButtonArrowWidget({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: controller.getSystemTheme(context)
          ? AppColors.lightPrimary
          : AppColors.darkPrimary,
      borderRadius: BorderRadius.circular(AppNumbers.cornerRadius),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppNumbers.cornerRadius),
        splashColor: controller.getSystemTheme(context)
            ? AppColors.lightSecondary.withOpacity(0.30)
            : AppColors.darkSecondary.withOpacity(0.30),
        highlightColor: controller.getSystemTheme(context)
            ? AppColors.lightSecondary.withOpacity(0.15)
            : AppColors.darkSecondary.withOpacity(0.15),
        onTap: () => onPressed(),
        child: SizedBox(
          width: 85,
          height: 85,
          child: Center(
              child: FaIcon(
            FontAwesomeIcons.arrowRight,
            color: controller.getSystemTheme(context)
                ? AppColors.lightSecondary
                : AppColors.darkSecondary,
          )),
        ),
      ),
    );
  }
}
