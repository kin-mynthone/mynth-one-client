import 'package:get/get.dart';
import 'package:mynth_one_client/app/modules/registration/controllers/registration_controller.dart';
import 'package:mynth_one_client/app/modules/registration/controllers/registration_page_controller.dart';

class RegistrationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RegistrationController());
    Get.put(RegistrationPageController());
  }
}
