part of '../views/transfer_money_view.dart';

class _SecondPartWidget extends GetView<TransferMoneyController> {
  const _SecondPartWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: AppNumbers.screenPadding),
        child: FormBuilder(
          key: controller.formKey1,
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
                    children: [
                      SizedBox(
                        width: 45,
                        height: 45,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            controller.isBankSelected
                                ? controller.selectedBank.icon.toString()
                                : controller.selectedFavorite.icon.toString(),
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
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
                        width: 20,
                      ),
                      TextWidget(
                          overflow: false,
                          stringData: controller.isBankSelected
                              ? controller.selectedBank.title.toString()
                              : controller.selectedFavorite.bank.toString(),
                          fontSize:
                              screenWidth <= 428 && screenWidth > 390 ? 20 : 17,
                          boldValue: FontWeight.w500,
                          color: controller.getSystemTheme(context)
                              ? AppColors.lightTextPrimary
                              : AppColors.lightTextPrimary,
                          centerAlignment: false),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormWidget(
                  name: 'Account Name',
                  hintText: 'Enter Receiver\'s account name',
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
                  keyboardType: TextInputType.text,
                  controller: controller.accountNameController),
              const SizedBox(
                height: 30,
              ),
              TextFormWidget(
                  name: 'Account Number',
                  hintText: 'Enter Receiver\'s account number',
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
                  keyboardType: TextInputType.text,
                  controller: controller.accountNumberReceiverController),
              const SizedBox(
                height: 30,
              ),
              TextFormWidget(
                  name: 'Receiver\'s Email (Optional)',
                  hintText: 'Enter Receiver\'s email address',
                  isRequired: false,
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
                  keyboardType: TextInputType.text,
                  controller: controller.receiverEmailController),
              const SizedBox(
                height: 30,
              ),
              PrimaryButtonWidget(
                buttonText: 'Next',
                height: 50,
                fontSize: screenWidth <= 428 && screenWidth > 390 ? 15 : 12,
                boldValue: FontWeight.w800,
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
                      controller.formKey1.currentState?.validate() ?? false;
                  if (!isValidationSuccessful) {
                    return;
                  }

                  controller.setCurrentIndexValue(2);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
