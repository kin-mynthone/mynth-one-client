part of '../views/personal_qr_code_view.dart';

class _HeaderWidget extends GetView<PersonalQrCodeController> {
  const _HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GoBackButton(
          iconColor: controller.getSystemTheme(context)
              ? AppColors.lightPrimary
              : AppColors.darkPrimary,
          onPressed: () {
            Get.back(closeOverlays: true);
          },
        ),
        const SizedBox(
          width: 20,
        ),
        TextWidget(
          overflow: false,
          stringData: 'Personal Qr Code',
          fontSize: screenWidth <= 428 && screenWidth > 390 ? 20 : 23,
          boldValue: FontWeight.w500,
          color: controller.getSystemTheme(context)
              ? AppColors.lightTextPrimary
              : AppColors.darkTextPrimary,
          centerAlignment: false,
        ),
      ],
    );
  }
}
