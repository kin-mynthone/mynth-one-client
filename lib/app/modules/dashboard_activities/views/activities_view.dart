import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mynth_one_client/app/themes/app_colors.dart';
import 'package:mynth_one_client/app/widgets/text_widget.dart';

import '../../../models/activity_model.dart';
import '../controllers/activities_controller.dart';
import '../widgets/activity_card_widget.dart';

part '../widgets/header_widget.dart';
part '../widgets/activity_list_widget.dart';

class ActivitiesView extends GetView<ActivitiesController> {
  const ActivitiesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
                child: _HeaderWidget(),
              ),
              ButtonsTabBar(
                radius: 12,
                contentPadding: const EdgeInsets.symmetric(horizontal: 60),
                unselectedBackgroundColor: AppColors.h403E51,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        AppColors.hD9D3F9,
                        AppColors.hE4F9F6,
                      ],
                      stops: [
                        0.1,
                        0.5
                      ]),
                ),
                unselectedLabelStyle: const TextStyle(
                    color: AppColors.hF1F0FF,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Poppins',
                    fontSize: 12),
                labelStyle: const TextStyle(
                  color: AppColors.h403E51,
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                  fontFamily: 'Poppins',
                ),
                height: 56,
                onTap: (index) => {},
                tabs: const [
                  Tab(
                    text: "On Going",
                  ),
                  Tab(
                    text: "Complete",
                  ),
                ],
              ),
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
                  child: TabBarView(
                    children: [
                      _ActivityListWidget(
                        status: 'OnGoing',
                      ),
                      _ActivityListWidget(
                        status: 'Complete',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
