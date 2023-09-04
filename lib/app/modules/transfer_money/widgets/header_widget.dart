part of '../views/transfer_money_view.dart';

class _HeaderWidget extends GetView<TransferMoneyController> {
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
            if (controller.currentIndex == 0) {
              controller.clearData();
              Get.back(closeOverlays: true);
            } else if (controller.currentIndex == 1) {
              controller.clearData();
              controller.setCurrentIndexValue(controller.currentIndex - 1);
            } else {
              controller.setCurrentIndexValue(controller.currentIndex - 1);
            }
          },
        ),
        const SizedBox(
          width: 20,
        ),
        TextWidget(
          stringData: 'Transfer Money',
          fontSize: screenWidth <= 428 && screenWidth > 390 ? 20 : 17,
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
