// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mynth_one_client/app/constants/app_numbers.dart';

import 'package:mynth_one_client/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:mynth_one_client/app/themes/app_colors.dart';
import 'package:mynth_one_client/app/widgets/activity/activity_list_tile_widget.dart';
import 'package:mynth_one_client/app/widgets/text_widget.dart';

import '../../models/activity_model.dart';

class ActivityListWidget extends StatelessWidget {
  final int itemCount;
  final bool showViewAll;
  final VoidCallback? ontapShowAll;

  final List<Data> activitiesData;

  const ActivityListWidget({
    Key? key,
    required this.itemCount,
    required this.showViewAll,
    this.ontapShowAll,
    required this.activitiesData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(AppNumbers.cornerRadius),
              topRight: Radius.circular(AppNumbers.cornerRadius)),
          color: DashboardController.instance.getSystemTheme(context)
              ? AppColors.lightBackgroundVariant
              : AppColors.darkBackgroundVariant),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 30, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextWidget(
                    stringData: 'Activities',
                    fontSize: 20,
                    boldValue: FontWeight.w700,
                    color: DashboardController.instance.getSystemTheme(context)
                        ? AppColors.lightTextPrimary
                        : AppColors.darkTextPrimary,
                    centerAlignment: false),
                showViewAll
                    ? TextButton(
                        onPressed: () async {
                          ontapShowAll;
                          FocusScope.of(context).unfocus();
                        },
                        child: TextWidget(
                            stringData: 'View All',
                            fontSize: 13,
                            boldValue: FontWeight.w300,
                            color: DashboardController.instance
                                    .getSystemTheme(context)
                                ? AppColors.lightTextSecondary
                                : AppColors.darkTextSecondary,
                            centerAlignment: false),
                      )
                    : Container(),
              ],
            ),
          ),
          Container(
            height: 300,
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: itemCount.isEqual(0)
                ? Center(
                    child: _EmptyData(
                      color:
                          DashboardController.instance.getSystemTheme(context)
                              ? AppColors.lightTextPrimary
                              : AppColors.darkTextPrimary,
                    ),
                  )
                : _FadingListViewWidget(
                    dataLength: itemCount,
                    activities: activitiesData,
                  ),
          ),
        ],
      ),
    );
  }
}

class _FadingListViewWidget extends StatelessWidget {
  final int dataLength;
  final List<Data> activities;
  const _FadingListViewWidget(
      {required this.dataLength, required this.activities});
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
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            itemCount: dataLength,
            itemBuilder: (context, index) {
              return ActivityListTileWidget(
                activityModel: activities[index],
                tileOnTap: () {},
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 5),
          ),
        ),
      ),
    );
  }
}

class _EmptyData extends StatelessWidget {
  final Color color;
  const _EmptyData({
    required this.color,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextWidget(
          stringData: 'No Activity to show',
          fontSize: 15,
          boldValue: FontWeight.w800,
          color: color,
          centerAlignment: false,
        ),
        TextWidget(
          stringData: 'Start your first activity now',
          fontSize: 10,
          boldValue: FontWeight.normal,
          color: color,
          centerAlignment: false,
        ),
      ],
    );
  }
}
