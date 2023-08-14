part of '../views/registration_view.dart';

class _PageIndicatorWidget extends GetView<RegistrationPageController> {
  const _PageIndicatorWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          stringData: 'personal info'.tr,
          fontSize: 15,
          boldValue: FontWeight.w700,
          color: RegistrationController.instance.getSystemTheme(context)
              ? AppColors.lightTextPrimary
              : AppColors.darkTextPrimary,
          centerAlignment: false,
        ),
        const SizedBox(
          height: 10,
        ),
        Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 15.0,
                  height: 15.0,
                  decoration: BoxDecoration(
                    color: controller.currentIndex.isEqual(0)
                        ? RegistrationController.instance
                                .getSystemTheme(context)
                            ? AppColors.lightPrimary
                            : AppColors.darkPrimary
                        : RegistrationController.instance
                                .getSystemTheme(context)
                            ? AppColors.lightGray
                            : AppColors.darkSecondary,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 15.0,
                  height: 15.0,
                  decoration: BoxDecoration(
                    color: controller.currentIndex.isEqual(1)
                        ? RegistrationController.instance
                                .getSystemTheme(context)
                            ? AppColors.lightPrimary
                            : AppColors.darkPrimary
                        : RegistrationController.instance
                                .getSystemTheme(context)
                            ? AppColors.lightGray
                            : AppColors.darkSecondary,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ))
      ],
    );
  }
}
