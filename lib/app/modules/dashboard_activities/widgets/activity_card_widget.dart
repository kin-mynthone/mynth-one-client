import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mynth_one_client/app/themes/app_colors.dart';
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
                  color: AppColors.darkPrimary, //TODO CHANGE COLOR,
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
                              TextWidget(
                                stringData: '1min',
                                fontSize: 15,
                                boldValue: FontWeight.w800,
                                color:
                                    AppColors.darkPrimary, //TODO CHANGE COLOR,
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
                              boldValue: FontWeight.normal,
                              color: AppColors.darkPrimary, //TODO CHANGE COLOR,
                              centerAlignment: false,
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextWidget(
                            stringData: getTime(activityModel.timeStamp!),
                            fontSize: 12,
                            boldValue: FontWeight.normal,
                            color: AppColors.darkPrimary, //TODO CHANGE COLOR,
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
