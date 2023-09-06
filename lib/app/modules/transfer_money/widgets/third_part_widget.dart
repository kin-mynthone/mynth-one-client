part of '../views/transfer_money_view.dart';

class _ThirdPartWidget extends GetView<TransferMoneyController> {
  const _ThirdPartWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: AppNumbers.screenPadding),
        child: FormBuilder(
          key: controller.formKey2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => GestureDetector(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          overflow: false,
                          stringData: 'Card',
                          fontSize:
                              screenWidth <= 428 && screenWidth > 390 ? 15 : 12,
                          boldValue: FontWeight.normal,
                          color: controller.getSystemTheme(context)
                              ? AppColors.lightTextPrimary
                              : AppColors.darkTextPrimary,
                          centerAlignment: false,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        controller.accountNameSender.isNotEmpty
                            ? Container(
                                width: screenWidth,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 10),
                                decoration: BoxDecoration(
                                  color: controller.getSystemTheme(context)
                                      ? AppColors.lightGreen
                                      : AppColors.lightGreen,
                                  border: Border.all(
                                    width: 1,
                                    color: controller.getSystemTheme(context)
                                        ? AppColors.green
                                        : AppColors.green,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWidget(
                                      overflow: false,
                                      stringData: controller.accountNameSender,
                                      fontSize: screenWidth <= 428 &&
                                              screenWidth > 390
                                          ? 18
                                          : 15,
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
                                      fontSize: screenWidth <= 428 &&
                                              screenWidth > 390
                                          ? 15
                                          : 12,
                                      letterSpacing: 3,
                                      boldValue: FontWeight.w400,
                                      color: controller.getSystemTheme(context)
                                          ? AppColors.lightTextPrimary
                                          : AppColors.darkTextPrimary,
                                      centerAlignment: false,
                                    ),
                                  ],
                                ),
                              )
                            : Container(
                                width: screenWidth,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 10),
                                decoration: BoxDecoration(
                                  color: controller.getSystemTheme(context)
                                      ? AppColors.primaryTranslucent
                                      : AppColors.primaryTranslucent,
                                  border: Border.all(
                                    width: 1,
                                    color: controller.getSystemTheme(context)
                                        ? AppColors.lightPrimary
                                        : AppColors.darkPrimary,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWidget(
                                      overflow: false,
                                      stringData:
                                          'What card do you wish to use?',
                                      fontSize: screenWidth <= 428 &&
                                              screenWidth > 390
                                          ? 15
                                          : 12,
                                      boldValue: FontWeight.normal,
                                      color: controller.getSystemTheme(context)
                                          ? AppColors.lightTextPrimary
                                          : AppColors.darkTextPrimary,
                                      centerAlignment: false,
                                    ),
                                  ],
                                ),
                              ),
                      ],
                    ),
                    onTap: () {
                      FocusScope.of(context).unfocus();

                      Future.delayed(const Duration(milliseconds: 250), () {
                        showMaterialModalBottomSheet(
                          expand: false,
                          context: context,
                          backgroundColor: Colors.transparent,
                          builder: (context) => const CardListModalWidget(),
                        );
                      });
                    }),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormWidget(
                  name: 'Amount',
                  hintText: 'Enter amount to transfer',
                  isRequired: true,
                  borderColor: controller.getSystemTheme(context)
                      ? AppColors.lightPrimary
                      : AppColors.darkPrimary,
                  nameColor: controller.getSystemTheme(context)
                      ? AppColors.lightTextPrimary
                      : AppColors.darkTextPrimary,
                  textColor: controller.getSystemTheme(context)
                      ? AppColors.lightPrimary
                      : AppColors.darkTextPrimary,
                  hintColor: controller.getSystemTheme(context)
                      ? AppColors.lightTextHint
                      : AppColors.darkTextHint,
                  fillColor: controller.getSystemTheme(context)
                      ? AppColors.lightBackground
                      : AppColors.darkBackground,
                  keyboardType: TextInputType.number,
                  controller: controller.amountController),
              const SizedBox(
                height: 30,
              ),
              PrimaryButtonWidget(
                buttonText: 'Next',
                height: 50,
                fontSize: screenWidth <= 428 && screenWidth > 390 ? 15 : 12,
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
                onTap: () async {
                  final isValidationSuccessful =
                      controller.formKey2.currentState?.validate() ?? false;
                  if (!isValidationSuccessful) {
                    return;
                  }

                  if (controller.accountNameSender.isEmpty &&
                      controller.accountNumberSender.isEmpty) {
                    showGeneralDialog(
                      barrierDismissible: true,
                      barrierLabel: '',
                      barrierColor: Colors.white54,
                      transitionDuration: const Duration(milliseconds: 100),
                      pageBuilder: (ctx, anim1, anim2) => AlertDialogWidget(
                        emoji: '📢 🔔 🚨',
                        title: 'Alert Message',
                        message: 'Kindly choose a card for this transaction.',
                        buttonText: 'Okey',
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          Navigator.of(context).pop();
                        },
                      ),
                      transitionBuilder: (ctx, anim1, anim2, child) =>
                          BackdropFilter(
                        filter: ImageFilter.blur(
                            sigmaX: 4 * anim1.value, sigmaY: 4 * anim1.value),
                        child: FadeTransition(
                          opacity: anim1,
                          child: child,
                        ),
                      ),
                      context: context,
                    );
                    return;
                  }

                  controller.setCurrentIndexValue(3);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
