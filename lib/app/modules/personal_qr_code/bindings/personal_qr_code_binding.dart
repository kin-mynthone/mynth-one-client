import 'package:get/get.dart';

import '../controllers/personal_qr_code_controller.dart';

class PersonalQrCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PersonalQrCodeController());
  }
}
