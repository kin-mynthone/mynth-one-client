import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:mynth_one_client/app/helpers/asset_path_helper.dart';
import 'package:mynth_one_client/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:mynth_one_client/app/modules/dashboard_activities/views/activities_view.dart';
import 'package:mynth_one_client/app/modules/dashboard_home/views/home_view.dart';
import 'package:mynth_one_client/app/modules/dashboard_notification/views/notification_view.dart';
import 'package:mynth_one_client/app/modules/dashboard_profile/views/profile_view.dart';
import 'package:mynth_one_client/app/themes/app_colors.dart';

part '../widgets/bottom_navigation_bar_widget.dart';
part '../widgets/qr_button_widget.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

  static final _views = <Widget>[
    const HomeView(),
    const ActivitiesView(),
    Container(),
    const NotificationView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      floatingActionButton: const _QrButtonWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        color: controller.getSystemTheme(context)
            ? AppColors.lightBackgroundVariant
            : AppColors.darkBackgroundVariant,
        child: const _BottomNavigationBarWidget(),
      ),
    );
  }

  Obx _buildBody() {
    return Obx(() => _views[controller.currentIndex]);
  }
}
