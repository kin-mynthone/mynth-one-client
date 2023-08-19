import 'package:get/get.dart';
import 'package:mynth_one_client/app/modules/introduction/controllers/introduction_controller.dart';

class IntroductionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(IntroductionController());
  }
}
