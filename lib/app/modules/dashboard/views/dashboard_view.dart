import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:mynth_one_client/app/constants/app_numbers.dart';
import 'package:mynth_one_client/app/helpers/asset_path_helper.dart';
import 'package:mynth_one_client/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:mynth_one_client/app/modules/dashboard_activities/views/dashboard_activities_view.dart';
import 'package:mynth_one_client/app/modules/dashboard_cards/views/dashboard_cards_view.dart';
import 'package:mynth_one_client/app/modules/dashboard_home/views/dashboard_home_view.dart';
import 'package:mynth_one_client/app/modules/dashboard_settings/views/dashboard_settings_view.dart';
import 'package:mynth_one_client/app/routes/app_pages.dart';
import 'package:mynth_one_client/app/themes/app_colors.dart';

part '../widgets/bottom_navigation_bar_widget.dart';
part '../widgets/qr_button_widget.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

  static final _views = <Widget>[
    const DashboardHomeView(),
    const DashboardCardView(),
    Container(),
    const DashboardActivitiesView(),
    const DashboardSettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      floatingActionButton: const _QrButtonWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Obx(
        () => Container(
          color: controller.currentIndex == 0
              ? controller.getSystemTheme(context)
                  ? AppColors.lightBackgroundVariant
                  : AppColors.darkBackgroundVariant
              : Colors.transparent,
          child: const _BottomNavigationBarWidget(),
        ),
      ),
    );
  }

  Obx _buildBody() {
    return Obx(() => _views[controller.currentIndex]);
  }
}
