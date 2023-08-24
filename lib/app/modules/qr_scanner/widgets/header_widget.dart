part of '../views/qr_scanner_view.dart';

class _HeaderWidget extends GetView<QrScannerController> {
  const _HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
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
          stringData: 'QR Scanner',
          fontSize: 20,
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
