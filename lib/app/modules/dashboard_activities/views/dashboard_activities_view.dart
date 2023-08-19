import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynth_one_client/app/constants/app_numbers.dart';
import 'package:mynth_one_client/app/themes/app_colors.dart';
import 'package:mynth_one_client/app/widgets/activity/activity_list_tile_widget.dart';
import 'package:mynth_one_client/app/widgets/text_widget.dart';

import '../../../models/activity_model.dart';
import '../controllers/dashboard_activities_controller.dart';

part '../widgets/header_widget.dart';
part '../widgets/activity_list_widget.dart';

class DashboardActivitiesView extends GetView<DashboardActivitiesController> {
  const DashboardActivitiesView({Key? key}) : super(key: key);

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
                padding: EdgeInsets.symmetric(
                    horizontal: AppNumbers.screenPadding,
                    vertical: AppNumbers.screenPadding),
                child: _HeaderWidget(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppNumbers.screenPadding,
                ),
                child: ButtonsTabBar(
                  radius: AppNumbers.borderRadius,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 50),
                  unselectedBackgroundColor: controller.getSystemTheme(context)
                      ? AppColors.lightSecondary
                      : AppColors.darkBackgroundVariant,
                  decoration: BoxDecoration(
                    color: controller.getSystemTheme(context)
                        ? AppColors.lightPrimary
                        : AppColors.darkPrimary,
                  ),
                  unselectedLabelStyle: GoogleFonts.poppins(
                      color: controller.getSystemTheme(context)
                          ? AppColors.lightTextHint
                          : AppColors.darkTextHint,
                      fontWeight: FontWeight.w700,
                      fontSize: 12),
                  labelStyle: GoogleFonts.poppins(
                      color: controller.getSystemTheme(context)
                          ? AppColors.lightSecondaryVariant
                          : AppColors.darkSecondaryVariant,
                      fontWeight: FontWeight.w700,
                      fontSize: 12),
                  height: 56,
                  onTap: (index) => {},
                  tabs: const [
                    Tab(
                      text: "Received",
                    ),
                    Tab(
                      text: "Transferred",
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
                  child: TabBarView(
                    children: [
                      _ActivityListWidget(
                        status: 'received',
                      ),
                      _ActivityListWidget(
                        status: 'transfer',
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
