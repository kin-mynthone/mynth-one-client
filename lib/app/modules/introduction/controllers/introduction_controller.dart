import 'package:get/get.dart';
import 'package:mynth_one_client/app/routes/app_pages.dart';

class IntroductionController extends GetxController {
  goToLogin() {
    Get.offAllNamed(AppPages.LOGIN);
  }
}
