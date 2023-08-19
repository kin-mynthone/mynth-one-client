import 'package:get/get.dart';

import '../controllers/dashboard_cards_controller.dart';

class DashboardCardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardCardController());
  }
}
