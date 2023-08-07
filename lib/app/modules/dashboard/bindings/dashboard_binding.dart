import 'package:get/get.dart';
import 'package:mynth_one_client/app/modules/dashboard_activities/controllers/activities_controller.dart';
import 'package:mynth_one_client/app/modules/dashboard_home/controllers/home_controller.dart';
import 'package:mynth_one_client/app/modules/dashboard_home/controllers/partial_activities_controller.dart';
import 'package:mynth_one_client/app/modules/dashboard_notification/controllers/notification_controller.dart';
import 'package:mynth_one_client/app/modules/dashboard_profile/controllers/profile_controller.dart';

import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController());
    Get.put(ActivitiesController());
    Get.put(HomeController());
    Get.put(PartialActivitiesController());
    Get.put(NotificationController());
    Get.put(ProfileController());
  }
}
