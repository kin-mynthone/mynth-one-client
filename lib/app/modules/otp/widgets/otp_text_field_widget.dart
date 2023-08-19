part of '../views/otp_view.dart';

class _OtpTextFieldWidget extends GetView<OtpController> {
  const _OtpTextFieldWidget();

  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      numberOfFields: 4,
      fillColor: controller.getSystemTheme(context)
          ? AppColors.lightBackground
          : AppColors.darkBackground,
      filled: true,
      fieldWidth: 50,
      focusedBorderColor: controller.getSystemTheme(context)
          ? AppColors.lightPrimary
          : AppColors.darkPrimary,
      borderRadius: BorderRadius.circular(AppNumbers.inputBorderRadius),
      enabledBorderColor: controller.getSystemTheme(context)
          ? AppColors.lightBackground
          : AppColors.darkBackground,
      showFieldAsBox: true,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      textStyle: GoogleFonts.poppins(
        fontSize: 22,
        color: controller.getSystemTheme(context)
            ? AppColors.lightPrimary
            : AppColors.darkPrimary,
        fontWeight: FontWeight.w500,
      ),
      onSubmit: (String value) {
        // Will run when all 6 fields are filled in
        controller.setOtpInputValue(value);
      },
      onCodeChanged: (String value) {
        controller.resetOtpInputValue();
      },
    );
  }
}
