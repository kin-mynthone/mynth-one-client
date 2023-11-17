import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:mynth_one_client/app/constants/app_numbers.dart';
import 'package:mynth_one_client/app/helpers/asset_path_helper.dart';
import 'package:mynth_one_client/app/modules/card_info/controllers/card_info_controller.dart';
import 'package:mynth_one_client/app/themes/app_colors.dart';
import 'package:mynth_one_client/app/widgets/text_widget.dart';

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
              height: 20,
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
                          overflow: false,
                          stringData: controller.isDetailsShown
                              ? controller.cardInfo.accountNumber.toString()
                              : controller.cardInfo.accountNumber
                                  .toString()
                                  .replaceRange(0, 12, '*** *** *** '),
                          fontSize:
                              screenWidth <= 428 && screenWidth > 390 ? 20 : 23,
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
                                overflow: false,
                                stringData: 'Valid Thu',
                                fontSize:
                                    screenWidth <= 428 && screenWidth > 390
                                        ? 12
                                        : 13,
                                boldValue: FontWeight.w300,
                                color: AppColors.lightTextPrimary,
                                centerAlignment: false,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              TextWidget(
                                overflow: false,
                                stringData:
                                    controller.cardInfo.expiration.toString(),
                                fontSize:
                                    screenWidth <= 428 && screenWidth > 390
                                        ? 13
                                        : 14,
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
                                overflow: false,
                                stringData: 'CVV',
                                fontSize:
                                    screenWidth <= 428 && screenWidth > 390
                                        ? 12
                                        : 13,
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
                                      overflow: false,
                                      stringData: CardInfoController
                                              .instance.isDetailsShown
                                          ? controller.cardInfo.cvv.toString()
                                          : '***',
                                      fontSize: screenWidth <= 428 &&
                                              screenWidth > 390
                                          ? 13
                                          : 14,
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
                        child: SizedBox(
                          width:
                              screenWidth <= 428 && screenWidth > 390 ? 26 : 23,
                          height:
                              screenWidth <= 428 && screenWidth > 390 ? 26 : 23,
                          child: SvgPicture.asset(
                            AssetPath.cTurn,
                          ),
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
