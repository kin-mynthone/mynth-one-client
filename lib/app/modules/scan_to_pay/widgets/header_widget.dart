part of '../views/scan_to_pay_view.dart';

class _HeaderWidget extends GetView<ScanToPayController> {
  const _HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ButtonIconWidget(
          onPressed: () => {Get.back(closeOverlays: true)},
          size: 50,
          buttonColor: controller.getSystemTheme(context)
              ? AppColors.primaryTranslucent2
              : AppColors.primaryTranslucent2,
          splashColor: controller.getSystemTheme(context)
              ? AppColors.lightSecondaryVariant.withOpacity(0.30)
              : AppColors.darkSecondaryVariant.withOpacity(0.30),
          highlightColor: controller.getSystemTheme(context)
              ? AppColors.lightSecondaryVariant.withOpacity(0.15)
              : AppColors.darkSecondaryVariant.withOpacity(0.15),
          iconPath: AssetPath.cLeftArrow,
          iconColor: controller.getSystemTheme(context)
              ? AppColors.lightSecondaryVariant
              : AppColors.darkSecondaryVariant,
          borderRadius: AppNumbers.borderRadius,
        ),
        const SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
