import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mynth_one_client/app/constants/app_numbers.dart';
import 'package:mynth_one_client/app/models/activity_model.dart';
import 'package:mynth_one_client/app/themes/app_colors.dart';
import 'package:mynth_one_client/app/widgets/activity/activity_list_tile_widget.dart';
import 'package:mynth_one_client/app/widgets/cards/card_widget.dart';
import 'package:mynth_one_client/app/widgets/go_back_button_widget.dart';
import 'package:mynth_one_client/app/widgets/text_widget.dart';

import '../controllers/card_activities_controller.dart';
import '../controllers/card_info_controller.dart';
part '../widgets/header_widget.dart';
part '../widgets/activity_list_widget.dart';

class CardInfoView extends GetView<CardInfoController> {
  const CardInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: AppNumbers.screenPadding),
              child: _HeaderWidget(),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 225,
              width: size.width * 0.9,
              child: CardWidget(
                cardModel: controller.cardInfo,
                onTap: () => {},
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Obx(
              () => _ActivityListWidget(
                activitiesData:
                    CardActivitiesController.instance.activitiesData,
                itemCount:
                    CardActivitiesController.instance.activitiesData.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
