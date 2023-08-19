import 'package:get/get.dart';
import 'package:mynth_one_client/app/modules/dashboard_activities/controllers/dashboard_activities_controller.dart';
import 'package:mynth_one_client/app/modules/dashboard_cards/controllers/dashboard_cards_controller.dart';
import 'package:mynth_one_client/app/modules/dashboard_home/controllers/dashboard_home_controller.dart';
import 'package:mynth_one_client/app/modules/dashboard_home/controllers/snippet_activities_controller.dart';
import 'package:mynth_one_client/app/modules/dashboard_settings/controllers/dashboard_settings_controller.dart';
import 'package:mynth_one_client/app/modules/notification/controllers/notification_controller.dart';
import 'package:mynth_one_client/app/modules/profile/controllers/profile_controller.dart';

import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController());
    Get.put(DashboardHomeController());
    Get.put(DashboardCardController());
    Get.put(DashboardActivitiesController());
    Get.put(DashboardSettingsController());

    Get.put(SnippetActivitiesController());
    Get.put(NotificationController());
    Get.put(ProfileController());
  }
}
