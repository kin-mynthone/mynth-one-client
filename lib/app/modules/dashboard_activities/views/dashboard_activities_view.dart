import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynth_one_client/app/constants/app_numbers.dart';
import 'package:mynth_one_client/app/themes/app_colors.dart';
import 'package:mynth_one_client/app/widgets/activity_list_tile_widget.dart';
import 'package:mynth_one_client/app/widgets/text_widget.dart';

import '../../../models/activity_model.dart';
import '../controllers/dashboard_activities_controller.dart';

part '../widgets/header_widget.dart';
part '../widgets/activity_list_widget.dart';

class DashboardActivitiesView extends StatefulWidget {
  const DashboardActivitiesView({Key? key}) : super(key: key);

  @override
  State<DashboardActivitiesView> createState() =>
      _DashboardActivitiesViewState();
}

class _DashboardActivitiesViewState extends State<DashboardActivitiesView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _HeaderWidget(
            tabController: _tabController,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: TabBarView(
                controller: _tabController,
                children: const [
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
    );
  }
}
