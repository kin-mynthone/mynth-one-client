import 'package:get/get.dart';

import '../controllers/dashboard_activities_controller.dart';

class DashboardActivitiesBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardActivitiesController());
  }
}
