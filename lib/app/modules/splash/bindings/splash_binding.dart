import 'package:get/get.dart';
import 'package:mynth_one_client/app/modules/splash/controllers/auth_controller.dart';
import 'package:mynth_one_client/app/modules/splash/controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
    Get.put(AuthController(), permanent: true);
  }
}
