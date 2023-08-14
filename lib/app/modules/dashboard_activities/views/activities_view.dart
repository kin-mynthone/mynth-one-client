import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
                unselectedBackgroundColor:
                    AppColors.darkPrimary, //TODO CHANGE COLOR,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        AppColors.darkPrimary, //TODO CHANGE COLOR,
                        AppColors.darkPrimary //TODO CHANGE COLOR,
                      ],
                      stops: [
                        0.1,
                        0.5
                      ]),
                ),
                unselectedLabelStyle: GoogleFonts.poppins(
                    color: AppColors.darkPrimary, //TODO CHANGE COLOR
                    fontWeight: FontWeight.w700,
                    fontSize: 12),
                labelStyle: GoogleFonts.poppins(
                    color: AppColors.darkPrimary, //TODO CHANGE COLOR,
                    fontWeight: FontWeight.w700,
                    fontSize: 12),
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
