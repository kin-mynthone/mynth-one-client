import 'package:get/get.dart';

import '../controllers/scan_to_pay_controller.dart';

class ScanToPayBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ScanToPayController());
  }
}
