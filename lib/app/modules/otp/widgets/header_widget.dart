part of '../views/otp_view.dart';

class _HeaderWidget extends GetView<OtpController> {
  const _HeaderWidget();

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: screenWidth * 0.6,
          child: Image.asset(controller.getSystemTheme(context)
              ? AssetPath.oIllustrationLight
              : AssetPath.oIllustrationDark),
        ),
        const SizedBox(
          height: 20,
        ),
        TextWidget(
            overflow: false,
            stringData: 'OTP Verification',
            fontSize: screenWidth <= 428 && screenWidth > 390 ? 25 : 28,
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
                overflow: false,
                stringData: 'Enter OTP code sent to ',
                fontSize: screenWidth <= 428 && screenWidth > 390 ? 15 : 18,
                boldValue: FontWeight.normal,
                color: controller.getSystemTheme(context)
                    ? AppColors.lightTextPrimary
                    : AppColors.darkTextPrimary,
                centerAlignment: true),
            TextWidget(
                overflow: false,
                stringData: ' ${controller.getphoneNumber()}',
                fontSize: screenWidth <= 428 && screenWidth > 390 ? 15 : 18,
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
