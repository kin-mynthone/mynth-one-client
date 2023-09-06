part of '../views/transfer_money_view.dart';

class _FifthPartWidget extends GetView<TransferMoneyController> {
  const _FifthPartWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: AppNumbers.screenPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: controller.getSystemTheme(context)
                    ? AppColors.lightBackgroundVariant
                    : AppColors.darkBackgroundVariant,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: screenWidth,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          AppColors.lightPurple,
                          AppColors.cyan,
                        ],
                        stops: [0.2, 1],
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(AppNumbers.screenPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 45,
                                height: 45,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    controller.isBankSelected
                                        ? controller.selectedBank.icon
                                            .toString()
                                        : controller.selectedFavorite.icon
                                            .toString(),
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
                                      if (loadingProgress == null) {
                                        return child;
                                      }
                                      return Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: CircularProgressIndicator(
                                          value: loadingProgress
                                                      .expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                        ),
                                      );
                                    },
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Text('Error loading image');
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                      overflow: false,
                                      stringData:
                                          controller.accountNameController.text,
                                      fontSize: screenWidth <= 428 &&
                                              screenWidth > 390
                                          ? 20
                                          : 17,
                                      boldValue: FontWeight.w500,
                                      color: controller.getSystemTheme(context)
                                          ? AppColors.lightTextPrimary
                                          : AppColors.lightTextPrimary,
                                      centerAlignment: false),
                                  TextWidget(
                                      overflow: false,
                                      stringData: controller
                                          .insertSpaceAfterEvery4thCharacter(
                                              controller
                                                  .accountNumberReceiverController
                                                  .text),
                                      fontSize: screenWidth <= 428 &&
                                              screenWidth > 390
                                          ? 13
                                          : 12,
                                      letterSpacing: 3,
                                      boldValue: FontWeight.w400,
                                      color: controller.getSystemTheme(context)
                                          ? AppColors.lightTextPrimary
                                          : AppColors.lightTextPrimary,
                                      centerAlignment: false),
                                ],
                              ),
                            ],
                          ),
                          SvgPicture.asset(
                            AssetPath.cSuccess,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppNumbers.screenPadding),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                            overflow: false,
                            stringData: 'Deducted to',
                            fontSize: screenWidth <= 428 && screenWidth > 390
                                ? 16
                                : 13,
                            boldValue: FontWeight.w500,
                            color: controller.getSystemTheme(context)
                                ? AppColors.orange
                                : AppColors.orange,
                            centerAlignment: false),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              overflow: false,
                              stringData: controller.accountNameSender,
                              fontSize: screenWidth <= 428 && screenWidth > 390
                                  ? 16
                                  : 13,
                              boldValue: FontWeight.w600,
                              color: controller.getSystemTheme(context)
                                  ? AppColors.lightTextPrimary
                                  : AppColors.darkTextPrimary,
                              centerAlignment: false,
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            TextWidget(
                              overflow: false,
                              stringData: controller.accountNumberSender
                                  .toString()
                                  .substring(8)
                                  .replaceRange(0, 3, '***'),
                              fontSize: screenWidth <= 428 && screenWidth > 390
                                  ? 16
                                  : 13,
                              letterSpacing: 3,
                              boldValue: FontWeight.w400,
                              color: controller.getSystemTheme(context)
                                  ? AppColors.lightTextPrimary
                                  : AppColors.darkTextPrimary,
                              centerAlignment: false,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppNumbers.screenPadding),
                    child: SizedBox(
                      width: screenWidth,
                      child: const Divider(
                        thickness: 1,
                        color: AppColors.gray,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppNumbers.screenPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextWidget(
                            overflow: false,
                            stringData: 'Transferred amount',
                            fontSize: screenWidth <= 428 && screenWidth > 390
                                ? 16
                                : 13,
                            boldValue: FontWeight.w500,
                            color: controller.getSystemTheme(context)
                                ? AppColors.orange
                                : AppColors.orange,
                            centerAlignment: false),
                        TextWidget(
                            overflow: false,
                            stringData:
                                '€  ${controller.amountController.text}',
                            fontSize: screenWidth <= 428 && screenWidth > 390
                                ? 16
                                : 13,
                            boldValue: FontWeight.w500,
                            color: controller.getSystemTheme(context)
                                ? AppColors.gray
                                : AppColors.gray,
                            centerAlignment: false),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppNumbers.screenPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextWidget(
                            overflow: false,
                            stringData: 'Transfer fee',
                            fontSize: screenWidth <= 428 && screenWidth > 390
                                ? 16
                                : 13,
                            boldValue: FontWeight.w500,
                            color: controller.getSystemTheme(context)
                                ? AppColors.orange
                                : AppColors.orange,
                            centerAlignment: false),
                        TextWidget(
                            overflow: false,
                            stringData: '€ ${controller.transferFee}',
                            fontSize: screenWidth <= 428 && screenWidth > 390
                                ? 16
                                : 13,
                            boldValue: FontWeight.w500,
                            color: controller.getSystemTheme(context)
                                ? AppColors.gray
                                : AppColors.gray,
                            centerAlignment: false),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppNumbers.screenPadding),
                    child: SizedBox(
                      width: screenWidth,
                      child: const Divider(
                        thickness: 1,
                        color: AppColors.gray,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppNumbers.screenPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextWidget(
                            overflow: false,
                            stringData: 'Total',
                            fontSize: screenWidth <= 428 && screenWidth > 390
                                ? 16
                                : 13,
                            boldValue: FontWeight.w500,
                            color: controller.getSystemTheme(context)
                                ? AppColors.orange
                                : AppColors.orange,
                            centerAlignment: false),
                        TextWidget(
                            overflow: false,
                            stringData:
                                '€ ${int.parse(controller.amountController.text) + controller.transferFee}',
                            fontSize: screenWidth <= 428 && screenWidth > 390
                                ? 16
                                : 13,
                            boldValue: FontWeight.w500,
                            color: controller.getSystemTheme(context)
                                ? AppColors.gray
                                : AppColors.gray,
                            centerAlignment: false),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.1,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppNumbers.screenPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                            overflow: false,
                            stringData: 'Ref No. 1283 285 246295',
                            fontSize: screenWidth <= 428 && screenWidth > 390
                                ? 13
                                : 10,
                            boldValue: FontWeight.w500,
                            color: controller.getSystemTheme(context)
                                ? AppColors.lightTextPrimary
                                : AppColors.darkTextPrimary,
                            centerAlignment: false),
                        TextWidget(
                            overflow: false,
                            stringData: 'Apr 01, 2023  2:48PM',
                            fontSize: screenWidth <= 428 && screenWidth > 390
                                ? 13
                                : 10,
                            boldValue: FontWeight.w500,
                            color: controller.getSystemTheme(context)
                                ? AppColors.lightTextPrimary
                                : AppColors.darkTextPrimary,
                            centerAlignment: false),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            PrimaryButtonWidget(
              buttonText: 'Get a Copy',
              height: 50,
              fontSize: screenWidth <= 428 && screenWidth > 390 ? 16 : 13,
              boldValue: FontWeight.w500,
              fontColor: controller.getSystemTheme(context)
                  ? AppColors.lightSecondary
                  : AppColors.darkSecondary,
              buttonColor: controller.getSystemTheme(context)
                  ? AppColors.lightPrimary
                  : AppColors.darkPrimary,
              splashColor: controller.getSystemTheme(context)
                  ? AppColors.lightSecondary.withOpacity(0.30)
                  : AppColors.darkSecondary.withOpacity(0.30),
              highlightColor: controller.getSystemTheme(context)
                  ? AppColors.lightSecondary.withOpacity(0.15)
                  : AppColors.darkSecondary.withOpacity(0.15),
              onTap: () => {Get.back(closeOverlays: true)}, //todo get a copy
            ),
          ],
        ),
      ),
    );
  }
}
