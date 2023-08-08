import 'package:get/get.dart';
import 'package:mynth_one_client/app/modules/otp/controllers/otp_controller.dart';

class OtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OtpController());
  }
}
