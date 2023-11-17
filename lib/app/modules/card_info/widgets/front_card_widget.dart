import 'package:flutter/material.dart';
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
                  overflow: false,
                  stringData: controller.cardInfo.accountName.toString(),
                  fontSize: screenWidth <= 428 && screenWidth > 390 ? 15 : 18,
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
                      overflow: false,
                      stringData: 'Your balance',
                      fontSize:
                          screenWidth <= 428 && screenWidth > 390 ? 14 : 15,
                      boldValue: FontWeight.w300,
                      color: AppColors.lightTextPrimary,
                      centerAlignment: false,
                    ),
                    const SizedBox(
                      height: 1,
                    ),
                    TextWidget(
                      overflow: false,
                      stringData: '€ ${controller.cardInfo.amount}',
                      fontSize:
                          screenWidth <= 428 && screenWidth > 390 ? 30 : 33,
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
                              overflow: false,
                              stringData: 'A/c Number',
                              fontSize: screenWidth <= 428 && screenWidth > 390
                                  ? 12
                                  : 13,
                              boldValue: FontWeight.w300,
                              color: AppColors.lightTextPrimary,
                              centerAlignment: false,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextWidget(
                              overflow: false,
                              stringData: controller.cardInfo.accountNumber
                                  .toString()
                                  .substring(8)
                                  .replaceRange(0, 3, '***'),
                              fontSize: screenWidth <= 428 && screenWidth > 390
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              overflow: false,
                              stringData: 'Valid Thu',
                              fontSize: screenWidth <= 428 && screenWidth > 390
                                  ? 12
                                  : 13,
                              boldValue: FontWeight.w300,
                              color: AppColors.lightTextPrimary,
                              centerAlignment: false,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextWidget(
                              overflow: false,
                              stringData:
                                  controller.cardInfo.expiration.toString(),
                              fontSize: screenWidth <= 428 && screenWidth > 390
                                  ? 12
                                  : 13,
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
                      child: SizedBox(
                        width:
                            screenWidth <= 428 && screenWidth > 390 ? 26 : 23,
                        height:
                            screenWidth <= 428 && screenWidth > 390 ? 26 : 23,
                        child: SvgPicture.asset(
                          AssetPath.cTurn,
                        ),
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
