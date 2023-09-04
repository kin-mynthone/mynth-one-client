import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mynth_one_client/app/constants/app_numbers.dart';
import 'package:mynth_one_client/app/modules/transfer_money/controllers/favorite_receiver_controller.dart';
import 'package:mynth_one_client/app/modules/transfer_money/widgets/bank_list_widget.dart';
import 'package:mynth_one_client/app/themes/app_colors.dart';
import 'package:mynth_one_client/app/widgets/go_back_button_widget.dart';
import 'package:mynth_one_client/app/widgets/primary_button_widget.dart';
import 'package:mynth_one_client/app/widgets/text_form_widget.dart';
import 'package:mynth_one_client/app/widgets/text_widget.dart';

import '../controllers/transfer_money_controller.dart';
import '../widgets/favorite_list_widget.dart';
part '../widgets/header_widget.dart';
part '../widgets/favorite_widget.dart';
part '../widgets/banks_widget.dart';

class TransferMoneyView extends GetView<TransferMoneyController> {
  const TransferMoneyView({Key? key}) : super(key: key);

  static const _views = <Widget>[
    _FirstPart(),
    _SecondPart(),
    _ThirdPart(),
    _ForthPart()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => SafeArea(
          right: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppNumbers.screenPadding,
                    vertical: AppNumbers.screenPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _HeaderWidget(),
                  ],
                ),
              ),
              Expanded(child: _views[controller.currentIndex])
            ],
          ),
        ),
      ),
    );
  }
}

class _FirstPart extends StatelessWidget {
  const _FirstPart({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FavoriteReceiverController.instance.favoriteReceiverData.length
                  .isEqual(0)
              ? Container()
              // ignore: prefer_const_constructors
              : Column(
                  children: const [
                    _FavoriteWidget(),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
          const Expanded(child: _BanksWidget())
        ],
      ),
    );
  }
}

class _SecondPart extends GetView<TransferMoneyController> {
  const _SecondPart({Key? key}) : super(key: key);
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
                      : AppColors.darkPrimary,
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
                      : AppColors.darkPrimary,
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
                      : AppColors.darkPrimary,
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

class _ThirdPart extends GetView<TransferMoneyController> {
  const _ThirdPart({Key? key}) : super(key: key);
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
                      : AppColors.darkPrimary,
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
                      controller.formKey2.currentState?.validate() ?? false;
                  if (!isValidationSuccessful) {
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

class _ForthPart extends GetView<TransferMoneyController> {
  const _ForthPart({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                              stringData: 'Recipient:',
                              fontSize: screenWidth <= 428 && screenWidth > 390
                                  ? 13
                                  : 10,
                              boldValue: FontWeight.w600,
                              color: controller.getSystemTheme(context)
                                  ? AppColors.lightTextPrimary
                                  : AppColors.lightTextPrimary,
                              centerAlignment: false),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                width: 20,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
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
                                      stringData: controller
                                          .accountNumberReceiverController.text,
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextWidget(
                            stringData: 'Your about to send',
                            fontSize: screenWidth <= 428 && screenWidth > 390
                                ? 16
                                : 13,
                            boldValue: FontWeight.w500,
                            color: controller.getSystemTheme(context)
                                ? AppColors.orange
                                : AppColors.orange,
                            centerAlignment: false),
                        TextWidget(
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

                  // Padding(
                  //   padding: const EdgeInsets.symmetric(
                  //       horizontal: AppNumbers.screenPadding),
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       TextWidget(
                  //           stringData: controller.accountNameSender,
                  //           fontSize: screenWidth <= 428 && screenWidth > 390
                  //               ? 20
                  //               : 17,
                  //           boldValue: FontWeight.w500,
                  //           color: controller.getSystemTheme(context)
                  //               ? AppColors.orange
                  //               : AppColors.orange,
                  //           centerAlignment: false),

                  //       TextWidget(
                  //           stringData: controller.accountNumberSender,
                  //           fontSize: screenWidth <= 428 && screenWidth > 390
                  //               ? 16
                  //               : 13,
                  //           boldValue: FontWeight.w500,
                  //           color: controller.getSystemTheme(context)
                  //               ? AppColors.gray
                  //               : AppColors.gray,
                  //           centerAlignment: false),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
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
              onTap: () => {controller.setCurrentIndexValue(3)},
            ),
          ],
        ),
      ),
    );
  }
}
