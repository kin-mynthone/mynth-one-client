import 'package:get/get.dart';

import '../controllers/dashboard_settings_controller.dart';

class DashboardSettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardSettingsController());
  }
}
