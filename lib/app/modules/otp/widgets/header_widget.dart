part of '../views/otp_view.dart';

class _HeaderWidget extends GetView<OtpController> {
  const _HeaderWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(controller.getSystemTheme(context)
            ? AssetPath.oIllustrationLight
            : AssetPath.oIllustrationDark),
        const SizedBox(
          height: 20,
        ),
        TextWidget(
            stringData: 'OTP Verification',
            fontSize: 25,
            boldValue: FontWeight.w600,
            color: controller.getSystemTheme(context)
                ? AppColors.lightPrimary
                : AppColors.darkPrimary,
            centerAlignment: true),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextWidget(
                stringData: 'Enter OTP code sent to ',
                fontSize: 15,
                boldValue: FontWeight.normal,
                color: controller.getSystemTheme(context)
                    ? AppColors.lightTextPrimary
                    : AppColors.darkTextPrimary,
                centerAlignment: true),
            TextWidget(
                stringData: ' ${controller.getphoneNumber()}',
                fontSize: 15,
                boldValue: FontWeight.w600,
                letterSpacing: 2,
                color: controller.getSystemTheme(context)
                    ? AppColors.lightTextPrimary
                    : AppColors.darkTextPrimary,
                centerAlignment: true)
          ],
        )
      ],
    );
  }
}
