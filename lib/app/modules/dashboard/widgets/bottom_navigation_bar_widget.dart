part of '../views/dashboard_view.dart';

class _BottomNavigationBarWidget extends GetView<DashboardController> {
  const _BottomNavigationBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: !Platform.isAndroid
            ? const EdgeInsets.only(bottom: 20)
            : const EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppNumbers.cornerRadius),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(20, 0, 0, 0),
              blurRadius: AppNumbers.borderRadius,
              spreadRadius: 1,
            ),
          ],
          color: controller.getSystemTheme(context)
              ? AppColors.lightBackgroundNav
              : AppColors.darkBackgroundNav,
        ),
        height: !Platform.isAndroid ? 100 : 60,
        child: CustomNavigationBar(
          currentIndex: controller.currentIndex,
          iconSize: 25.0,
          selectedColor: controller.getSystemTheme(context)
              ? AppColors.lightPrimary
              : AppColors.darkPrimary,
          strokeColor: controller.getSystemTheme(context)
              ? AppColors.lightPrimary
              : AppColors.darkPrimary,
          blurEffect: false,
          elevation: 0,
          unSelectedColor: controller.getSystemTheme(context)
              ? AppColors.lightSecondary
              : AppColors.darkSecondary,
          backgroundColor: Colors.transparent,
          onTap: (index) {
            if (index != 2) {
              controller.setCurrentIndexValue(index);
              FocusManager.instance.primaryFocus?.unfocus();
            }
          },
          items: [
            CustomNavigationBarItem(
              icon: SvgPicture.asset(
                AssetPath.dHome,
                color: controller.currentIndex.isEqual(0)
                    ? controller.getSystemTheme(context)
                        ? AppColors.lightPrimary
                        : AppColors.darkPrimary
                    : controller.getSystemTheme(context)
                        ? AppColors.lightsecondaryTranslucent
                        : AppColors.darksecondaryTranslucent,
              ),
            ),
            CustomNavigationBarItem(
              icon: SvgPicture.asset(
                AssetPath.dCards,
                color: controller.currentIndex.isEqual(1)
                    ? controller.getSystemTheme(context)
                        ? AppColors.lightPrimary
                        : AppColors.darkPrimary
                    : controller.getSystemTheme(context)
                        ? AppColors.lightsecondaryTranslucent
                        : AppColors.darksecondaryTranslucent,
              ),
            ),
            CustomNavigationBarItem(icon: Container()),
            CustomNavigationBarItem(
              icon: SvgPicture.asset(
                AssetPath.dActivities,
                color: controller.currentIndex.isEqual(3)
                    ? controller.getSystemTheme(context)
                        ? AppColors.lightPrimary
                        : AppColors.darkPrimary
                    : controller.getSystemTheme(context)
                        ? AppColors.lightsecondaryTranslucent
                        : AppColors.darksecondaryTranslucent,
              ),
            ),
            CustomNavigationBarItem(
              icon: SvgPicture.asset(
                AssetPath.dSettings,
                color: controller.currentIndex.isEqual(4)
                    ? controller.getSystemTheme(context)
                        ? AppColors.lightPrimary
                        : AppColors.darkPrimary
                    : controller.getSystemTheme(context)
                        ? AppColors.lightsecondaryTranslucent
                        : AppColors.darksecondaryTranslucent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
