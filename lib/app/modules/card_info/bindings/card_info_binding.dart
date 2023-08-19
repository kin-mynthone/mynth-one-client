import 'package:get/get.dart';
import 'package:mynth_one_client/app/modules/card_info/controllers/card_activities_controller.dart';

import '../controllers/card_info_controller.dart';

class CardInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CardInfoController());
    Get.put(CardActivitiesController());
  }
}
