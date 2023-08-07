import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mynth_one_client/app/constants/isometric_icon.dart';
import 'package:mynth_one_client/app/themes/app_colors.dart';
import 'package:mynth_one_client/app/widgets/gradient_text_widget.dart';
import 'package:mynth_one_client/app/widgets/text_widget.dart';

import '../../../models/activity_model.dart';

class ActivityCardWidget extends StatelessWidget {
  final Data activityModel;

  const ActivityCardWidget({super.key, required this.activityModel});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.topCenter,
            height: 160,
            child: Card(
              color: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
                //set border radius more than 50% of height and width to make circle
              ),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.06,
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GradientTextWidget(
                                stringData: activityModel.merchant.toString(),
                                fontSize: 18,
                                boldValue: true,
                                centerAlignment: false,
                                heightValue: 1.5,
                              ),
                              TextWidget(
                                stringData: '1min',
                                fontSize: 15,
                                boldValue: true,
                                color: AppColors.hF1F0FF,
                                centerAlignment: false,
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.only(right: 50),
                            child: TextWidget(
                              stringData: activityModel.description.toString(),
                              fontSize: 12,
                              boldValue: false,
                              color: AppColors.hF1F0FF,
                              centerAlignment: false,
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextWidget(
                            stringData: getTime(activityModel.timeStamp!),
                            fontSize: 12,
                            boldValue: false,
                            color: AppColors.hA9B9F2,
                            centerAlignment: false,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 10,
            child: Image.asset(
              width: 100,
              height: 100,
              IsometricIcon.myIcons[int.parse(
                activityModel.icon.toString(),
              )],
            ),
          )
        ],
      ),
    );
  }
}

String getTime(int timestamp) {
  var dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  var formattedDateTime = DateFormat('dd MMM yyyy, hh:mm aa').format(dateTime);
  return formattedDateTime;
}
