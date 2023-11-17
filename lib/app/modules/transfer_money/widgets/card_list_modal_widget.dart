import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mynth_one_client/app/constants/app_numbers.dart';
import 'package:mynth_one_client/app/modules/transfer_money/controllers/transfer_money_controller.dart';
import 'package:mynth_one_client/app/modules/transfer_money/widgets/card_list_widget.dart';
import 'package:mynth_one_client/app/themes/app_colors.dart';
import 'package:mynth_one_client/app/widgets/text_widget.dart';

class CardListModalWidget extends GetView<TransferMoneyController> {
  const CardListModalWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: screenHeight,
      width: screenWidth,
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 5.0,
          sigmaY: 5.0,
        ),
        child: Container(
          padding: EdgeInsets.only(
            top: screenHeight * 0.15,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(30),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      Navigator.of(context).pop();
                    },
                    tooltip: 'Hide Dialog',
                    padding: EdgeInsets.zero,
                    alignment: Alignment.center,
                    constraints: const BoxConstraints(),
                    icon: Icon(
                      FontAwesomeIcons.circleXmark,
                      size: 30,
                      color: controller.getSystemTheme(context)
                          ? AppColors.lightTextPrimary
                          : AppColors.darkTextPrimary,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: screenWidth,
                  padding: EdgeInsets.only(
                    top: screenHeight * 0.05,
                  ),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 10,
                        ),
                      ],
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(AppNumbers.cornerRadius),
                          topRight: Radius.circular(AppNumbers.cornerRadius)),
                      color: controller.getSystemTheme(context)
                          ? AppColors.lightBackgroundNav
                          : AppColors.darkBackgroundNav),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            TextWidget(
                                overflow: false,
                                stringData: 'What card you wish to use?',
                                fontSize:
                                    screenWidth <= 428 && screenWidth > 390
                                        ? 20
                                        : 23,
                                boldValue: FontWeight.w500,
                                color: controller.getSystemTheme(context)
                                    ? AppColors.lightTextPrimary
                                    : AppColors.darkTextPrimary,
                                centerAlignment: false),
                            TextWidget(
                                overflow: false,
                                stringData:
                                    'Choose a card that you want to use for this transaction',
                                fontSize:
                                    screenWidth <= 428 && screenWidth > 390
                                        ? 15
                                        : 18,
                                boldValue: FontWeight.w500,
                                color: controller.getSystemTheme(context)
                                    ? AppColors.lightTextPrimary
                                    : AppColors.darkTextPrimary,
                                centerAlignment: true),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                      const CardListWidget(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
