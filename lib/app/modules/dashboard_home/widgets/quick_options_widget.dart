part of '../views/dashboard_home_view.dart';

class _QuickOptionsWidget extends GetView<DashboardHomeController> {
  const _QuickOptionsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      width: screenWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PrimaryButtonWidget(
            buttonText: 'Request',
            height: 50,
            fontSize: screenWidth <= 428 && screenWidth > 390 ? 16 : 17,
            boldValue: FontWeight.w500,
            iconPath: AssetPath.cReceive,
            fontColor: controller.getSystemTheme(context)
                ? AppColors.lightTextPrimary
                : AppColors.darkTextPrimary,
            buttonColor: controller.getSystemTheme(context)
                ? AppColors.lightBackgroundVariant
                : AppColors.darkBackgroundVariant,
            splashColor: controller.getSystemTheme(context)
                ? AppColors.green.withOpacity(0.30)
                : AppColors.green.withOpacity(0.30),
            highlightColor: controller.getSystemTheme(context)
                ? AppColors.green.withOpacity(0.15)
                : AppColors.green.withOpacity(0.15),
            onTap: () => {},
          ),
          const SizedBox(
            width: 10,
          ),
          PrimaryButtonWidget(
            buttonText: 'Transfer',
            height: 50,
            fontSize: screenWidth <= 428 && screenWidth > 390 ? 16 : 17,
            boldValue: FontWeight.w500,
            iconPath: AssetPath.cTransfer,
            fontColor: controller.getSystemTheme(context)
                ? AppColors.lightTextPrimary
                : AppColors.darkTextPrimary,
            buttonColor: controller.getSystemTheme(context)
                ? AppColors.lightBackgroundVariant
                : AppColors.darkBackgroundVariant,
            splashColor: controller.getSystemTheme(context)
                ? AppColors.red.withOpacity(0.30)
                : AppColors.red.withOpacity(0.30),
            highlightColor: controller.getSystemTheme(context)
                ? AppColors.red.withOpacity(0.15)
                : AppColors.red.withOpacity(0.15),
            onTap: () => {controller.gotoTransferMoney()},
          ),
          const SizedBox(
            width: 10,
          ),
          ButtonIconWidget(
            onPressed: () => {},
            size: 50,
            buttonColor: controller.getSystemTheme(context)
                ? AppColors.lightPrimary
                : AppColors.darkPrimary,
            splashColor: controller.getSystemTheme(context)
                ? AppColors.lightSecondaryVariant.withOpacity(0.30)
                : AppColors.darkSecondaryVariant.withOpacity(0.30),
            highlightColor: controller.getSystemTheme(context)
                ? AppColors.lightSecondaryVariant.withOpacity(0.15)
                : AppColors.darkSecondaryVariant.withOpacity(0.15),
            iconPath: AssetPath.cMore,
            iconColor: controller.getSystemTheme(context)
                ? AppColors.lightSecondaryVariant
                : AppColors.darkSecondaryVariant,
            borderRadius: AppNumbers.borderRadius,
          )
        ],
      ),
    );
  }
}
