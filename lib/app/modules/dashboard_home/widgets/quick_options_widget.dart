part of '../views/home_view.dart';

class _QuickOptionsWidget extends GetView<HomeController> {
  const _QuickOptionsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PrimaryButtonWidget(
            buttonText: 'Request',
            height: 50,
            fontSize: 15,
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
          PrimaryButtonWidget(
            buttonText: 'Transfer',
            height: 50,
            fontSize: 15,
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
            onTap: () => {},
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
            borderRadius: 15,
          )
        ],
      ),
    );
  }
}
