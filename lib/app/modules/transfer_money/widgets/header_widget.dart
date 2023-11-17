part of '../views/transfer_money_view.dart';

class _HeaderWidget extends GetView<TransferMoneyController> {
  const _HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          controller.currentIndex != 4
              ? Row(
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
                          controller.setCurrentIndexValue(
                              controller.currentIndex - 1);
                        } else if (controller.currentIndex == 2) {
                          controller.setAccountNameSenderValue('');
                          controller.setAccountNumberSenderValue('');
                          controller.amountController.clear();

                          controller.setCurrentIndexValue(
                              controller.currentIndex - 1);
                        } else {
                          controller.setCurrentIndexValue(
                              controller.currentIndex - 1);
                        }
                      },
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                )
              : Container(),
          TextWidget(
            overflow: false,
            stringData: 'Transfer Money',
            fontSize: screenWidth <= 428 && screenWidth > 390 ? 20 : 23,
            boldValue: FontWeight.w500,
            color: controller.getSystemTheme(context)
                ? AppColors.lightTextPrimary
                : AppColors.darkTextPrimary,
            centerAlignment: false,
          ),
        ],
      ),
    );
  }
}
