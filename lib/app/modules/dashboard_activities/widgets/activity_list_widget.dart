import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mynth_one_client/app/helpers/asset_path_helper.dart';
import 'package:mynth_one_client/app/models/activity_model.dart';
import 'package:mynth_one_client/app/themes/app_colors.dart';
import 'package:mynth_one_client/app/widgets/text_widget.dart';
import 'activity_card_data_holder_widget.dart';

class ActivityListWidget extends StatelessWidget {
  final List<Data> partialActivities;
  final int itemCount;

  const ActivityListWidget(
      {super.key, required this.partialActivities, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        child: itemCount.isEqual(0)
            ? const EmptyData()
            : ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: itemCount,
                itemBuilder: (BuildContext context, int index) {
                  return ActivityCardDataHolderWidget(
                    activityOnGoingModel: partialActivities[index],
                  );
                },
              ),
      ),
    );
  }
}

class EmptyData extends StatelessWidget {
  const EmptyData({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.only(bottom: 50),
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: size.width * 0.42,
            height: size.height * 0.25,
            child: const Image(
              image: AssetImage(AssetPath.aSearchingRobot),
              height: 100,
              width: 100,
            ),
          ),
          TextWidget(
            stringData: 'Nothing’s happening now',
            fontSize: 18,
            boldValue: true,
            color: AppColors.h9E9CAD,
            centerAlignment: false,
          ),
          TextWidget(
            stringData: 'Discover what’s new on the app',
            fontSize: 13,
            boldValue: false,
            color: AppColors.h9E9CAD,
            centerAlignment: false,
          ),
        ],
      ),
    );
  }
}
