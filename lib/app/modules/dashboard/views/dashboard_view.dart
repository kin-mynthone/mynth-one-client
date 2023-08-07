import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:mynth_one_client/app/helpers/asset_path_helper.dart';
import 'package:mynth_one_client/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:mynth_one_client/app/modules/dashboard_activities/views/activities_view.dart';
import 'package:mynth_one_client/app/modules/dashboard_banking/views/banking_view.dart';
import 'package:mynth_one_client/app/modules/dashboard_home/views/home_view.dart';
import 'package:mynth_one_client/app/modules/dashboard_notification/views/notification_view.dart';
import 'package:mynth_one_client/app/modules/dashboard_profile/views/profile_view.dart';
import 'package:mynth_one_client/app/themes/app_colors.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

  static const _views = <Widget>[
    HomeView(),
    ActivitiesView(),
    BankingView(),
    NotificationView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Obx _buildBody() {
    return Obx(() => _views[controller.currentIndex]);
  }

  Obx _buildBottomNavigationBar(BuildContext context) {
    return Obx(
      () => Container(
        padding: !Platform.isAndroid
            ? const EdgeInsets.only(bottom: 20)
            : const EdgeInsets.only(bottom: 5),
        decoration: const BoxDecoration(
          color: AppColors.h403E51,
        ),
        height: !Platform.isAndroid ? 100 : 60,
        child: CustomNavigationBar(
          currentIndex: controller.currentIndex,
          iconSize: 25.0,
          selectedColor: AppColors.hFBB810,
          strokeColor: AppColors.hFBB810,
          blurEffect: false,
          elevation: 0,
          unSelectedColor: AppColors.h9E9CAD,
          backgroundColor: Colors.transparent,
          onTap: (index) {
            controller.setCurrentIndexValue(index);
            FocusManager.instance.primaryFocus?.unfocus();
          },
          items: [
            CustomNavigationBarItem(
              icon: SizedBox(
                width: 150,
                height: 150,
                child: SvgPicture.asset(
                  AssetPath.dHome,
                  color: controller.currentIndex.isEqual(0)
                      ? AppColors.hFBB810
                      : AppColors.h9E9CAD,
                ),
              ),
              // title: const Text('Dashboard'),
            ),
            CustomNavigationBarItem(
              icon: SizedBox(
                width: 150,
                height: 150,
                child: SvgPicture.asset(
                  AssetPath.dActivities,
                  color: controller.currentIndex.isEqual(1)
                      ? AppColors.hFBB810
                      : AppColors.h9E9CAD,
                ),
              ),
              // title: const Text('Dashboard'),
            ),
            CustomNavigationBarItem(
              icon: SizedBox(
                width: 150,
                height: 150,
                child: SvgPicture.asset(
                  AssetPath.dBanking,
                  color: controller.currentIndex.isEqual(2)
                      ? AppColors.hFBB810
                      : AppColors.h9E9CAD,
                ),
              ),
              // title: const Text('Dashboard'),
            ),
            CustomNavigationBarItem(
              icon: SizedBox(
                width: 150,
                height: 150,
                child: SvgPicture.asset(
                  AssetPath.dNotifications,
                  color: controller.currentIndex.isEqual(3)
                      ? AppColors.hFBB810
                      : AppColors.h9E9CAD,
                ),
              ),
              // title: const Text('Dashboard'),
            ),
            CustomNavigationBarItem(
              icon: SizedBox(
                width: 150,
                height: 150,
                child: SvgPicture.asset(
                  AssetPath.dProfile,
                  color: controller.currentIndex.isEqual(4)
                      ? AppColors.hFBB810
                      : AppColors.h9E9CAD,
                ),
              ),
              // title: const Text('Dashboard'),
            ),
          ],
        ),
      ),
    );
  }
}
