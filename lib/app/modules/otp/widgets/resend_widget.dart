part of '../views/otp_view.dart';

class _ResendWidget extends GetView<OtpController> {
  const _ResendWidget();

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextWidget(
            stringData: 'Didn’t receive OTP code?',
            fontSize: screenWidth <= 428 && screenWidth > 390 ? 15 : 12,
            boldValue: FontWeight.normal,
            color: controller.getSystemTheme(context)
                ? AppColors.lightTextPrimary
                : AppColors.darkTextPrimary,
            centerAlignment: true),
        const SizedBox(
          height: 15,
        ),
        Obx(() => controller.resendEnabled
            ? SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: TextButton(
                  onPressed: () async {
                    FocusScope.of(context).unfocus();
                    controller.setResendEnabledValue(false);
                    await controller.requestOtp();
                  },
                  child: Column(
                    children: [
                      TextWidget(
                          stringData: 'Resend OTP',
                          fontSize:
                              screenWidth <= 428 && screenWidth > 390 ? 18 : 15,
                          boldValue: FontWeight.w800,
                          letterSpacing: 2,
                          color: controller.getSystemTheme(context)
                              ? AppColors.lightPrimary
                              : AppColors.darkPrimary,
                          centerAlignment: true),
                      Divider(
                        thickness: 1,
                        color: controller.getSystemTheme(context)
                            ? AppColors.lightPrimary
                            : AppColors.darkPrimary,
                      ),
                    ],
                  ),
                ),
              )
            : TextWidget(
                stringData: _timeFormater(controller.secondsRemaining),
                fontSize: screenWidth <= 428 && screenWidth > 390 ? 15 : 12,
                boldValue: FontWeight.w800,
                letterSpacing: 2,
                color: controller.getSystemTheme(context)
                    ? AppColors.lightPrimary
                    : AppColors.darkPrimary,
                centerAlignment: true)),
      ],
    );
  }
}

String _timeFormater(int secondsRemaining) {
  if (secondsRemaining.toString().length == 1) {
    return '00:0$secondsRemaining';
  }
  return '00:$secondsRemaining';
}
