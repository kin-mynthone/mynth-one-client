part of '../views/transfer_money_view.dart';

class _ForthPartWidget extends StatefulWidget {
  const _ForthPartWidget({Key? key}) : super(key: key);

  @override
  State<_ForthPartWidget> createState() => _ForthPartWidgetState();
}

class _ForthPartWidgetState extends State<_ForthPartWidget> {
  late Worker _statusListener;
  final transferMoneyController = TransferMoneyController.instance;
  final localAuthController = Get.put(LocalAuthController());

  @override
  void initState() {
    super.initState();
    _setUpStatusListener();
  }

  @override
  void dispose() {
    _statusListener.dispose();
    super.dispose();
  }

  void _setUpStatusListener() {
    final statusRx = localAuthController.statusRx;
    _statusListener = ever(
      statusRx,
      (value) {
        if (value == LocalAuthStatus.noAuthSetup) {}
        if (value == LocalAuthStatus.authenticated) {
          transferMoneyController.setCurrentIndexValue(4);
        }
        if (value == LocalAuthStatus.failed) {}
        if (value == LocalAuthStatus.error) {}
      },
    );
  }

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
                color: transferMoneyController.getSystemTheme(context)
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                              overflow: false,
                              stringData: 'Recipient:',
                              fontSize: screenWidth <= 428 && screenWidth > 390
                                  ? 13
                                  : 10,
                              boldValue: FontWeight.w600,
                              color: transferMoneyController
                                      .getSystemTheme(context)
                                  ? AppColors.lightTextPrimary
                                  : AppColors.lightTextPrimary,
                              centerAlignment: false),
                          const SizedBox(
                            height: 10,
                          ),
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
                                    transferMoneyController.isBankSelected
                                        ? transferMoneyController
                                            .selectedBank.icon
                                            .toString()
                                        : transferMoneyController
                                            .selectedFavorite.icon
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
                                      stringData: transferMoneyController
                                          .accountNameController.text,
                                      fontSize: screenWidth <= 428 &&
                                              screenWidth > 390
                                          ? 20
                                          : 17,
                                      boldValue: FontWeight.w500,
                                      color: transferMoneyController
                                              .getSystemTheme(context)
                                          ? AppColors.lightTextPrimary
                                          : AppColors.lightTextPrimary,
                                      centerAlignment: false),
                                  TextWidget(
                                      overflow: false,
                                      stringData: transferMoneyController
                                          .insertSpaceAfterEvery4thCharacter(
                                              transferMoneyController
                                                  .accountNumberReceiverController
                                                  .text),
                                      fontSize: screenWidth <= 428 &&
                                              screenWidth > 390
                                          ? 13
                                          : 12,
                                      letterSpacing: 3,
                                      boldValue: FontWeight.w400,
                                      color: transferMoneyController
                                              .getSystemTheme(context)
                                          ? AppColors.lightTextPrimary
                                          : AppColors.lightTextPrimary,
                                      centerAlignment: false),
                                ],
                              ),
                            ],
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
                            stringData: 'Will be deducted to',
                            fontSize: screenWidth <= 428 && screenWidth > 390
                                ? 16
                                : 13,
                            boldValue: FontWeight.w500,
                            color:
                                transferMoneyController.getSystemTheme(context)
                                    ? AppColors.orange
                                    : AppColors.orange,
                            centerAlignment: false),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              overflow: false,
                              stringData:
                                  transferMoneyController.accountNameSender,
                              fontSize: screenWidth <= 428 && screenWidth > 390
                                  ? 16
                                  : 13,
                              boldValue: FontWeight.w600,
                              color: transferMoneyController
                                      .getSystemTheme(context)
                                  ? AppColors.lightTextPrimary
                                  : AppColors.darkTextPrimary,
                              centerAlignment: false,
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            TextWidget(
                              overflow: false,
                              stringData: transferMoneyController
                                  .accountNumberSender
                                  .toString()
                                  .substring(8)
                                  .replaceRange(0, 3, '***'),
                              fontSize: screenWidth <= 428 && screenWidth > 390
                                  ? 16
                                  : 13,
                              letterSpacing: 3,
                              boldValue: FontWeight.w400,
                              color: transferMoneyController
                                      .getSystemTheme(context)
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
                            stringData: 'Your about to send',
                            fontSize: screenWidth <= 428 && screenWidth > 390
                                ? 16
                                : 13,
                            boldValue: FontWeight.w500,
                            color:
                                transferMoneyController.getSystemTheme(context)
                                    ? AppColors.orange
                                    : AppColors.orange,
                            centerAlignment: false),
                        TextWidget(
                            overflow: false,
                            stringData:
                                '€  ${transferMoneyController.amountController.text}',
                            fontSize: screenWidth <= 428 && screenWidth > 390
                                ? 16
                                : 13,
                            boldValue: FontWeight.w500,
                            color:
                                transferMoneyController.getSystemTheme(context)
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
                            color:
                                transferMoneyController.getSystemTheme(context)
                                    ? AppColors.orange
                                    : AppColors.orange,
                            centerAlignment: false),
                        TextWidget(
                            overflow: false,
                            stringData:
                                '€ ${transferMoneyController.transferFee}',
                            fontSize: screenWidth <= 428 && screenWidth > 390
                                ? 16
                                : 13,
                            boldValue: FontWeight.w500,
                            color:
                                transferMoneyController.getSystemTheme(context)
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
                            color:
                                transferMoneyController.getSystemTheme(context)
                                    ? AppColors.orange
                                    : AppColors.orange,
                            centerAlignment: false),
                        TextWidget(
                            overflow: false,
                            stringData:
                                '€ ${int.parse(transferMoneyController.amountController.text) + transferMoneyController.transferFee}',
                            fontSize: screenWidth <= 428 && screenWidth > 390
                                ? 16
                                : 13,
                            boldValue: FontWeight.w500,
                            color:
                                transferMoneyController.getSystemTheme(context)
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
                    child: TextWidget(
                        overflow: false,
                        stringData:
                            'Please make sure the information above is correct. Submitted transaction cannot be reversed.',
                        fontSize:
                            screenWidth <= 428 && screenWidth > 390 ? 13 : 10,
                        boldValue: FontWeight.w500,
                        color: transferMoneyController.getSystemTheme(context)
                            ? AppColors.orange
                            : AppColors.orange,
                        centerAlignment: false),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            PrimaryButtonWidget(
              buttonText:
                  'Pay "€ ${int.parse(transferMoneyController.amountController.text) + transferMoneyController.transferFee}"',
              height: 50,
              fontSize: screenWidth <= 428 && screenWidth > 390 ? 16 : 13,
              boldValue: FontWeight.w500,
              fontColor: transferMoneyController.getSystemTheme(context)
                  ? AppColors.lightSecondary
                  : AppColors.darkSecondary,
              buttonColor: transferMoneyController.getSystemTheme(context)
                  ? AppColors.lightPrimary
                  : AppColors.darkPrimary,
              splashColor: transferMoneyController.getSystemTheme(context)
                  ? AppColors.lightSecondary.withOpacity(0.30)
                  : AppColors.darkSecondary.withOpacity(0.30),
              highlightColor: transferMoneyController.getSystemTheme(context)
                  ? AppColors.lightSecondary.withOpacity(0.15)
                  : AppColors.darkSecondary.withOpacity(0.15),
              onTap: () =>
                  {LocalAuthController.instance.authenticateUser(context)},
            ),
          ],
        ),
      ),
    );
  }
}
