part of '../views/registration_view.dart';

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GoBackButton(
          iconColor: RegistrationController.instance.getSystemTheme(context)
              ? AppColors.lightPrimary
              : AppColors.darkPrimary,
          onPressed: () {
            if (RegistrationPageController.instance.currentIndex.isEqual(0)) {
              FocusScope.of(context).unfocus();
              Get.back(closeOverlays: true);
            } else {
              RegistrationPageController.instance.setCurrentIndexValue(0);
            }
          },
        ),
        const SizedBox(
          height: 15,
        ),
        TextWidget(
          stringData: 'quick sign up'.tr,
          fontSize: 28,
          boldValue: FontWeight.w800,
          color: RegistrationController.instance.getSystemTheme(context)
              ? AppColors.lightTextPrimary
              : AppColors.darkTextPrimary,
          centerAlignment: false,
        ),
        TextWidget(
          stringData: 'please provide all necessary information'.tr,
          fontSize: 15,
          boldValue: FontWeight.normal,
          color: RegistrationController.instance.getSystemTheme(context)
              ? AppColors.lightTextPrimary
              : AppColors.darkTextPrimary,
          centerAlignment: false,
        ),
      ],
    );
  }
}
