import 'package:get/get.dart';

import '../controllers/activities_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.put(ActivitiesController());
  }
}
