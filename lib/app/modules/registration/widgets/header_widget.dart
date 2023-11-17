part of '../views/registration_view.dart';

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget();

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

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
          overflow: false,
          stringData: 'quick sign up'.tr,
          fontSize: screenWidth <= 428 && screenWidth > 390 ? 28 : 30,
          boldValue: FontWeight.w800,
          color: RegistrationController.instance.getSystemTheme(context)
              ? AppColors.lightTextPrimary
              : AppColors.darkTextPrimary,
          centerAlignment: false,
        ),
        TextWidget(
          overflow: false,
          stringData: 'please provide all necessary information'.tr,
          fontSize: screenWidth <= 428 && screenWidth > 390 ? 15 : 16,
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
