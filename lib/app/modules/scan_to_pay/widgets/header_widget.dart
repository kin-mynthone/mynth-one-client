part of '../views/scan_to_pay_view.dart';

class _HeaderWidget extends GetView<ScanToPayController> {
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
          stringData: 'Scan to Pay',
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
