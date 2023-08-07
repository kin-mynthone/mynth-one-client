import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mynth_one_client/app/models/activity_model.dart';
import 'package:mynth_one_client/app/themes/app_colors.dart';
import 'package:mynth_one_client/app/widgets/text_widget.dart';

class ActivityCardDataWidget extends StatelessWidget {
  final Data activityCompleteModel;

  const ActivityCardDataWidget(
      {super.key, required this.activityCompleteModel});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Card(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
        //set border radius more than 50% of height and width to make circle
      ),
      child: Container(
        height: 90,
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.04,
          vertical: size.height * 0.03,
        ),
        decoration: BoxDecoration(
          color: AppColors.h403E51,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    stringData: activityCompleteModel.merchant.toString(),
                    fontSize: 13,
                    boldValue: true,
                    color: AppColors.hF1F0FF,
                    centerAlignment: false,
                  ),
                  TextWidget(
                    stringData: activityCompleteModel.status.toString(),
                    fontSize: 12,
                    boldValue: false,
                    color: AppColors.hA9B9F2,
                    centerAlignment: false,
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextWidget(
                  stringData: activityCompleteModel.debit!
                      ? '-${activityCompleteModel.amount}'
                      : '+${activityCompleteModel.amount}',
                  fontSize: 13,
                  boldValue: true,
                  color: AppColors.hF1F0FF,
                  centerAlignment: false,
                ),
                TextWidget(
                  stringData: getTime(activityCompleteModel.timeStamp!),
                  fontSize: 12,
                  boldValue: false,
                  color: AppColors.hA9B9F2,
                  centerAlignment: false,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

String getTime(int timestamp) {
  var dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  var formattedDateTime = DateFormat('hh:mm aa').format(dateTime);
  return formattedDateTime;
}
