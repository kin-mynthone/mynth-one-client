import 'package:get/get.dart';
import 'package:mynth_one_client/app/modules/login/controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(loginController());
  }
}
