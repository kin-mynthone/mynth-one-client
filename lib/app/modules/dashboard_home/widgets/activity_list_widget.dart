import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mynth_one_client/app/modules/dashboard_home/controllers/partial_activities_controller.dart';
import 'package:mynth_one_client/app/themes/app_colors.dart';
import 'package:mynth_one_client/app/widgets/text_widget.dart';

import '../../../models/activity_model.dart';
import 'activity_card_widget.dart';

class ActivityListWidget extends GetView<PartialActivitiesController> {
  const ActivityListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: 250,
        padding: const EdgeInsets.only(bottom: 5),
        child: controller.activitiesData.length.isEqual(0)
            ? const EmptyData()
            : FadingListViewWidget(
                dataLength: controller.activitiesData.length,
                activities: controller.activitiesData,
              ),
      ),
    );
  }
}

class EmptyData extends StatelessWidget {
  const EmptyData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextWidget(
          stringData: 'No Activity to show',
          fontSize: 15,
          boldValue: true,
          color: AppColors.h9E9CAD,
          centerAlignment: false,
        ),
        TextWidget(
          stringData: 'Start your first activity now',
          fontSize: 10,
          boldValue: false,
          color: AppColors.h9E9CAD,
          centerAlignment: false,
        ),
      ],
    );
  }
}

class FadingListViewWidget extends StatelessWidget {
  final int dataLength;
  final List<Data> activities;
  const FadingListViewWidget(
      {super.key, required this.dataLength, required this.activities});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ShaderMask(
        shaderCallback: (Rect rect) {
          return const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.purple,
              Colors.transparent,
              Colors.transparent,
              Colors.purple
            ],
            stops: [
              0.0,
              0.1,
              0.9,
              1.0
            ], // 10% purple, 80% transparent, 10% purple
          ).createShader(rect);
        },
        blendMode: BlendMode.dstOut,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: dataLength,
          itemBuilder: (BuildContext context, int index) {
            return ActivityCardDataWidget(
                activityCompleteModel: activities[index]);
          },
        ),
      ),
    );
  }
}
