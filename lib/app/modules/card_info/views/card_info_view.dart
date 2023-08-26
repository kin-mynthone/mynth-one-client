import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mynth_one_client/app/constants/app_numbers.dart';
import 'package:mynth_one_client/app/helpers/asset_path_helper.dart';
import 'package:mynth_one_client/app/models/activity_model.dart';
import 'package:mynth_one_client/app/themes/app_colors.dart';
import 'package:mynth_one_client/app/widgets/activity_list_tile_widget.dart';
import 'package:mynth_one_client/app/widgets/go_back_button_widget.dart';
import 'package:mynth_one_client/app/widgets/primary_button_widget.dart';
import 'package:mynth_one_client/app/widgets/text_widget.dart';

import '../controllers/card_activities_controller.dart';
import '../controllers/card_info_controller.dart';
import '../widgets/card_flip_widget.dart';
part '../widgets/header_widget.dart';
part '../widgets/activity_list_widget.dart';

class CardInfoView extends GetView<CardInfoController> {
  const CardInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(AppNumbers.screenPadding),
                child: _HeaderWidget(),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 225,
                width: screenWidth * 0.9,
                child: const CardFlipWidget(),
              ),
              const SizedBox(
                height: 30,
              ),
              controller.isBackCardShown
                  ? const _BlockThisCardWidget()
                  : const _ActivityWidget()
            ],
          ),
        ),
      ),
    );
  }
}

class _ActivityWidget extends GetView<CardInfoController> {
  const _ActivityWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => _ActivityListWidget(
        activitiesData: CardActivitiesController.instance.activitiesData,
        itemCount: CardActivitiesController.instance.activitiesData.length,
      ),
    );
  }
}

class _BlockThisCardWidget extends GetView<CardInfoController> {
  const _BlockThisCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppNumbers.screenPadding),
      child: Column(
        children: [
          PrimaryButtonWidget(
            buttonText: 'Block THIS CARD',
            height: 50,
            fontSize: screenWidth <= 428 && screenWidth > 390 ? 16 : 13,
            boldValue: FontWeight.w500,
            iconPath: AssetPath.cCross,
            fontColor: controller.getSystemTheme(context)
                ? AppColors.lightTextPrimary
                : AppColors.lightTextPrimary,
            buttonColor: AppColors.lightGray,
            splashColor: controller.getSystemTheme(context)
                ? AppColors.gray.withOpacity(0.30)
                : AppColors.gray.withOpacity(0.30),
            highlightColor: controller.getSystemTheme(context)
                ? AppColors.gray.withOpacity(0.15)
                : AppColors.gray.withOpacity(0.15),
            onTap: () => {},
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height: 30,
                  width: 30,
                  child: SvgPicture.asset(
                    AssetPath.cInfo,
                  )),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                child: TextWidget(
                  stringData:
                      'Once blocked, this card will no longer be accepted for online payments or for over the counter transaction. This action cannot be undone.',
                  fontSize: screenWidth <= 428 && screenWidth > 390 ? 13 : 11,
                  boldValue: FontWeight.w500,
                  color: controller.getSystemTheme(context)
                      ? AppColors.gray
                      : AppColors.gray,
                  centerAlignment: false,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
