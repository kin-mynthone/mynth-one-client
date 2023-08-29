part of '../views/scan_to_pay_view.dart';

class _BottomOptionsWidget extends GetView<ScanToPayController> {
  const _BottomOptionsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: screenWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ButtonIconWidget(
            onPressed: () => {},
            size: 70,
            buttonColor: controller.getSystemTheme(context)
                ? AppColors.primaryTranslucent2
                : AppColors.primaryTranslucent2,
            splashColor: controller.getSystemTheme(context)
                ? AppColors.lightSecondaryVariant.withOpacity(0.30)
                : AppColors.darkSecondaryVariant.withOpacity(0.30),
            highlightColor: controller.getSystemTheme(context)
                ? AppColors.lightSecondaryVariant.withOpacity(0.15)
                : AppColors.darkSecondaryVariant.withOpacity(0.15),
            iconPath: AssetPath.cUploadQr,
            iconColor: controller.getSystemTheme(context)
                ? AppColors.lightSecondaryVariant
                : AppColors.darkSecondaryVariant,
            borderRadius: AppNumbers.borderRadius,
          ),
          ButtonIconWidget(
            onPressed: () => {controller.goToPersonalQrCode()},
            size: 70,
            buttonColor: controller.getSystemTheme(context)
                ? AppColors.primaryTranslucent2
                : AppColors.primaryTranslucent2,
            splashColor: controller.getSystemTheme(context)
                ? AppColors.lightSecondaryVariant.withOpacity(0.30)
                : AppColors.darkSecondaryVariant.withOpacity(0.30),
            highlightColor: controller.getSystemTheme(context)
                ? AppColors.lightSecondaryVariant.withOpacity(0.15)
                : AppColors.darkSecondaryVariant.withOpacity(0.15),
            iconPath: AssetPath.cQrCode,
            iconColor: controller.getSystemTheme(context)
                ? AppColors.lightSecondaryVariant
                : AppColors.darkSecondaryVariant,
            borderRadius: AppNumbers.borderRadius,
          ),
        ],
      ),
    );
  }
}
