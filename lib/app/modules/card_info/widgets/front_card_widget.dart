import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:mynth_one_client/app/constants/app_numbers.dart';
import 'package:mynth_one_client/app/helpers/asset_path_helper.dart';
import 'package:mynth_one_client/app/modules/card_info/controllers/card_info_controller.dart';
import 'package:mynth_one_client/app/themes/app_colors.dart';
import 'package:mynth_one_client/app/widgets/text_widget.dart';

class FrontCardWidget extends GetView<CardInfoController> {
  const FrontCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Card(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppNumbers.cardBorderRadius),
      ),
      child: Container(
        height: 500,
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05,
          vertical: screenHeight * 0.022,
        ),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(19, 0, 0, 0),
              blurRadius: 8.0,
              spreadRadius: 1,
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(controller.cardInfo.startColor!),
              Color(controller.cardInfo.endColor!),
            ],
            stops: const [0.2, 1],
          ),
          borderRadius: BorderRadius.circular(AppNumbers.cardBorderRadius),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextWidget(
                  stringData: controller.cardInfo.accountName.toString(),
                  fontSize: 15,
                  boldValue: FontWeight.w500,
                  color: AppColors.lightTextPrimary,
                  centerAlignment: false,
                ),
                SvgPicture.asset(AssetPath.cVisa),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      stringData: 'Your balance',
                      fontSize: 14,
                      boldValue: FontWeight.w300,
                      color: AppColors.lightTextPrimary,
                      centerAlignment: false,
                    ),
                    const SizedBox(
                      height: 1,
                    ),
                    TextWidget(
                      stringData: '€ ${controller.cardInfo.amount}',
                      fontSize: 30,
                      boldValue: FontWeight.w600,
                      color: AppColors.darkPrimary,
                      centerAlignment: false,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              stringData: 'A/c Number',
                              fontSize: 12,
                              boldValue: FontWeight.w300,
                              color: AppColors.lightTextPrimary,
                              centerAlignment: false,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextWidget(
                              stringData: controller.cardInfo.accountNumber
                                  .toString()
                                  .substring(8)
                                  .replaceRange(0, 3, '***'),
                              fontSize: 13,
                              letterSpacing: 3,
                              boldValue: FontWeight.w400,
                              color: AppColors.lightTextPrimary,
                              centerAlignment: false,
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              stringData: 'Valid Thu',
                              fontSize: 12,
                              boldValue: FontWeight.w300,
                              color: AppColors.lightTextPrimary,
                              centerAlignment: false,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextWidget(
                              stringData:
                                  controller.cardInfo.expiration.toString(),
                              fontSize: 13,
                              letterSpacing: 3,
                              boldValue: FontWeight.w400,
                              color: AppColors.lightTextPrimary,
                              centerAlignment: false,
                            ),
                          ],
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () => {
                        controller.cardKey.currentState?.toggleCard(),
                        controller.setIsBackCardShown(true)
                      },
                      child: SvgPicture.asset(
                        AssetPath.cTurn,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BackCardWidget extends GetView<CardInfoController> {
  const BackCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Card(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppNumbers.cardBorderRadius),
      ),
      child: Container(
        height: 500,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(19, 0, 0, 0),
              blurRadius: 8.0,
              spreadRadius: 1,
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(controller.cardInfo.startColor!),
              Color(controller.cardInfo.endColor!),
            ],
            stops: const [0.2, 1],
          ),
          borderRadius: BorderRadius.circular(AppNumbers.cardBorderRadius),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  right: screenWidth * 0.05,
                  top: screenHeight * 0.022,
                  bottom: 10),
              child: Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () => {controller.setIsDetailsShown()},
                    child: Obx(
                      () => SvgPicture.asset(
                        controller.isDetailsShown
                            ? AssetPath.lEyeOpen
                            : AssetPath.lEyeClose,
                      ),
                    ),
                  )),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      AppColors.gray,
                      AppColors.lightSecondaryVariant,
                      AppColors.gray,
                    ],
                    stops: [
                      -0.5,
                      0.5,
                      1.2,
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: screenWidth * 0.05,
                  left: screenWidth * 0.05,
                  top: 10,
                  bottom: screenHeight * 0.022),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Obx(
                        () => TextWidget(
                          stringData: controller.isDetailsShown
                              ? controller.cardInfo.accountNumber.toString()
                              : controller.cardInfo.accountNumber
                                  .toString()
                                  .replaceRange(0, 12, '*** *** *** '),
                          fontSize: 20,
                          letterSpacing: 3,
                          boldValue: FontWeight.w400,
                          color: AppColors.lightTextPrimary,
                          centerAlignment: false,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      GestureDetector(
                        onTap: () async {
                          await Clipboard.setData(ClipboardData(
                              text: controller.cardInfo.accountNumber
                                  .toString()));
                          // copied successfully
                        },
                        child: SvgPicture.asset(
                          AssetPath.cCopy,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                stringData: 'Valid Thu',
                                fontSize: 12,
                                boldValue: FontWeight.w300,
                                color: AppColors.lightTextPrimary,
                                centerAlignment: false,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              TextWidget(
                                stringData:
                                    controller.cardInfo.expiration.toString(),
                                fontSize: 13,
                                letterSpacing: 3,
                                boldValue: FontWeight.w400,
                                color: AppColors.lightTextPrimary,
                                centerAlignment: false,
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextWidget(
                                stringData: 'CVV',
                                fontSize: 12,
                                boldValue: FontWeight.w300,
                                color: AppColors.lightTextPrimary,
                                centerAlignment: false,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: AppColors.lightPrimary,
                                  borderRadius: BorderRadius.circular(
                                      AppNumbers.cardBorderRadius),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: Obx(() => TextWidget(
                                      stringData: CardInfoController
                                              .instance.isDetailsShown
                                          ? controller.cardInfo.cvv.toString()
                                          : '***',
                                      fontSize: 13,
                                      letterSpacing: 3,
                                      boldValue: FontWeight.w400,
                                      color: AppColors.lightSecondaryVariant,
                                      centerAlignment: true,
                                    )),
                              ),
                            ],
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () => {
                          controller.cardKey.currentState?.toggleCard(),
                          controller.setIsBackCardShown(false)
                        },
                        child: SvgPicture.asset(
                          AssetPath.cTurn,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
