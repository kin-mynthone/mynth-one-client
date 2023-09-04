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
part '../widgets/body_widget.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Scaffold(
          body: _BodyWidget(),
          bottomNavigationBar: _BottomNavigationBarWidget(),
          floatingActionButton: _QrButtonWidget(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ),
      ],
    );
  }
}
